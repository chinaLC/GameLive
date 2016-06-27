//
//  YXLogInViewCell.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLogInViewCell.h"

@implementation YXLogInViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self imageV];
        [self textField];
    }
    return self;
}
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.width.height.equalTo(20);
        }];
    }
    return _imageV;
}

- (UITextField *)textField {
    if(_textField == nil) {
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right).equalTo(10);
            make.right.equalTo(0);
            make.top.equalTo(5);
            make.bottom.equalTo(-5);
        }];
    }
    return _textField;
}

@end
