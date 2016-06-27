//
//  YXResumeViewCell.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXResumeViewCell.h"

@implementation YXResumeViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self btn];
        [self textField];
    }
    return self;
}
- (UIButton *)btn {
    if(_btn == nil) {
        _btn = [[UIButton alloc] init];
        [self.contentView addSubview:_btn];
        CGFloat width = kScreenW / 4.0;
        CGFloat height = self.contentView.frame.size.height - 20;
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.width.equalTo(width);
            make.height.equalTo(height);
            make.centerY.equalTo(0);
        }];
    }
    return _btn;
}

- (UITextField *)textField {
    if(_textField == nil) {
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(5);
            make.bottom.equalTo(-5);
            make.right.equalTo(self.btn.mas_left).equalTo(-5);
        }];
    }
    return _textField;
}

@end
