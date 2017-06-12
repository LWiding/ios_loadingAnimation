//
//  ViewController.m
//  test
//
//  Created by llb on 2017/6/8.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"
@interface ViewController ()

@property (nonatomic, strong) LoadingView *loadingView;
@property (strong, nonatomic) IBOutlet UIButton *stopBtn;

@property (strong, nonatomic) IBOutlet UIButton *startBtn;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loadingView = [LoadingView loadingViewWithFrame:self.view.bounds];
    [self.view addSubview:self.loadingView];
    [self.loadingView startAnimation];
    [self.view bringSubviewToFront:self.startBtn];//放在最前端 防止覆盖
    [self.view bringSubviewToFront:self.stopBtn];
}

- (IBAction)startCurrentAnimation:(UIButton *)sender
{
    [self.loadingView startAnimation];
}

- (IBAction)stopCurrentAnimation:(UIButton *)sender
{
    [self.loadingView stopAnimation];
}

@end
