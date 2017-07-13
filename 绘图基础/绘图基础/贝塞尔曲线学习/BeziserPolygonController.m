//
//  BeziserPolygonController.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "BeziserPolygonController.h"

@interface BeziserPolygonController ()

@end

@implementation BeziserPolygonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
}
- (void)createDrawView{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //添加路径
    [path moveToPoint:CGPointMake(60, 140)];
    [path addLineToPoint:CGPointMake(60, 240)];
    [path addLineToPoint:CGPointMake(160, 240)];
    [path addLineToPoint:CGPointMake(160, 140)];
    [path closePath];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    //设置边框
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor greenColor].CGColor;
    layer.lineWidth = 5.0f;
    
    //把路径添加到layer上
    layer.path = path.CGPath;
    
    [self.view.layer addSublayer:layer];

}



@end





























