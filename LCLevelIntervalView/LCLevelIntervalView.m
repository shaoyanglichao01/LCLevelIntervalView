//
//  LCLevelIntervalView.m
//  LCLevelIntervalView
//
//  Created by lichao on 2017/8/3.
//  Copyright © 2017年 lichao. All rights reserved.
//

#import "LCLevelIntervalView.h"
#import <Masonry.h>

#define OPTScreenWidth [UIScreen mainScreen].bounds.size.width
#define OPTScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LCLevelIntervalView()

@property (nonatomic, strong) UIButton *maskView;

@end
@implementation LCLevelIntervalView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
  }
  return self;
}

- (void)showInView:(UIView *)view {
  //  NSParameterAssert(view);
  //
  //  if (self.showing) {
  //    return;
  //  }
  //
  //  if (!self.maskView) {
  //    self.maskView = [UIButton buttonWithType:UIButtonTypeCustom];
  //    [self.maskView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:.4]];
  //    [self.maskView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  //  }
  //
  //  [view addSubview:self.maskView];
  //  self.maskView.frame = view.bounds;
  //
  //  self.frame = CGRectMake(20, OPTScreenHeight, OPTScreenWidth-40, 300);
  //  [view addSubview:self];
  //  [view layoutIfNeeded];
  //
  //  [UIView animateWithDuration:.3 animations:^{
  //    self.center = CGPointMake(OPTScreenWidth/2.0, OPTScreenHeight/2.0);
  //  }];
  //
  //  self.showing = YES;
  
  if (self.showing) {
    return;
  }
  if (!self.maskView.superview) {
    [view addSubview:self.maskView];
  }
  [self.maskView mas_updateConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.maskView.superview);
  }];
  if (!self.superview) {
    [view addSubview:self];
  }
  
  [self mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.trailing.equalTo(self.superview);
    make.top.equalTo(self.superview.mas_bottom).priorityLow();
    make.size.mas_equalTo(CGSizeMake(OPTScreenWidth, 200));
  }];
  
  [view layoutIfNeeded];
  [self mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.equalTo(self.superview.mas_bottom).offset(0).priorityMedium();
  }];
  
  [UIView animateWithDuration:.3
                   animations:^{
                     [view layoutIfNeeded];
                   }];
  self.showing = YES;
}

- (void)dismiss {
  //  if (!self.showing) {
  //    return;
  //  }
  //
  //  self.maskView.enabled = NO;
  //
  //  [self.maskView removeFromSuperview];
  //  self.maskView = nil;
  //  [self removeFromSuperview];
  //  self.showing = NO;
  
  if (!self.showing) {
    return;
  }
  self.maskView.enabled = NO;
  
  [self mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.superview.mas_bottom);
  }];
  
  [UIView animateWithDuration:.2
                   animations:^{
                     [self.superview layoutIfNeeded];
                   } completion:^(BOOL finished){
                     [self removeFromSuperview];
                     [self.maskView removeFromSuperview];
                     self.maskView.enabled = YES;
                   }];
  
  self.showing = NO;
}

- (UIButton *)maskView {
  if (!_maskView) {
    _maskView = [UIButton new];
    _maskView.backgroundColor = [[UIColor blackColor]  colorWithAlphaComponent:.4];
    [_maskView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  }
  return _maskView;
}

@end
