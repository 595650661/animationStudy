//
//  CircularView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "CircularView.h"

@implementation CircularView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 绘制图形上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(contextRef, CGRectMake(100, 100, 100, 100));
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
}

@end
