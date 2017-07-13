//
//  BesizerViewController.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "BesizerViewController.h"
#import "BesizerPolygonView.h"
#import "BezierCurveView.h"
@interface BesizerViewController ()

@end

@implementation BesizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    

 
    
}

- (void)createDrawView{
    
    UIView *drawView;
    
    if ([self.title isEqualToString:@"画多边形（view）"]) {
        drawView = [[BesizerPolygonView alloc]init];
    }else if ([self.title isEqualToString:@"画曲线"]){
        drawView = [[BezierCurveView alloc]init];
    }
    
    
    
    drawView.frame = self.view.bounds;
    drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawView];
    
    [drawView setNeedsDisplay];
 
}
@end
















