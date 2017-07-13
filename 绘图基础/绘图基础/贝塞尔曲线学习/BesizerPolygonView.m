//
//  BesizerPolygonView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "BesizerPolygonView.h"

@implementation BesizerPolygonView


- (void)drawRect:(CGRect)rect {
    
    //画第一条线段
    [self drawOneLine];
    
}


//画线段
- (void)drawOneLine{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //起点
    [path moveToPoint:CGPointMake(50, 100)];
    //添加一个点
    [path addLineToPoint:CGPointMake(100, 120)];
    //在添加一个点
    [path addLineToPoint:CGPointMake(80, 210)];
    //关闭路径
    [path closePath];
    
    // 3.1.1设置填充颜色
    [[UIColor blueColor] setFill];
    // 3.1.2设置描边颜色
    [[UIColor redColor] setStroke];

    
    
    //吧路径添加到上下文中
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextAddPath(contextRef, path.CGPath);
    // 3.1.3设置线宽
    CGContextSetLineWidth(contextRef, 5);
    //渲染
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
}
















@end




































