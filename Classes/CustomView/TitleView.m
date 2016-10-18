//
//  TitleView.m
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "TitleView.h"

@interface TitleView()

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end


@implementation TitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createMyView];
    }
    return self;
}

- (void)createMyView
{
    
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.backView.backgroundColor = [UIColor orangeColor];
    self.backView.alpha = 0.0f;
    [self addSubview:self.backView];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(10, 24, 34, 34);
    [self.leftButton setImage:[UIImage imageNamed:@"Message"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(leftClickMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(self.frame.size.width - 40, 24, 34, 34);
    [self.rightButton setImage:[UIImage imageNamed:@"Setting"] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(rightClickMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightButton];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 44, 20, 104, 44)];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.alpha = 0;
    [self addSubview:self.titleLabel];
}

- (void)leftClickMethod
{
    if (_delegate && [_delegate respondsToSelector:@selector(leftButtonMethod)])
    {
        [_delegate leftButtonMethod];
    }
}

- (void)rightClickMethod
{
    if (_delegate && [_delegate respondsToSelector:@selector(rightButtonMethod)])
    {
        [_delegate rightButtonMethod];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
