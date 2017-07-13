//
//  DFLTransformationView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "DFLTransformationView.h"

@implementation DFLTransformationView


- (void)drawRect:(CGRect)rect {
    
    UIImage *image0 = [UIImage imageNamed:@"image.jpg"];
    [image0 drawInRect:CGRectMake(300, 400, 100, 100)];
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 移动变换
    //    CGContextTranslateCTM(contextRef, -100, -100);
    /**
     *  对象沿着x轴移动-100单位，沿着y轴移动-100单位
     */
    // 多个变换会叠加
    // 缩放
    //    CGContextScaleCTM(contextRef, 0.5, 0.5);
    
    // 获取中心点
//    CGFloat cenX = CGRectGetMidX(self.bounds);
//    CGFloat cenY = CGRectGetMidY(self.bounds);
//    
    
    // 先移动一下
    //    CGContextTranslateCTM(contextRef, cenX, cenY);
    CGContextTranslateCTM(contextRef, 100+100/2.0, 100+100/2.0);
    
    // 旋转变换
    CGContextRotateCTM(contextRef, M_PI_4);
    // 再移动回去
    CGContextTranslateCTM(contextRef, -(100+100/2.0), -(100+100/2.0));
    
    /**
     *  旋转可以认为实质是旋转坐标系，会绕着坐标原点旋转，可以先将坐标原点移动到要旋转的图形的中点，然后执行旋转，然后再移动回来，实现绕着图形中心旋转的目的
     */
    
    
    UIImage *image = [UIImage imageNamed:@"image.jpg"];
    [image drawInRect:CGRectMake(300, 400, 100, 100)];
    
    
}
 

@end
