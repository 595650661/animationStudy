
1、什么是Quartz2d？
Quartz：是绘图的通用术语
是一个二维绘图引擎，使用的是CoreGraphics库，同时支持iOS和Mac系统
2、有啥特点？
有点难，比较底层，操作系统层api一般都是纯C开发的，有针对性的开发才会用到
3、能够做些啥？
能够绘制基本的几何图形，绘制图像，绘制文字，pdf，UI定制，图片剪裁，手势解锁，涂鸦画板。。。
4、怎么使用？
要基于UIView去开发


Quartz 2D绘图(CoreGraphics)一些常用的API

[1]设置上下文
CGContextRef context = UIGraphicsGetCurrentContext()

[2]开始画线
CGContextMoveToPoint

[3]画直线
CGContextAddLineToPoint

[4]画一椭圆
CGContextAddEllipseInRect

[5]设置线条终点形状
CGContextSetLineCap

[6]画虚线
CGContextSetLineDash

[7]画一方框
CGContextAddRect

[8]指定矩形
CGContextStrokeRect

[9]指定矩形线宽度
CGContextStrokeRectWithWidth

[10]一些直线
CGContextStrokeLineSegments

[11]画曲线 前俩店为中心 中间俩店为起始弧度 最后一数据为0则顺时针画 1则逆时针
CGContextAddArc

[12]设置阴影
CGContextSetShadowWithColor

[13]填充颜色
CGContextSetRGBFillColor

[14]画笔颜色设置
CGContextSetRGBStrokeColor

[15]颜色空间填充
CGContextSetFillColorSpace

[16]颜色空间画笔设置
CGConextSetStrokeColorSpace

[17]补充当前填充颜色的rect
CGContextFillRect

[18]透明度
CGContextSetAlaha

[19]改变画布位置
CGContextTranslateCTM

[20]设置线的宽度
CGContextSetLineWidth

[21]画多个线
CGContextAddRects

[22]画曲线
CGContextAddQuadCurveToPoint

[23]开始绘制图片
CGContextStrokePath

[24]设置绘制模式
CGContextDrawPath

[25]封闭当前线路
CGContextClosePath

[26]从原图片中取小图
CGImageCreateWithImageInRect





