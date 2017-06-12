//
//  LoadingView.h
//  test
//
//  Created by llb on 2017/6/8.
//  Copyright © 2017年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

+ (instancetype)loadingViewWithFrame:(CGRect)frame;

- (void)startAnimation;

- (void)stopAnimation;

@end
