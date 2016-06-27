//
//  YXMyPageViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXMyPageViewController.h"
#import "YXLogInViewController.h"
static NSString *const myPageIdentify = @"MyPageCell";

@interface YXMyPageViewController ()

/** <#属性描述#> */
@property (nonatomic, strong) NSArray<NSArray<NSString *>*>* cellList;
@end
@implementation YXMyPageViewController
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"我的-默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"我的-焦点"];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:myPageIdentify];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?3:1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myPageIdentify forIndexPath:indexPath];
    cell.textLabel.text = self.cellList[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (NSArray<NSArray<NSString *>*> *)cellList {
    return @[@[@"登录账号"],@[@"聊天记录", @"聊天管理", @"添加好友"]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!indexPath.section) {
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:[YXLogInViewController new]];
        navi.navigationBar.tintColor = [UIColor whiteColor];
        [self presentViewController:navi animated:YES completion:nil];
    }
}

@end
