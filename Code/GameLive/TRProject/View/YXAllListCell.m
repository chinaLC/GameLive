//
//  YXAllListCell.m
//  TRProject
//
//  Created by 李晨 on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXAllListCell.h"

@interface YXAllListCell ()

/** 底部空白 */
@property (nonatomic, strong) UIView *bottomView;
@end
@implementation YXAllListCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageV];
        [self labelTitle];
    }
    return self;
}
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(self.bottomView.mas_top);
        }];
    }
    return _imageV;
}

- (UILabel *)labelTitle {
    if(_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] init];
        [self.bottomView addSubview:_labelTitle];
        [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _labelTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _labelTitle;
}

- (UIView *)bottomView {
	if(_bottomView == nil) {
		_bottomView = [[UIView alloc] init];
        [self.contentView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
        _bottomView.backgroundColor = [UIColor whiteColor];
        UIView *view = [UIView new];
        [_bottomView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(1);
        }];
        view.backgroundColor = [UIColor lightGrayColor];
	}
	return _bottomView;
}

@end
