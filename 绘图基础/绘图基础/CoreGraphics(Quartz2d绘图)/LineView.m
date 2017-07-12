//
//  LineView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "LineView.h"

@implementation LineView


- (void)drawRect:(CGRect)rect {
    
    /*
     CGContextRef  具有贯穿全局的效果，我们设置一个全局变量创建 一次 就可以了
     
     要想了解跟多的效果，可以把两个方法调换一下
     */
    
    [self drawLine2];
    [self drawLine1];
    
}

- (void)drawLine1{
    //获取图形上下文.或者叫作用域，即画布，他是专门用来保存绘画期间的各种数据的
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //路径设置
    //先设置一个起点
    CGContextMoveToPoint(contextRef, 50, 100);
    //设置终点
    CGContextAddLineToPoint(contextRef, 100, 500);
    
    //设置样式
    //设置线宽
    CGContextSetLineWidth(contextRef, 5.0f);
    //设置线的颜色
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    
    //风格  头部和尾部的处理
    CGContextSetLineCap(contextRef, kCGLineCapRound);
    
    
    /*
     画虚线
     参数1 作用域
     参数2 起点的偏移量
     参数3 指明虚线是如何交替绘制
     lengths的值｛10,10｝表示先绘制10个点，再跳过10个点
     如果把lengths值改为｛10, 20, 10｝，则表示先绘制10个点，跳过20个点，绘制10个点，跳过10个点，再绘制20个点，
     参数4 实心部分和虚心部分的循环次数
     */
    CGFloat lenths[] = {10, 10};
    CGContextSetLineDash(contextRef, 0, lenths, 2);
    
    
    //渲染
    CGContextStrokePath(contextRef);
}


- (void)drawLine2{
    
    //获取画布
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //设置路径
    //注意但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CGMutablePathRef path = CGPathCreateMutable();
    
    //把绘图信息添加到路径里
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 300, 500);
    
    //把绘制直线的绘图信息保存到图形上下文中
    CGContextAddPath(contextRef, path);
    
    //设置样式
    //设置线宽
    CGContextSetLineWidth(contextRef, 5.0f);
    //设置线的颜色
    CGContextSetStrokeColorWithColor(contextRef, [UIColor blueColor].CGColor);

    
    //渲染
    CGContextStrokePath(contextRef);
    
    //释放
    CGPathRelease(path);
    
}







@end













