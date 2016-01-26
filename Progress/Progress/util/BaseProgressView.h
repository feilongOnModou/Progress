//
//  BaseProgressView.h
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseProgressView : UIView
//环形进度
@property (nonatomic,assign) CGFloat percent;
//中间波浪进度
@property (nonatomic , assign) CGFloat wavePercent;

- (void)show;

- (void)hide;

- (void)buildView;
@end
