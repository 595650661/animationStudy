//
//  RectView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "RectView.h"

@implementation RectView


- (void)drawRect:(CGRect)rect {
    
    [self drawRectangular];
}

- (void)drawRectangular{
    //获取图形上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(contextRef, CGRectMake(100, 100, 100, 100));
    
    //颜色的填充
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    //线宽
    CGContextSetLineWidth(contextRef, 4.0f);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor blueColor].CGColor);
    
    //渲染
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
    
}








@end

























