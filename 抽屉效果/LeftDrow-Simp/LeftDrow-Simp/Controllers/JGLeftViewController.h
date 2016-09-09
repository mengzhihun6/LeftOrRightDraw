//
//  JGLeftViewController.h
//  LeftDrow-Simp
//
//  Created by stkcctv on 16/9/9.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

//1.1声明一个协议
@protocol ValueDelegate <NSObject>
//需要实现的协议方法
-(void)showChangeData:(NSString *)Str;

@end

@interface JGLeftViewController : UIViewController

//1.2定义一个委托属性
@property(nonatomic,assign) id <ValueDelegate>  delegate;

// 定义关联主界面视图控制器，用来执行本页面的一些跳转操作
@property (nonatomic,strong) UIViewController *mainController;

@end
