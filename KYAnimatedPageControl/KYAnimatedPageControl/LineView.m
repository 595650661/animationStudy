//
//  LineView.m
//  KYAnimatedPageControl
//
//  Created by jiangjunhui on 2017/7/14.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "LineView.h"
#import <POP.h>
#define RGBA(r, g, b, a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
@interface LineView()
@property (nonatomic)  CGContextRef contextRef;
@end
@implementation LineView

/*
 首先，先画出那条线以及上面的小圆圈
 1、两个小圆圈之间巨距离是50
 2、小圆圈的半径是5
 */
- (void)drawRect:(CGRect)rect {
    
    _contextRef = UIGraphicsGetCurrentContext();
    
    //画圆圈
    for (NSInteger i = 0; i < 5; i++) {
        [self drawViewWithNumber:i];
    }
    
    //画直线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 205)];
    [path addLineToPoint:CGPointMake(300, 205)];
    CGContextSetLineWidth(_contextRef, 2.0f);
    [RGBA(200, 200, 200, 1) setStroke];
    CGContextAddPath(_contextRef, path.CGPath);
    CGContextDrawPath(_contextRef, kCGPathFillStroke);
    
    
}
 
//画小圆圈
- (void)drawViewWithNumber:(NSInteger)number{
    
    //小圆圈
    float X = 100 + 50*number;
    float Y = 200;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(X, Y, 10, 10)];
    [RGBA(200, 200, 200, 1) setFill];
    [RGBA(200, 200, 200, 1) setStroke];
    CGContextAddPath(_contextRef, path.CGPath);
    CGContextDrawPath(_contextRef, kCGPathFillStroke);
    
}


#pragma mark ---- 动画 ----
- (void)SimpleAnimation{
    
       
    
    
}










@end
