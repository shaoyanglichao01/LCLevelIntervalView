//
//  LCLevelIntervalView.h
//  LCLevelIntervalView
//
//  Created by lichao on 2017/8/3.
//  Copyright © 2017年 lichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCLevelIntervalView : UIView
@property (nonatomic, assign) BOOL showing;

- (void)showInView:(UIView *)view;
- (void)dismiss;

@end

