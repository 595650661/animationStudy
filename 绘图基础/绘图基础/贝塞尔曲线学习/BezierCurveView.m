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
    [self drawArc];
    [self drawCurve];
}

///画圆
- (void)drawCircle{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 50, 50)];
    [[UIColor redColor] setStroke];
    //  椭圆
    //    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextAddPath(contextRef, path.CGPath);
    
    CGContextStrokePath(contextRef);
    
}

///画扇形
- (void)drawArc{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(250, 400) radius:100 startAngle:0 endAngle:M_PI_4 clockwise:YES];
    
    [[UIColor redColor]setFill];
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextAddPath(contextRef, path.CGPath);
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
    
}

///画曲线
- (void)drawCurve{
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(20, 400)];
    //二维
    [aPath addQuadCurveToPoint:CGPointMake(120, 300) controlPoint:CGPointMake(70, 100)];
    //三维
    //    [aPath addCurveToPoint:CGPointMake(120, 100) controlPoint1:CGPointMake(70, 0) controlPoint2:CGPointMake(70, 200)];
    //    [aPath closePath];
    //渲染
    [aPath stroke];

}









@end
