//
//  CircularController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/11.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "CircularController.h"
#import "CircularView.h"
#define SCREEN_HEIGHT self.view.frame.size.height
#define SCREEN_WIDTH self.view.frame.size.width
@interface CircularController ()
@property (nonatomic,strong) CircularView *circularview;
@end

@implementation CircularController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圆环";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CircularView *view = [[CircularView alloc]initWithFrame:CGRectMake(100, 100, SCREEN_WIDTH - 200, SCREEN_WIDTH - 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    _circularview = view;

}

- (IBAction)MYSlider:(UISlider*)sender {
    [_circularview animateToStrokeEnd:sender.value];
}
 

@end
