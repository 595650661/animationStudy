//
//  BezierCurveView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "BezierCurveView.h"

@implementation BezierCurveView


- (void)drawRect:(CGRect)rect {
    
    [self drawCircle];
}

///画圆
- (void)drawCircle{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 50, 50)];
    //  椭圆
    //    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextAddPath(contextRef, path.CGPath);
    
    CGContextStrokePath(contextRef);
    
}














@end
