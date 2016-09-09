//
//  ViewController.m
//  LeftRightDrow
//
//  Created by stkcctv on 16/9/9.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ViewController.h"
#import "YellowView.h"
#import "GreenView.h"
#import "BlueView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHight [UIScreen mainScreen].bounds.size.height

#define kMax 60

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YellowView *YView;
@property (weak, nonatomic) IBOutlet BlueView *BView;
@property (weak, nonatomic) IBOutlet GreenView *GView;

@property (nonatomic,assign) CGFloat offsetX;
@property (nonatomic,assign) BOOL isDraging;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子视图
    [self createSubViews];
}

#pragma mark - 创建子视图 -
- (void)createSubViews {
    
    GreenView *GV = [GreenView greenView];
    GV.frame = self.view.bounds;
    [self.view addSubview:GV];
    self.GView = GV;
    
    BlueView *BV = [BlueView blueView];
    BV.frame = self.view.bounds;
    [self.view addSubview:BV];
    self.BView = BV;
    
    YellowView *YV = [YellowView YelView];
    YV.frame = self.view.bounds;
    [self.view addSubview:YV];
    self.YView = YV;
}

//开始拖拽
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.isDraging = YES;
    UITouch *tou = [touches anyObject];
    
    CGPoint CurP = [tou locationInView:self.YView];
    CGPoint preP = [tou previousLocationInView:self.YView];
    
    CGFloat offsetX = CurP.x - preP.x;
    self.offsetX = offsetX;
    
    self.YView.frame = [self rectWithOffsetX:offsetX];
    
    //判断下往左拖显示绿色 往右拖显示黄色
    if (self.YView.frame.origin.x < 0) {
        
        self.GView.hidden = YES;
        self.BView.hidden = NO;
    }else {
        
        self.BView.hidden = YES;
        self.GView.hidden = NO;
    }
}

//停止拖拽
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 判断下 如果当前没有拖动， 那点一下就返回原状
    if (_isDraging == NO && self.YView.frame.origin.x != 0) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.YView.frame = self.view.frame;
        }];
    }
    
    //先设置一个目标点 判断要走哪个目标点
    CGFloat target = 0;
    if (_YView.frame.origin.x > kDeviceWidth * 0.5) {
        target = 290;
    }else if (CGRectGetMaxX(self.YView.frame) < kDeviceWidth * 0.5) {
        target = -250;
    }
    
    //用目标减去自己现在的位置得到偏移量
    CGFloat offset = target - _YView.frame.origin.x;
    CGRect frame = self.YView.frame;
    frame.origin.x += offset;
    
    //可能存在误差小数点 判断下 直接还原
    if (target == 0) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.YView.frame = self.view.frame;
        }];
    }else {
        [UIView animateWithDuration:0.25 animations:^{
            
            //通过偏移量 算出当前frame各项属性的确切位置
            self.YView.frame = [self rectWithOffsetX:offset];
        }];
    }
    self.isDraging = NO;
}

//计算偏移
- (CGRect)rectWithOffsetX:(CGFloat)offsetX {
   
    CGFloat offsetY = offsetX * kMax /kDeviceWidth;
    
    //计算出比例
    CGFloat scale = (kDeviceHight - offsetY) / kDeviceHight;
    
    if (self.YView.frame.origin.x < 0) {
        scale = (kDeviceHight + 2 * offsetY) / kDeviceHight;
    }
    
    CGRect frame = self.YView.frame;
    frame.origin.x += offsetX;
    frame.size.width = frame.size.width * scale;
    frame.size.height = frame.size.height * scale;
    frame.origin.y = (kDeviceHight - frame.size.height) * 0.5;
    
    return frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
