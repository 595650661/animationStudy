
UIBezierPath简介

UIBezierPath是对CGPathRef的封装。创建矢量图形时，拆解成一条或者多条线段，拼接起来，每条下端的终点都是下一条线段的起点


步骤
    - 1、创建一个UIBezierPath对象
    - 2、用moveToPoint：设置初始线段的起点
    - 3、添加线段，定义一条或多条子路径
    - 4、修改UIBezierPath的绘图相关属性，譬如 lineWidth lineJoinStyle usesEvenOddFillRule


常用API

// 创建矩形
+ (UIBezierPath *)bezierPathWithRect:(CGRect)rect

// 创建圆角矩形
+ (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius

// 创建矩形内切圆
+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect

// 创建弧形
+ (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise

// 添加直线
- (void)addLineToPoint:(CGPoint)point

// 添加弧形线段
- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise

// 添加二阶贝塞尔曲线
- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint

// 添加三阶贝塞尔曲线
- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2



CAShapeLayer

    CAShapeLayer继承自CALayer，每一个CAShapeLayer对象都代表着将要被渲染到屏幕上的一个任意的形状（shape）。具体形状由其path（类型为CGpathRef）属性指定。普通的CALayer是矩形，所以需要frame属性。CAShapeLayer初始化时也需要指定frame值，但 它本身没有形状，它的形状来源于其属性path 。CAShapeLayer有不同于CALayer的属性，它从CALayer继承而来的属性在绘制时是不起作用的。



























