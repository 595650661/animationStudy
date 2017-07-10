//
//  BaseViewController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//
/*
 http://www.jianshu.com/p/9cf1555da0ca
 http://www.jianshu.com/p/9cbe904442e0
 http://www.ui.cn/detail/21148.html
 */

#import "BaseViewController.h"
#import <POP.h>
#define SCREEN_HEIGHT self.view.frame.size.height
#define SCREEN_WIDTH self.view.frame.size.width
@interface BaseViewController ()
@property (nonatomic,strong) UIView *BaseView;
 
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"基础动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    _BaseView = view;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(usePopBasicAnimation)];
    [view addGestureRecognizer:tap];
 
 
}



//1、POPBasicAnimation
- (void)usePopBasicAnimation{
    /*
     设置动画至少需要三步
     1、定义一个animation对象 并指定对应的动画属性
     2、设置初始值和默认值(初始值可以不指定 会默认从当前值开始)
     3、添加到想产生动画的对象上
     
     POPBasicAnimation可配置的属性与默认值为
     duration:0.4    //动画间隔

     */
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.toValue = @(_BaseView.center.y + 200);
    animation.beginTime = CACurrentMediaTime() + 1.0f;
    [_BaseView pop_addAnimation:animation forKey:@"BasicAnimation"];
    
    [self performSelector:@selector(POPSpringAnimation) withObject:self afterDelay:animation.duration+1.0f];
    [self performSelector:@selector(POPAnimatableProperty) withObject:self afterDelay:animation.duration+1.0f];
}


- (void)POPSpringAnimation{
    /*
     POPSpringAnimation也许是大多数人使用POP的理由 其提供一个类似弹簧一般的动画效果
     
    POPSpringAnimation可配置的属性与默认值为
     springBounciness:4.0    //[0-20] 弹力 越大则震动幅度越大
     springSpeed     :12.0   //[0-20] 速度 越大则动画结束越快
     dynamicsTension :0      //拉力  接下来这三个都跟物理力学模拟相关 数值调整起来也很费时 没事不建议使用哈
     dynamicsFriction:0      //摩擦 同上
     dynamicsMass    :0      //质量 同上
     
     注意:POPSpringAnimation是没有duration字段的 其动画持续时间由以上几个参数决定
     */
    
    POPSpringAnimation *aniSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    aniSpring.toValue = @(_BaseView.center.x + 100);
    aniSpring.beginTime = CACurrentMediaTime();
    aniSpring.springBounciness = 10.0;
    [_BaseView pop_addAnimation:aniSpring forKey:@"POPSpringAnimation"];
 
    
    
}


- (void)POPAnimatableProperty{
    
    /*
     其组成就是一个readBlock一个writeBlock和一个threashold
     
     readBlock告诉POP当前的属性值
     writeBlock中修改变化后的属性值
     threashold决定了动画变化间隔的阈值 值越大writeBlock的调用次数越少
     */
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100)];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
       
        prop.readBlock = ^(id obj, CGFloat values[]) {
           
        };
        
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            UILabel *label = (UILabel*)obj;
            label.text = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
        };
       
        prop.threshold = 0.01;
    }];
    
    
    
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    anBasic.fromValue = @(0);   //从0开始
    anBasic.toValue = @(3*60);  //180秒
    anBasic.duration = 3*60;    //持续3分钟
    anBasic.beginTime = CACurrentMediaTime();
    [label pop_addAnimation:anBasic forKey:@"countdown"];
    
}


@end

































