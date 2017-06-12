//
//  LoadingView.m
//  test
//
//  Created by llb on 2017/6/8.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "LoadingView.h"
#import "ColorItem.h"

static const int itemNum = 3;
static const CGFloat moveSpace = 50;

@interface LoadingView ()

@property (nonatomic,strong)NSMutableArray *items;

@property (nonatomic,assign)int finishedTime;

@property (nonatomic,assign)BOOL isStop;

@end

@implementation LoadingView

- (NSMutableArray *)items {
    if (!_items) {
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}

+ (instancetype)loadingViewWithFrame:(CGRect)frame {
    return [[self alloc]initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *colors = @[ [UIColor redColor],[UIColor blueColor], [UIColor greenColor] ];
        for (int i = 0 ; i < itemNum; i++) {
            ColorItem *item = [[ColorItem alloc]init];
            [self layoutItem:item andWithIndedx:i];
            item.hidden = YES;
            item.backgroundColor = colors[i];
            [self addSubview:item];
            [self.items addObject:item];
        }
    }
    return self;
}


- (void)startAnimation {
    self.isStop = NO;
    for (UIView *view in self.items) {
        view.hidden = NO;
    }
    [self moveAnimation];

}

- (void)stopAnimation {
    self.isStop = YES;
}

- (void)moveAnimation
{
    _finishedTime = 0;
    __weak typeof(self) wself = self;
    UIView *rightView = self.items.lastObject;
    UIView *middleView = self.items[1];
    UIView *leftView = self.items.firstObject;
    
    CGRect rightOriginFrame  = rightView.frame;
    CGRect middleOriginFrame  = middleView.frame;
    CGRect leftOriginFrame  = leftView.frame;
    
    [UIView animateWithDuration:0.5 animations:^{
        middleView.frame = rightOriginFrame;
    }completion:^(BOOL finished) {
        [wself changeDataSourceWithsignal:finished];
    }];
    [UIView animateWithDuration:0.5 animations:^{
        leftView.frame = middleOriginFrame;
    }completion:^(BOOL finished) {
        [wself changeDataSourceWithsignal:finished];
    }];
    CGRect rightNewFrame = CGRectMake(rightOriginFrame.origin.x + moveSpace, rightOriginFrame.origin.y, rightOriginFrame.size.width, rightOriginFrame.size.width);
    [UIView animateWithDuration:0.25 animations:^{
        rightView.frame = rightNewFrame;
        rightView.alpha = 0.2;
    }completion:^(BOOL finished) {
        rightView.frame = CGRectMake(leftOriginFrame.origin.x - moveSpace, leftOriginFrame.origin.y, leftOriginFrame.size.width, leftOriginFrame.size.height);
        [UIView animateWithDuration:0.25 animations:^{
            rightView.frame = leftOriginFrame;
            rightView.alpha = 1;
        }completion:^(BOOL finished) {
            [wself changeDataSourceWithsignal:finished];
        }];
    }];
    
}

- (void)changeDataSourceWithsignal:(BOOL)finished {
    _finishedTime += 1;
    if (_finishedTime == 3 && self.isStop == NO) {
        id obj = self.items.lastObject;
        [self.items removeLastObject];
        [self.items insertObject:obj atIndex:0];
        [self moveAnimation];
    }
    
}

- (void)layoutItem:(UIView *)item andWithIndedx:(int)index {
    CGFloat centerX = self.center.x;
    CGFloat centerY = self.center.y;
    CGFloat itemWidth = item.frame.size.width;
    if (index == 1) {
        item.center = self.center;
    }else {
        CGFloat itemCenterX = index > 1 ? centerX + itemWidth : centerX - itemWidth;
        item.center = CGPointMake(itemCenterX, centerY);
    }
}

@end
