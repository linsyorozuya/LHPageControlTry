//
//  LHPageControlView.m
//  LHPageControlTry
//
//  Created by LinGrea on 15/12/29.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import "LHPageControlView.h"
#import "UIView+Frame.h"

static const CGFloat kPageHeight = 10;
static const CGFloat kPageWidth = 10;

@implementation LHPageControlView
{
    UIView *_hightLightView;//高亮视图
    UIView *_topHidenHightLightCircles;//隐藏的高亮圆圈

//    CALayer *_hightLightLayer;//高亮视图
//    CALayer *_topHidenHightLightCircles;//隐藏的高亮圆圈
    
}

- (id)initWithOriginPoint:(CGPoint)point PageCount:(NSInteger)pageCount
{
    self = [self init];
    
    if (self) {
        //---计算赋值 view 的 frame
        self.frame = CGRectMake(point.x, point.y, (kPageWidth + 20)*pageCount, kPageHeight+20);
        self.backgroundColor = [UIColor clearColor];
  
        //---创建底层的没高亮的圆圈
        [self createBottomCirclesByCount:pageCount];
        //---创建底层的高亮的圆圈
        [self createHightLightCirclesBycount:pageCount];
    }
    
    return self;
}

//---根据索引获取圆圈的frame
- (CGRect)countCurrentRectWithIndex:(NSInteger)index
{
    return CGRectMake( 20 + (kPageWidth + 5) * index , (self.height - kPageHeight)/2 , kPageWidth, kPageHeight);
}

//---根据索引获取高亮圆圈的frame
- (CGRect)countCurrentHightLightRectWithIndex:(NSInteger)index
{
    return CGRectMake((kPageWidth + 5) * index , 0 , kPageWidth, kPageHeight);
}


//---创建底层的没高亮的圆圈
- (void)createBottomCirclesByCount:(NSInteger)count
{
    for (int i = 0; i < count; i++) {
        UIImageView *circle = [[UIImageView alloc]initWithFrame:[ self countCurrentRectWithIndex:i ]];
        circle.backgroundColor = [UIColor colorWithRed:0.635 green:0.584 blue:0.490 alpha:1.00];
        circle.layer.cornerRadius = kPageWidth/2;
        [self addSubview:circle];
    }
}

//---创建顶层高亮的圆圈，通过移动来改变高亮位置
- (void)createHightLightCirclesBycount:(NSInteger)count
{
    //---UIview 实现
    {
        //---获取能显示的大小
        CGRect showFrame = [self countCurrentRectWithIndex:0];
        
        //---容器View
        _hightLightView = [[UIView alloc] initWithFrame:showFrame];
//        _hightLightView.backgroundColor = [UIColor redColor];
        _hightLightView.clipsToBounds = YES;//只显示范围以内的视图
        _hightLightView.layer.cornerRadius = kPageWidth/2;
        
        //---创建所有高亮圆
        _topHidenHightLightCircles = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kPageWidth, kPageHeight)                                                                                                                                                                                   ];
        _topHidenHightLightCircles.layer.cornerRadius = kPageWidth/2;
        for (int i = 0; i < count; i++) {
            UIImageView *circle = [[UIImageView alloc]initWithFrame:[self countCurrentHightLightRectWithIndex:i ]];
            circle.backgroundColor = [UIColor colorWithRed:0.898 green:0.992 blue:1.000 alpha:1.00];
            circle.layer.cornerRadius = kPageWidth/2;
            [_topHidenHightLightCircles addSubview:circle];
        }
        [_hightLightView addSubview:_topHidenHightLightCircles];
        [self addSubview:_hightLightView];
    }
    
    //---layer 实现
    {
//        //---创建图层
//        _hightLightLayer = [CALayer layer];
//        //---设置图层属性
////        _hightLightLayer.backgroundColor = [UIColor redColor].CGColor;
//        _hightLightLayer.position = CGPointMake(25, self.height/2);
//        _hightLightLayer.bounds = CGRectMake(0, 0, kPageWidth, kPageHeight);
//        _hightLightLayer.masksToBounds = YES ;
//        _hightLightLayer.cornerRadius = kPageWidth/2;
//        _hightLightLayer.anchorPoint= CGPointMake(0.5, 0.5);
//        
//        //---创建所有高亮圆
//        //------创建图层
//        _topHidenHightLightCircles = [CALayer layer];
//        //------设置图层属性
//        _topHidenHightLightCircles.position = CGPointMake(0, 0);
//        _topHidenHightLightCircles.bounds = CGRectMake(0, 0, (kPageWidth + 5)*count, kPageHeight);
//        _topHidenHightLightCircles.anchorPoint= CGPointZero;
//
//        for (int i = 0; i < count; i++) {
//            
//            CALayer *circle = [CALayer layer];
//            circle.position = CGPointMake((kPageWidth + 5) * i , 0);
//            circle.bounds = CGRectMake(0, 0, kPageWidth, kPageHeight);
//            circle.backgroundColor = [UIColor colorWithRed:0.898 green:0.992 blue:1.000 alpha:1.00].CGColor;
//            circle.cornerRadius = kPageWidth/2;
//            circle.anchorPoint=CGPointZero;
//
//            [_topHidenHightLightCircles addSublayer:circle];
//        }
//        [_hightLightLayer addSublayer:_topHidenHightLightCircles];
//        [self.layer addSublayer:_hightLightLayer];
    }
    
}

