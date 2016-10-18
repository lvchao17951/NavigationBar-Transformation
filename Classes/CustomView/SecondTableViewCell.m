//
//  SecondTableViewCell.m
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "SecondTableViewCell.h"
#import <Masonry.h>

@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createMyCell];
    }
    return self;
}

- (void)createMyCell
{
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.top.with.left.mas_equalTo(20);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.mas_equalTo(CGSizeMake(102, 24));
        make.top.mas_equalTo(20);
        make.left.equalTo(self.iconImageView).with.offset(40);
    }];
    self.nameLabel.font = [UIFont systemFontOfSize:14.0f];
    self.nameLabel.textColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
