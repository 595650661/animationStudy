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
    }
    
    
    drawView.frame = self.view.bounds;
    drawView.backgroundColor = [UIColor whiteColor];
    [drawView setNeedsDisplay];
    [self.view addSubview:drawView];
    
    
}









@end
