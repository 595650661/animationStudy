//
//  PopCardController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "PopCardController.h"
#import <POP.h>
#define SCREEN_HEIGHT self.view.frame.size.height
#define SCREEN_WIDTH self.view.frame.size.width
@interface PopCardController ()
@property (nonatomic,strong) UIView *baseView;
@end

@implementation PopCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PopCardController";
    
    
    _baseView = [[UIView alloc]init];
    _baseView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_baseView];
    
    
    [self createButton];
}

- (void)createButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, SCREEN_HEIGHT - 100 , SCREEN_WIDTH, 50);
    [button setTitle:@"弹出小卡片" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popCard:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)popCard:(UIButton *)button{
    button.selected = !button.selected;
    if (button.selected) {
        
        
        //弹出小卡片
        _baseView.frame = CGRectMake(0, 0, 150, 200);
        _baseView.layer.cornerRadius = 5.0f;
        
    
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        springAnimation.springBounciness = 10;
        springAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
        [_baseView pop_addAnimation:springAnimation forKey:@"POPSpringAnimation"];
        
        
        POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
        basicAnimation.toValue = @(M_PI/32);
        [_baseView.layer pop_addAnimation:basicAnimation forKey:@"POPBasicAnimation"];
        
        
        POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        
        opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        opacityAnim.duration = 0.25;
        opacityAnim.toValue = @1.0;

        [_baseView.layer pop_addAnimation:opacityAnim forKey:@"opacityAnim"];
        
    }else{
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        springAnimation.springBounciness = 10;
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH+150, -200)];
        [_baseView pop_addAnimation:springAnimation forKey:@"POPSpringAnimation"];
       
    }
    
    
    
    
    
}








@end



























