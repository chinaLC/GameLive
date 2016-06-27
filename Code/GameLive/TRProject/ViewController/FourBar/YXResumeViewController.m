//
//  YXResumeViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXResumeViewController.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "YXLogInViewCell.h"
static NSString *const LogInIdentify = @"YXLogInViewCell";
static NSString *const ResumeIdentify = @"ResumeViewCell";
@interface YXResumeViewController ()

/** <#属性描述#> */
@property (nonatomic) IQKeyboardReturnKeyHandler   *returnKeyHandler;

/** <#属性描述#> */
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation YXResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[YXLogInViewCell class] forCellReuseIdentifier:LogInIdentify];
    self.tableView.tableFooterView = self.bottomView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 2) {
        YXLogInViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LogInIdentify forIndexPath:indexPath];
        cell.textField.placeholder = indexPath.row ? @"请输入密码" : @"请输入手机号";
        cell.imageV.image = indexPath.row ? [UIImage imageNamed:@"密码"]:[UIImage imageNamed:@"用户名"];
        [self.returnKeyHandler addTextFieldView:cell.textField];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ResumeIdentify forIndexPath:indexPath];
        return cell;
    }
    
}
- (void)dealloc{
    self.returnKeyHandler = nil;
}
- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_bottomView addSubview:btn];
        btn.backgroundColor = [UIColor redColor];
        CGFloat width = kScreenW -80;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.centerX.equalTo(0);
            make.width.equalTo(width);
            make.height.equalTo(50);
        }];
        [btn setTitle:@"注册" forState:UIControlStateNormal];
        btn.tintColor = [UIColor whiteColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:22];
        [btn addTarget:self action:@selector(clickTheBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}
- (void)clickTheBtn:sender{
    DDLogError(@"haha");
}
@end
