//
//  LCLevelIntervalView.m
//  LCLevelIntervalView
//
//  Created by lichao on 2017/8/3.
//  Copyright © 2017年 lichao. All rights reserved.
//

#import "LCLevelIntervalView.h"

@interface LCLevelIntervalView()

@property (nonatomic, strong) UIButton *maskView;

@end
@implementation LCLevelIntervalView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
  }
  return self;
}

- (void)showInView:(UIView *)view {
  NSParameterAssert(view);
  
  if (self.showing) {
    return;
  }
  
  if (!self.maskView) {
    self.maskView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.maskView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:.4]];
    [self.maskView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  }
  
  [view addSubview:self.maskView];
  self.maskView.frame = view.bounds;
  
  [view addSubview:self];
  
  self.frame = CGRectMake(100, 200, [UIScreen mainScreen].bounds.size.width-200, 300);
  
  self.showing = YES;
}

- (void)dismiss {
  if (!self.showing) {
    return;
  }
  
  self.maskView.enabled = NO;
  
  [self.maskView removeFromSuperview];
  self.maskView = nil;
  [self removeFromSuperview];
  self.showing = NO;
}

@end
