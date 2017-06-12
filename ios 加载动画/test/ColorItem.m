//
//  ColorItem.m
//  test
//
//  Created by llb on 2017/6/8.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "ColorItem.h"

@implementation ColorItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.frame = CGRectMake(0, 0, 20, 20);
    }
    return self;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.backgroundColor = color;
}


@end
