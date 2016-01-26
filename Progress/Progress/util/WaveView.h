//
//  WaveView.h
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseProgressView.h"

@interface WaveView : BaseProgressView
@property (nonatomic,assign) CGFloat wavePercent;

@property (nonatomic , strong) UIColor *currentWaterColor;
- (void)show;

- (void)hide;

- (void)buildView;
@end
