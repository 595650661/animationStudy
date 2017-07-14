//
//  CGMutablePathRefController.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/14.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "CGMutablePathRefController.h"
#import "CGMutablePathRefView.h"
@interface CGMutablePathRefController ()

@end

@implementation CGMutablePathRefController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];


}

- (void)createDrawView{
    CGMutablePathRefView *view = [[CGMutablePathRefView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view setNeedsDisplay];
}

@end