//---移动高亮圆
-(void)moveThePage:(double)distance{
    
    //---layer 实现
    {
//        //---计算两个圆圈间移动的范围 （ 0 ~ 1 ）
//        CGFloat scale = distance - (int)distance;
//        if (scale == 0 && distance>=1) {
//            scale = 1;
//        }
//        
//        //---移动的范围 （ 0 ~ 0.2 ）之间，缩小大小
//        if (scale >= 0 && scale <= 0.2) {
//        
//            _hightLightLayer.bounds = CGRectMake(0, 0, kPageWidth*(1.0-scale), kPageHeight*(1.0-scale));
//        }
//        
//        //---移动的范围 （ 0 ~ 0.2 ）之间，放大大小
//        if (scale > 0.8 && scale <= 1.0) {
//            
//            _hightLightLayer.bounds = CGRectMake(0, 0, kPageWidth*scale, kPageHeight*scale);
//        }
//        
//        _hightLightLayer.cornerRadius = _hightLightLayer.bounds.size.width/2;
//        _hightLightLayer.position = CGPointMake(25+distance*(kPageHeight+5),self.height/2);
//        _topHidenHightLightCircles.position = CGPointMake(- (kPageWidth + 5) * distance , 0);
    }
    
    //---UIview 实现
    
    {
        //---计算两个圆圈间移动的范围 （ 0 ~ 1 ）
        CGFloat scale = distance - (int)distance;
        if (scale == 0 && distance>=1) {
            scale = 1;
        }
        //移动距离
        CGFloat moveDistance = distance*(kPageHeight+5);
        //设置房射变换
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        //------_hightLightView
        //设置移动距离
        transform = CGAffineTransformTranslate(transform, moveDistance, 0);
        
        //---移动的范围 （ 0 ~ 0.2 ）之间，缩小大小
        if (scale >= 0 && scale <= 0.2) {
            transform = CGAffineTransformScale(transform, 1.0-scale, 1.0-scale);
        }
        
        //---移动的范围 （ 0.2 ~ 0.8 ）之间，缩小大小固定为0.8
        if (scale > 0.2 && scale < 0.8) {
            transform = CGAffineTransformScale(transform, 0.8, 0.8);
        }
        
        //---移动的范围 （ 0.8 ~ .0 ）之间，缩小大小
        if (scale > 0.8 && scale <= 1) {
            transform = CGAffineTransformScale(transform, scale, scale);
        }
        
        //---应用变换到layer
        _hightLightView.layer.affineTransform = transform;
        
        
        //------_topHidenHightLightCircles
        //---重置变换，应用到 _topHidenHightLightCircles
        transform = CGAffineTransformIdentity;
        //---设置移动距离与 _hightLightView 往相反方向移动相应距离。造成错觉
        transform = CGAffineTransformTranslate(transform, -moveDistance, 0);
        //---应用变换到layer
        _topHidenHightLightCircles.layer.affineTransform = transform;
    
        NSLog(@"--center:%@",NSStringFromCGPoint(_hightLightView.center));
    }
    
}

@end
