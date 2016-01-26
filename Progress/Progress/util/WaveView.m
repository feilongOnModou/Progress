//
//  WaveView.m
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "WaveView.h"

@interface WaveView () {
    
    
    float _currentLinePointY;
    
    float a;
    //波浪速度
    float b;
    //循环波动
    BOOL jia;
    
    CGRect newRect;
}
@end

@implementation WaveView

+(Class)layerClass
{
    return [CAShapeLayer class];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        self.layer.cornerRadius =frame.size.width/2;
        self.layer.masksToBounds = YES;
        a = 1.5;
        b = 0;
        jia = NO;
        
        _currentWaterColor = [UIColor colorWithRed:213/255.0f green:157/255.0f blue:20/255.0f alpha:1];
        [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        //        _waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateWave)];
        //       [_waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        //[[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
        
    }
    return self;
}

//-(void)setWavePercent:(CGFloat)wavePercent {
//    self.wavePercent = wavePercent;
//    _currentLinePointY = self.frame.size.height * (1.0f - wavePercent);
//}

-(void)animateWave {
    if (jia) {
        a += 0.01;
    }else{
        a -= 0.01;
    }
    
    
    if (a<=1) {
        jia = YES;
    }
    
    if (a>=1.5) {
        jia = NO;
    }
    
    
    b+=0.07;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    newRect = rect;
    [self buildView];
}


- (void)show {
    [self setNeedsDisplay];
}

- (void)hide {
    
}

- (void)buildView {
    _currentLinePointY = self.frame.size.height * (1.0f - self.wavePercent);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float y=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, 0, y);
    for(float x=0;x<=self.frame.size.width;x++){
        y= a * sin( x/90*M_PI + 4*b/M_PI ) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.frame.size.width, newRect.size.height);
    CGPathAddLineToPoint(path, nil, 0, newRect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}

@end
