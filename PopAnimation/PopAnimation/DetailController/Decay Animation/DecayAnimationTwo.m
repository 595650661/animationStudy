//
//  DecayAnimationTwo.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "DecayAnimationTwo.h"
#import <POP.h>
@interface DecayAnimationTwo ()<POPAnimationDelegate>
@property (nonatomic,strong) UIView *baseView;
@end

@implementation DecayAnimationTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"碰壁反弹效果";
    
    
    _baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _baseView.center = self.view.center;
    _baseView.layer.masksToBounds = YES;
    _baseView.layer.cornerRadius = _baseView.bounds.size.width/2;
    _baseView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_baseView];
    
    
    //拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanGesture:)];
    [_baseView addGestureRecognizer:pan];
 
}


//拖拽手势
- (void)PanGesture:(UIPanGestureRecognizer*)pan{
    //在拖动过程中
    //取出偏移量
    CGPoint offset = [pan translationInView:self.view];
    //让baseView平移
    _baseView.transform = CGAffineTransformTranslate(_baseView.transform, offset.x, offset.y);
    //平移完之后将偏移量重新置为0
    //这很重要，要记住
    [pan setTranslation:CGPointZero inView:self.view];
    
    
    //当拖动手势结束的时候，开始动画
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        CGPoint velocity = [pan velocityInView:self.view];
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [_baseView.layer pop_addAnimation:decayAnimation forKey:@"layerPositionAnimation"];
        
        decayAnimation.delegate = self;
        
    }
 
}

#pragma mark - POPAnimationDelegate
///在小球弹动的过程中判断是否碰壁
- (void)pop_animationDidApply:(POPDecayAnimation *)anim
{
    BOOL baseViewInsideOfSuperView = CGRectContainsRect(self.view.frame, self.baseView.frame);
    if (!baseViewInsideOfSuperView) {
       
        CGPoint currentVelocity = [anim.velocity CGPointValue];
        CGPoint velocity = CGPointMake(currentVelocity.x, -currentVelocity.y);
        POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        positionAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
        [self.baseView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
    
}


@end































