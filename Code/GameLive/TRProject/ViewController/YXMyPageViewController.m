//
//  YXMyPageViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXMyPageViewController.h"

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
@end
