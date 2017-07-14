//
//  ViewController.m
//  KYAnimatedPageControl
//
//  Created by jiangjunhui on 2017/7/14.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"
#import <POP.h>
#define RGBA(r, g, b, a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define SCREEN_HEIGHT self.view.frame.size.height
#define SCREEN_WIDTH self.view.frame.size.width
typedef enum : NSUInteger {
    TouchStart,//开始触摸
    TouchLeft, //触摸方向，向左
    TouchRight,//触摸方向，想右
} GesturesDirection;

@interface ViewController ()
@property (nonatomic,strong) LineView *line;
@property (nonatomic) GesturesDirection TouchDirection;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic) NSInteger number;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _number = 0;
    LineView *line = [[LineView alloc]initWithFrame:self.view.bounds];
    line.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:line];
    [line setNeedsDisplay];
    _line = line;
    
    [self createButton];

}

#pragma mark ---- 按钮事件,简单动画 ----
- (void)createButton{
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, SCREEN_HEIGHT - 100, SCREEN_WIDTH - 200, 50);
    [button setTitle:@"开始动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

- (void)button{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(105, 205)];
    [path addLineToPoint:CGPointMake(305, 205)];
     
    
    CAShapeLayer *Layer = [CAShapeLayer layer];
    Layer.lineWidth = 3.0f;
    Layer.strokeColor = [UIColor redColor].CGColor;
    Layer.path = path.CGPath;
    [self.view.layer addSublayer:Layer];
    
    
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.duration =  12.0f;
    [Layer pop_addAnimation:animation forKey:@"POPBasicAnimation"];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(StrokeCircle) userInfo:nil repeats:YES];
    //关闭定时器
    _timer.fireDate = [NSDate distantPast];

}

- (void)StrokeCircle{
    
    //小圆圈
    float X = 100 + 50*_number/3;
    float Y = 200;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(X, Y, 10, 10)];
 
    CAShapeLayer *Layer = [CAShapeLayer layer];
    Layer.strokeColor = [UIColor redColor].CGColor;
    Layer.fillColor = [UIColor redColor].CGColor;
    Layer.path = path.CGPath;
    [self.view.layer addSublayer:Layer];
    
    
    _number += 3;
    if (_number > 12) {
        _timer .fireDate = [NSDate distantFuture];
    }
    
    
}



#pragma mark ---- 触摸引导动画 ----
//开始触摸的时候，把第一个小球变红
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _TouchDirection = TouchStart;
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}




@end


























