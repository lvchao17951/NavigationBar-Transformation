//
//  CustomNavigationController.m
//  NavigationBar Transformation
//
//  Created by 吕超 on 16/10/17.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

/*   @ initialize:
 *   @ 在一个类初始之前就加载
 *   @ 属于懒加载
 *   @ 在 init 之前调用, 且只加载一次
 */

+ (void)initialize
{
    [self setUpNavigationBarTheme];
}

// 设置导航栏文字属性
+ (void)setUpNavigationBarTheme
{
    // 统一设置导航栏文字
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    NSMutableDictionary  *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    
   [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    
    [navigationBar setTitleTextAttributes:textAttribute];
}

// 设置 tabBar 隐藏
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

- (void)more
{
    [self popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
