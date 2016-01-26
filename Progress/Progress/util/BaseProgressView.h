//
//  BaseProgressView.h
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseProgressView : UIView
@property (nonatomic,assign) CGFloat percent;
- (void)show;

- (void)hide;

- (void)buildView;
@end
