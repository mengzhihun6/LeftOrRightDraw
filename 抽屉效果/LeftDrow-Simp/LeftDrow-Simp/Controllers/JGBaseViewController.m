//
//  JGBaseViewController.m
//  LeftDrow-Simp
//
//  Created by stkcctv on 16/9/9.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGBaseViewController.h"
#import "JGLeftViewController.h"
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width


@interface JGBaseViewController () {
    JGLeftViewController *left; // 做抽屉视图控制器必须定义成成员变量或属性变量。与搜索控制器类似
    BOOL isShow; // 抽屉状态
}

@end

@implementation JGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 自定义导航项
    UINavigationItem *navItem = self.navigationItem;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"抽屉" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick:)];
    navItem.leftBarButtonItem = item;
}

- (void)btnClick:(UIBarButtonItem *)item {
    
    if (isShow) {
        // 抽屉当前是打开的，那么就关闭
        [UIView animateWithDuration:1.0f animations:^{
            
            CGPoint pt = self.tabBarController.view.center; // 先取出分栏控制器视图的中心点
            pt.x -= kDeviceWidth * 0.9;
            // 更新到ui
            self.tabBarController.view.center = pt;
            
        }];
        
        isShow = NO;// 将抽屉的状态改为关闭
        
    }
    else {
        // 抽屉是关的
        [UIView animateWithDuration:1.0f animations:^{
            CGPoint pt = self.tabBarController.view.center;
            pt.x += kDeviceWidth * 0.9;
            self.tabBarController.view.center = pt;
            
        }];
        
        isShow = YES;
    }
    
}

// 实现页面显示到屏幕上的方法，在该方法中可获得window,注意viewdidload方法中window是空的
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 先取出抽屉视图，以防止该方法多次执行多次添加，在此处会做非空判断
    UIView *uvDrawer = [self.view.window viewWithTag:999];
    if (uvDrawer == nil) {
        // 还没有添加抽屉视图
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        left = [story instantiateViewControllerWithIdentifier:@"left"];
        [self.view.window insertSubview:left.view atIndex:0];
        left.view.tag = 999;
        left.mainController = self;
        
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
