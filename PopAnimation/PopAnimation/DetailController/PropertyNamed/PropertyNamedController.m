//
//  PropertyNamedController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "PropertyNamedController.h"
#import <POP.h>

@interface PropertyNamedController ()
@property (weak, nonatomic) IBOutlet UIView *baseView;
 
@end

@implementation PropertyNamedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PropertyNamedController";
    self.view.backgroundColor = [UIColor whiteColor];
    
     
    
}


#pragma mark ---- View Properties ----
///kPOPViewAlpha
- (IBAction)kPOPViewAlpha:(id)sender {
    POPBasicAnimation *baseAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    baseAni.toValue= @(0);
    baseAni.duration = 2.0f;
    [_baseView pop_addAnimation:baseAni forKey:@"kPOPViewAlpha"];

}
///kPOPViewBackgroundColor
- (IBAction)kPOPViewBackgroundColor:(id)sender {
    POPBasicAnimation *baseAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    baseAni.toValue = [UIColor blueColor];
    [_baseView pop_addAnimation:baseAni forKey:@"kPOPViewBackgroundColor"];
}
///kPOPViewBounds
- (IBAction)kPOPViewBounds:(id)sender {
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBounds];
    basicAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 30)];
    basicAnimation.duration = 2.0f;
    [_baseView pop_addAnimation:basicAnimation forKey:@"kPOPViewBounds"];
}
///kPOPViewCenter
- (IBAction)kPOPViewCenter:(id)sender {
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
    basicAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    [_baseView pop_addAnimation:basicAnimation forKey:@"kPOPViewCenter"];
}
///kPOPViewFrame
- (IBAction)kPOPViewFrame:(id)sender {
    
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    basicAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(100, 200, 200, 200)];
    [_baseView pop_addAnimation:basicAnimation forKey:@"kPOPViewFrame"];
    
}
///kPOPViewScaleXY
- (IBAction)kPOPViewScaleXY:(id)sender {
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    
    basicAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(2, 3)];
    [_baseView pop_addAnimation:basicAnimation forKey:@"kPOPViewScaleXY"];
}
///kPOPViewSize
- (IBAction)kPOPViewSize:(id)sender {
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
    basicAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(20, 30)];
    [_baseView pop_addAnimation:basicAnimation forKey:@"kPOPViewSize"];
    
}



#pragma mark ---- Layer Properties ----
///kPOPLayerBounds
- (IBAction)kPOPLayerBounds:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerBounds];
    basicAnimation.toValue= [NSValue valueWithCGRect:CGRectMake(0, 0, 20, 20)];
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerBounds"];
}
///kPOPLayerScaleXY
- (IBAction)kPOPLayerScaleXY:(id)sender {
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerScaleXY];
    basicAnimation.toValue= [NSValue valueWithCGSize:CGSizeMake(2, 1)];
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerScaleXY"];
}
///kPOPLayerSize
- (IBAction)kPOPLayerSize:(id)sender {
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    basicAnimation.toValue= [NSValue valueWithCGSize:CGSizeMake(200, 200)];
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerSize"];
}
///kPOPLayerBackgroundColor
- (IBAction)kPOPLayerBackgroundColor:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerBackgroundColor];
    basicAnimation.toValue= [UIColor greenColor];
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerBackgroundColor"];
}
///kPOPLayerOpacity
- (IBAction)kPOPLayerOpacity:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerOpacity];
    basicAnimation.toValue = @(0.1);
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerOpacity"];
}
///kPOPLayerPosition
- (IBAction)kPOPLayerPosition:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerPosition];
    basicAnimation.toValue= [NSValue valueWithCGRect:CGRectMake(130, 130, 0, 0)];
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerPosition"];
}
///kPOPLayerPositionX
- (IBAction)kPOPLayerPositionX:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerPositionX];
    basicAnimation.toValue= @(400);
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerPositionX"];
}
///kPOPLayerPositionY
- (IBAction)kPOPLayerPositionY:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerPositionY];
    basicAnimation.toValue= @(40);
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerPositionY"];
}
///kPOPLayerRotation
- (IBAction)kPOPLayerRotation:(id)sender {
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerRotation];
    basicAnimation.toValue= @(M_PI/4); //2 M_PI is an entire rotation
    
    [_baseView.layer pop_addAnimation:basicAnimation forKey:@"kPOPLayerRotation"];
}

 





@end




































