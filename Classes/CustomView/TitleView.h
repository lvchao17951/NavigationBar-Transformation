//
//  TitleView.h
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TitleViwDelegate <NSObject>

- (void)leftButtonMethod;
- (void)rightButtonMethod;

@end

@interface TitleView : UIView

@property (nonatomic, assign) id<TitleViwDelegate>delegate;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLabel;


@end
