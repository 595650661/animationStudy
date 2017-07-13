//
//  EffectView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "EffectView.h"

@implementation EffectView


- (void)drawRect:(CGRect)rect {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    
    CGContextAddRect(contextRef, CGRectMake(100, 100, 100, 100));
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(contextRef, 5.0f);
    
    //设置透明度
    //取值范围（0~1，0表示全透明，1是不透明）
     CGContextSetAlpha(contextRef, 1);
    
    /*
     设置阴影
     参数1:画布
     参数2:右偏移量
     参数3:下偏移量
     参数4:模糊度（0是不模糊，越大越模糊，10就差不多）
     */
    CGContextSetShadow(contextRef, CGSizeMake(10, 10), 10);
    
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}
 

@end
