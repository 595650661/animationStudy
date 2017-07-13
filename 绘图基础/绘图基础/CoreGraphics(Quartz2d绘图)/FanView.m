//
//  FanView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "FanView.h"

@implementation FanView

- (void)drawRect:(CGRect)rect {
   
    /*
     注意在添加
      - `CGContextAddLineToPoint`
      - `CGContextMoveToPoint`
     在是否添加上面方法的区别
     */
    
    [self drawArc1];
    
    [self drawArc2];
}

- (void)drawArc1{
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    /*
     参数1:作用域
     参数2:圆心x坐标
     参数3:圆心y坐标
     参数4:半径
     参数5:开始角度
     参数6:结束角度
     参数7:方向，0表示顺时针，1表示逆时针
     
     */
    CGContextAddArc(contextRef, 100, 200, 100, 0, M_PI_4, 0);
    
    CGContextSetLineWidth(contextRef, 5.0f);
    CGContextSetFillColorWithColor(contextRef, [UIColor greenColor].CGColor);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    
    
//    CGContextAddLineToPoint(contextRef, 100, 200);
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
    
}




- (void)drawArc2{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    
    //第一部分
    CGContextMoveToPoint(contextRef, 250, 400);
    CGContextAddArc(contextRef, 250, 400, 100, 0, M_PI_2, 0);
    CGContextSetFillColorWithColor(contextRef, [UIColor blueColor].CGColor);
    CGContextFillPath(contextRef);
    
    
    //第二部分
    CGContextMoveToPoint(contextRef, 250, 400);
    CGContextAddArc(contextRef, 250, 400, 100, M_PI_2, M_PI_2/2*3, 0);
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGContextFillPath(contextRef);
    
    // 第三部分
    CGContextMoveToPoint(contextRef, 250, 400);
    CGContextAddArc(contextRef, 250, 400, 100, 0, 225*M_PI/180.0, 1);
    CGContextSetFillColorWithColor(contextRef, [UIColor purpleColor].CGColor);
    CGContextFillPath(contextRef);

    
}










@end


















