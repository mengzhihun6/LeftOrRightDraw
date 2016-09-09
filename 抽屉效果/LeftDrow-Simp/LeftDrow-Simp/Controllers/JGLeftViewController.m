//
//  JGLeftViewController.m
//  LeftDrow-Simp
//
//  Created by stkcctv on 16/9/9.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGLeftViewController.h"
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width

@interface JGLeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tbv;

/** 数据源  */
@property (nonatomic, strong)NSArray *dataArr;

@end

@implementation JGLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景色
    self.tbv.backgroundColor = [UIColor clearColor];
     _dataArr = @[@"开通会员",@"QQ钱包",@"网上营业厅",@"个性装扮",@"我的收藏",@"我的相册",@"我的文件"];
    //控制分割线的显示与隐藏
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 150)];
    self.tbv.tableHeaderView =headerV;
    self.tbv.tableFooterView = [[UIView alloc] init];
    self.tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#define mark - 数据源懒加载


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //1.3如果代理方实现了协议方法就调用协议方法
    if ([self.delegate respondsToSelector:@selector(showChangeData:)]) {
        
        [self.delegate showChangeData:_dataArr[indexPath.row]];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
