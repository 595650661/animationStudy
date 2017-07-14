//
//  CGMutablePathRefView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/14.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "CGMutablePathRefView.h"

@implementation CGMutablePathRefView


- (void)drawRect:(CGRect)rect {
    
    [self drawSquare];
    [self drawCurve];
}
 

- (void)drawSquare{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //申请路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //此处因为CGRectMake可以设置起点，所以不需要CGPathMoveToPoint
    CGPathAddRect(path, NULL, CGRectMake(100, 400, 100, 100));
    
    //设置填充颜色
    CGContextSetFillColorWithColor(context,
                                   [UIColor blueColor].CGColor);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
}


- (void)drawCurve{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //申请路径
    CGMutablePathRef path = CGPathCreateMutable();
    //将起点设置在坐标(100, 100)处
    CGPathMoveToPoint(path, NULL, 100, 300);
    
    /*  CGPathAddArcToPoint(CGMutablePathRef  _Nullable path, const CGAffineTransform * _Nullable m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
     此方法表示从起点到(x1, y1)再到(x2, y2)的两条直线为切线的弧，radius表示弧的半径
     */
    CGPathAddArcToPoint(path, NULL, 100, 200, 300, 200, 100);
    
    //设置“画笔”颜色
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor blueColor].CGColor);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
}












@end
