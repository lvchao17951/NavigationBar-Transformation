//
//  FirstViewController.m
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "MessageViewController.h"
#import <Masonry.h>

@interface MessageViewController ()

@property (nonatomic, strong) UILabel *testLabel;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.testLabel = [[UILabel alloc] init];
    [self.view addSubview:self.testLabel];

    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.mas_equalTo(CGSizeMake(160, 55));
        make.center.equalTo(self.view);
    }];
    self.testLabel.layer.cornerRadius = 10.f;
    self.testLabel.layer.masksToBounds = YES;
    self.testLabel.text = @"测试导航栏是否丝滑返回";
    self.testLabel.font = [UIFont systemFontOfSize:14];
    self.testLabel.textAlignment = 1;
    self.testLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testLabel];
    
    self.title = @"公告";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
