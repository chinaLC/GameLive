//
//  YXLogInViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLogInViewController.h"
#import "YXLogInViewCell.h"
#import "IQKeyboardReturnKeyHandler.h"
static NSString *const LogInIdentify = @"YXLogInViewCell";
@interface YXLogInViewController ()
/** <#属性描述#> */
@property (nonatomic) IQKeyboardReturnKeyHandler   *returnKeyHandler;

/** <#属性描述#> */
@property (nonatomic, strong) UIView *viewX;

/** <#属性描述#> */
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation YXLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    self.navigationItem.title = @"登录";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"关闭-默认"] landscapeImagePhone:[UIImage imageNamed:@"关闭-按下"] style:UIBarButtonItemStyleDone target:self action:@selector(backToLastPage:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(resumeTheId:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.tableView registerClass:[YXLogInViewCell class] forCellReuseIdentifier:LogInIdentify];
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType =  UIReturnKeyDone;
    self.tableView.tableHeaderView = self.viewX;
    self.tableView.tableFooterView = self.bottomView;
}
//X
- (void)backToLastPage:sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//注册
- (void)resumeTheId:sender{
    
}
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
    }
    return self;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXLogInViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LogInIdentify forIndexPath:indexPath];
    cell.textField.placeholder = indexPath.row ? @"请输入密码" : @"请输入手机号";
    cell.imageV.image = indexPath.row ? [UIImage imageNamed:@"密码"]:[UIImage imageNamed:@"用户名"];
    [self.returnKeyHandler addTextFieldView:cell.textField];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)dealloc{
    self.returnKeyHandler = nil;
}
- (UIView *)viewX {
	if(_viewX == nil) {
		_viewX = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头像"]];
        [_viewX addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
	}
	return _viewX;
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
        [btn setTitle:@"登录" forState:UIControlStateNormal];
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
