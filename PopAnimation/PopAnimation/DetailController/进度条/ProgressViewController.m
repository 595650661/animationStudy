//
//  ProgressViewController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/11.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "ProgressViewController.h"
#import <POP.h>
#define SCREEN_HEIGHT self.view.frame.size.height
#define SCREEN_WIDTH self.view.frame.size.width
@interface ProgressViewController ()
@property (nonatomic,strong) UIView *popCircle;
@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"进度条";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.popCircle = [[UIView alloc] initWithFrame:CGRectMake(150, 200, SCREEN_WIDTH - 300, SCREEN_WIDTH - 300)];
    self.popCircle.layer.cornerRadius = self.popCircle.bounds.size.width/2;
    self.popCircle.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.popCircle];
    
    [self createButton];
}




-(void)performTransactionAnimation
{
    //变小
    POPSpringAnimation *firstAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    firstAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.3, 0.3)];
    [_popCircle.layer pop_addAnimation:firstAnimation forKey:@"firstAnimation"];

    //拉伸
    POPSpringAnimation *secondAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    secondAnimation.toValue =[NSValue valueWithCGRect:CGRectMake(0, 0, 800, 80)];
    secondAnimation.springSpeed = 6.0f;
    secondAnimation.springBounciness = 10;
    [_popCircle pop_addAnimation:secondAnimation forKey:@"secondAnimation"];
    
    secondAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
    
        if (finished) {
            CAShapeLayer *progressLayer = [CAShapeLayer layer];
            progressLayer.strokeColor = [UIColor whiteColor].CGColor;
            progressLayer.lineCap   = kCALineCapRound;
            progressLayer.lineJoin  = kCALineJoinBevel;
            progressLayer.lineWidth = 40.0;
            progressLayer.strokeEnd = 0.0;
            UIBezierPath *progressline = [UIBezierPath bezierPath];
            [progressline moveToPoint:CGPointMake(40.0, 40.0)];
            [progressline addLineToPoint:CGPointMake(750.0, 40.0)];
            progressLayer.path = progressline.CGPath;
            [self.popCircle.layer addSublayer:progressLayer];
            
            POPBasicAnimation *progressBoundsAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
            progressBoundsAnim.duration = 1.0;
            progressBoundsAnim.fromValue = @0.0;
            progressBoundsAnim.toValue = @1.0;
            [progressLayer pop_addAnimation:progressBoundsAnim forKey:@"AnimateBounds"];
        }
        
        
        
    };
    
    
}









- (void)createButton{
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 500, 100, 50);
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

- (void)button{
     [self performTransactionAnimation];
}

@end














