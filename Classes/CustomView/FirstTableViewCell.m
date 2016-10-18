//
//  FirstTableViewCell.m
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "FirstTableViewCell.h"
#import <Masonry.h>

@implementation FirstTableViewCell

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
    
    self.countLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.countLabel];
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
        make.size.mas_equalTo(CGSizeMake(72, 24));
        make.top.mas_equalTo(20);
        make.left.equalTo(self.iconImageView).with.offset(40);
    }];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(0);
    }];
    self.countLabel.font = [UIFont systemFontOfSize:14];
    self.countLabel.textColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
    self.countLabel.textAlignment = 2;
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
