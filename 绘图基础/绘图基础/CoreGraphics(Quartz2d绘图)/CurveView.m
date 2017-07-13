//
//  CurveView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView


- (void)drawRect:(CGRect)rect {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //起点
    CGContextMoveToPoint(contextRef, 20, 300);
    /*
     三阶贝塞尔曲线
     参数1:作用域
     参数2:控制点x
     参数3:控制点y
     参数4:控制点x
     参数5:控制点y
     参数6:终点x
     参数7:终点y
     
     - `CGContextAddQuadCurveToPoint`  二阶贝塞尔曲线
     */
    CGContextAddCurveToPoint(contextRef, 100, -100, 200, 900, 300, 400);
     CGContextStrokePath(contextRef);    
    
    
    
}








@end




















