//
//  QuartzImageView.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/13.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "QuartzImageView.h"


@implementation QuartzImageView


- (void)drawRect:(CGRect)rect {
   
    [self drawImage];
    [self clipImage];
}

- (void)drawImage{
    UIImage *image = [UIImage imageNamed:@"image.jpg"];
    [image drawInRect:CGRectMake(100, 100, 250, 250)];
    // 平铺图像，超出部分会自动剪裁
//    [image drawAsPatternInRect:self.bounds];
    // 如果实现文字和图片共存，需要将文字写在后面，防止被图片盖住
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:15],
                          NSForegroundColorAttributeName : [UIColor redColor]
                          };
    NSString *text = @"如果实现文字和图片共存，需要将文字写在后面，防止被图片盖住";
    [text drawInRect:CGRectMake(100, 300, 250, 100) withAttributes:dic];
}

-(void)clipImage{
    /*
     思路：先画一个圆，让图片显示在圆的内部，超出的部分不显示。
     注意：显示的范围只限于指定的剪切范围，无论往上下文中绘制什么东西，只要超出了这个范围的都不会显示。
     */
    
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 先画一个圆形
    CGContextAddEllipseInRect(contextRef, CGRectMake(100, 400, 200, 200));
    
    // 切割操作
    CGContextClip(contextRef);
    CGContextFillPath(contextRef);
    
    
    UIImage *image = [UIImage imageNamed:@"image.jpg"];
    [image drawInRect:CGRectMake(100, 400, 200, 200)];
    

}



@end




















