//
//  ViewController.m
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewController.h"
#import "SettingViewController.h"
#import "TitleView.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThirdTableViewCell.h"

#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

@interface ViewController ()<UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource, TitleViwDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerBackView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) TitleView *titleView;

@end

@implementation ViewController


- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     *   @ 会根据 状态栏, 导航栏, 控件 来自动布局, 最好设置为 NO, 自己布局
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.delegate = self;
    
    self.titleView = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, Width, 64)];
    self.titleView.titleLabel.text = @"lvchao0681";
    self.titleView.delegate = self;
    
    [self setUpHeaderView];
   
    [self.view addSubview:self.titleView];

    
}

- (void)setUpHeaderView
{
    self.headerBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Width / 2)];
    self.headerBackView.backgroundColor = [UIColor redColor];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Width / 2)];
    self.headerImageView.image = [UIImage imageNamed:@"感觉"];
    [self.headerBackView addSubview:self.headerImageView];
    self.tableView.tableHeaderView = self.headerBackView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else if (section == 1)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"Cell";
    static NSString *indentifierOne = @"Cell";
    static NSString *indentifierTwo = @"Cell";
    
    if (indexPath.section == 0)
    {
        FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (cell == nil)
        {
            cell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        
        if (indexPath.row == 0)
        {
            cell.iconImageView.image = [UIImage imageNamed:@"Tixing"];
            cell.nameLabel.text = @"上线提醒";
            cell.countLabel.text = @"0";
        }
        else if (indexPath.row == 1)
        {
            cell.iconImageView.image = [UIImage imageNamed:@"Shoucang"];
            cell.nameLabel.text = @"收藏过";
            cell.countLabel.text = @"2";
        }
        else
        {
            cell.iconImageView.image = [UIImage imageNamed:@"Xiaomishu"];
            cell.nameLabel.text = @"小秘书";
            cell.countLabel.text = @"0";
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifierOne];
        if (cell == nil)
        {
            cell = [[SecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifierOne];
        }
        
        cell.iconImageView.image = [UIImage imageNamed:@"Diannao"];
        cell.nameLabel.text = @"扫码登录网页版";
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        
        return cell;
    }
    else
    {
        ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifierTwo];
        if (cell == nil)
        {
            cell = [[ThirdTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifierTwo];
        }
        
        if (indexPath.row == 0)
        {
            cell.iconImageView.image = [UIImage imageNamed:@"Jifen"];
            cell.nameLabel.text = @"积分任务";
            cell.detialLbebl.text = @"获得积分越多, 推荐排名越高";
        }
        else if (indexPath.row == 1)
        {
            cell.iconImageView.image = [UIImage imageNamed:@"Chengjiu"];
            cell.nameLabel.text = @"成就";
        }
        else
        {
            cell.iconImageView.image = [UIImage imageNamed:@"Qianbao"];
            cell.nameLabel.text = @"钱包";
            cell.detialLbebl.text = @"余额 ¥ 0 直豆0";
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
}

// 导航栏丝滑返回
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset < Width / 2)
    {
        /*
         *   @ 透明度 = 偏移量 / 图片的长度
         */
        self.titleView.backView.alpha = yOffset / (Width / 2);
        self.titleView.titleLabel.alpha = yOffset / (Width / 2);
        
        /*   @ yOffset : y轴的偏移量
         *   @ totalOffset : 总的偏移量 = 图片的长 + 偏移量的绝对值
         *   @ f : 总的偏移量  / 图片长度
         *   @ 重新设置 图片 的 尺寸
         */
        if (yOffset < 0)
        {
            CGFloat totalOffset = (Width / 2) + ABS(yOffset);
            CGFloat f = totalOffset / (Width / 2);
            self.headerImageView.frame = CGRectMake(- (Width * f - Width) / 2, yOffset, Width * f, totalOffset);
        }
    }
}

// 代理方法
- (void)leftButtonMethod
{
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
}

- (void)rightButtonMethod
{
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
