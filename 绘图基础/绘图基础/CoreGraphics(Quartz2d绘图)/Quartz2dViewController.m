//
//  Quartz2dViewController.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "Quartz2dViewController.h"
#import "LineView.h"
#import "TriangleView.h"
#import "RectView.h"
#import "CircularView.h"
#import "FanView.h"
#import "CurveView.h"
#import "EffectView.h"
@interface Quartz2dViewController ()

@end

@implementation Quartz2dViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *drawView;
    if ([self.title isEqualToString:@"画线段"]) {
        drawView = (LineView *)[[LineView alloc]init];
    }else if ([self.title isEqualToString:@"画三角形"]){
        drawView = [[TriangleView alloc]init];
    }else if ([self.title isEqualToString:@"画矩形"]){
        drawView = [[RectView alloc]init];
    }else if ([self.title isEqualToString:@"画圆"]){
        drawView = [[CircularView alloc]init];
    }else if ([self.title isEqualToString:@"画扇形"]){
        drawView = [[FanView alloc]init];
    }else if ([self.title isEqualToString:@"画曲线"]){
        drawView = [[CurveView alloc]init];
    }else if ([self.title isEqualToString:@"画特效"]){
        drawView = [[EffectView alloc]init];
    }
    
    
    drawView.frame = self.view.bounds;
    drawView.backgroundColor = [UIColor whiteColor];
    [drawView setNeedsDisplay];
    [self.view addSubview:drawView];
    
    
}









@end
