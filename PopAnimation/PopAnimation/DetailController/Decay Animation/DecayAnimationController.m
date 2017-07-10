//
//  DecayAnimationController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "DecayAnimationController.h"
#import <POP.h>
@interface DecayAnimationController ()
@property (nonatomic,strong) UIView *baseView;
@end

@implementation DecayAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"DecayAnimation";
    
    /*
     Decay Animation 就是 POP 提供的另外一个非常特别的动画，他实现了一个衰减的效果。这个动画有一个重要的参数 velocity（速率），一般并不用于物体的自发动画，而是与用户的交互共生
     
     */
    
    
    _baseView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _baseView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_baseView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(kPOPLayerPositionX)];
    [_baseView addGestureRecognizer:tap];
    
  
}

//创建一个POPDecayAnimation动画 实现X轴运动 减慢速度的效果 通过速率来计算运行的距离 没有toValue属性
- (void)kPOPLayerPositionX{
    
    POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    /*
     deceleration （负加速度） 是一个你会很少用到的值，默认是就是我们地球的 0.998，如果你开发给火星人用，那么这个值你使用 0.376 会更合适。
     参数 velocity（速率)
      开始按照速率 100点／s 做减速运动
     */
    
    decayAnimation.velocity = @(100.0);
    
    decayAnimation.beginTime = CACurrentMediaTime();
    [decayAnimation setCompletionBlock:^(POPAnimation *prop, BOOL fint) {
        if (fint) {
            NSLog(@"baseView=%@",NSStringFromCGRect(_baseView.frame));
        }
    }];
    
    
    [_baseView pop_addAnimation:decayAnimation forKey:@"kPOPLayerPositionX"];

}

/*
 实现一个拖动视图运行，将拖动结束后它有减速的效果，当点击视图时它将停所有的动画效果；在减速动画结束后会有一个判断，当前视图的位置是否是触在屏壁，若有则反弹；
 */

@end



















