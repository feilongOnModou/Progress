//
//  BaseCircleView.m
//  Projress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseCircleView.h"



@interface BaseCircleView ()

@end

@implementation BaseCircleView

@synthesize percent = _percent;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)show {
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    [self buildView];
}

- (void)hide {
    
}

- (void)buildView {
    if (self.percent == 0 || self.percent > 1) {
        return;
    }
    
    if (self.percent == 1) {
        
        CGColorRef color = [UIColor yellowColor].CGColor;
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        
        CGSize viewSize = self.bounds.size;
        
        CGPoint center = CGPointMake(viewSize.width / 2, viewSize.height / 2);
        
        // Draw the slices.
        
        CGFloat radius = viewSize.width/2;
        
        CGContextBeginPath(contextRef);
        
        CGContextMoveToPoint(contextRef, center.x, center.y);
        
        CGContextAddArc(contextRef, center.x, center.y, radius, 0,2*M_PI, 0);
        
        CGContextSetFillColorWithColor(contextRef, color);
        
        CGContextFillPath(contextRef);
        
    } else {
        
        float endAngle = 2*M_PI*self.percent-0.5*M_PI;
        
        CGColorRef color = [UIColor yellowColor].CGColor;
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        
        CGSize viewSize = self.bounds.size;
        
        CGPoint center = CGPointMake(viewSize.width / 2, viewSize.height / 2);
        
        // Draw the slices.
        
        CGFloat radius = viewSize.width / 2;
        
        CGContextBeginPath(contextRef);
        
        CGContextMoveToPoint(contextRef, center.x, center.y);
        
        //CGContextAddArc(contextRef, center.x, center.y, radius, 0,endAngle, 0);
        CGContextAddArc(contextRef, center.x, center.y, radius, -0.5*M_PI,endAngle, 0);
        CGContextSetFillColorWithColor(contextRef, color);
        //        kCGGradientDrawsAfterEndLocation
        CGContextFillPath(contextRef);
    }
}

@end
