//
//  ChildrenCircleView.h
//  Projress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseProgressView.h"

@interface ChildrenCircleView : BaseProgressView
@property (nonatomic,assign) CGFloat percent;
- (void)show;

- (void)hide;

- (void)buildView;
@end
