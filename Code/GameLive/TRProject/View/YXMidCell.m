//
//  YXMidCell.m
//  TRProject
//
//  Created by 李晨 on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXMidCell.h"

@implementation YXMidCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageView];
        [self labelX];
    }
    return self;
}
- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.centerX.equalTo(0);
            make.width.height.equalTo(70);
        }];
        _imageView.layer.cornerRadius = 35;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)labelX {
    if(_labelX == nil) {
        _labelX = [[UILabel alloc] init];
        [self.contentView addSubview:_labelX];
        [_labelX mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).equalTo(10);
            make.centerX.equalTo(0);
        }];
    }
    return _labelX;
}

@end
