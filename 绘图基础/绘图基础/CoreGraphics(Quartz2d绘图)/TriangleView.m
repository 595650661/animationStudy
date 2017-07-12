//
//  TriangleView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

 
- (void)drawRect:(CGRect)rect {
    
    
    [self drawTriangle];
}

- (void)drawTriangle{
    //获取图形上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //设置点
    CGContextMoveToPoint(contextRef, 100, 100);
    CGContextAddLineToPoint(contextRef, 200, 200);
    CGContextAddLineToPoint(contextRef, 100, 200);
    
    //把点封闭起来
    CGContextClosePath(contextRef);
    
    //设置线宽
    CGContextSetLineWidth(contextRef, 3.0f);
    //设置线的颜色
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    //设置填充颜色
    CGContextSetFillColorWithColor(contextRef, [UIColor greenColor].CGColor);
    
    
    // 如果写了多种渲染方式，那么只执行第一种
//    CGContextStrokePath(contextRef);
//    CGContextFillPath(contextRef);
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
 
}

@end
