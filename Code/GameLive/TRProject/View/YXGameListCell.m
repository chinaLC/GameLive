//
//  YXGameListCell.m
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameListCell.h"

@interface YXGameListCell ()

/** 主播人名前视图 */
@property (nonatomic, strong) UIImageView *imageName;

/** 人数视图 */
@property (nonatomic, strong) UIImageView *imagePerson;

/** 底部视图 */
@property (nonatomic, strong) UIView *bottomView;

/** 遮罩 */
@property (nonatomic, strong) UIImageView *imgBottomView;
@end
@implementation YXGameListCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageV];
        [self labelMan];
        [self labelName];
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
    }
    return _labelTitle;
}

- (UILabel *)labelMan {
    if(_labelMan == nil) {
        _labelMan = [[UILabel alloc] init];
        [self.imgBottomView addSubview:_labelMan];
        [_labelMan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(0);
        }];
        _labelMan.font = [UIFont systemFontOfSize:12];
        _labelMan.textColor = [UIColor whiteColor];
        [self imagePerson];
    }
    return _labelMan;
}

- (UILabel *)labelName {
    if(_labelName == nil) {
        _labelName = [[UILabel alloc] init];
        [self.imgBottomView addSubview:_labelName];
        [_labelName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageName.mas_right);
            make.bottom.equalTo(0);
            make.width.equalTo(self.imgBottomView.mas_width).dividedBy(2);
        }];
        _labelName.font = [UIFont systemFontOfSize:12];
        _labelName.textColor = [UIColor whiteColor];
        
    }
    return _labelName;
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
	}
	return _bottomView;
}

- (UIImageView *)imgBottomView {
	if(_imgBottomView == nil) {
		_imgBottomView = [[UIImageView alloc] init];
        [self.imageV addSubview:_imgBottomView];
        [_imgBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(20);
        }];
        _imgBottomView.image = [UIImage imageNamed:@"视频遮罩"];
	}
	return _imgBottomView;
}

- (UIImageView *)imageName {
	if(_imageName == nil) {
		_imageName = [[UIImageView alloc] init];
        [self.imgBottomView addSubview:_imageName];
        [_imageName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.height.width.equalTo(12);
            make.bottom.equalTo(-2);
        }];
        _imageName.image = [UIImage imageNamed:@"主播名"];
	}
	return _imageName;
}

- (UIImageView *)imagePerson {
	if(_imagePerson == nil) {
		_imagePerson = [[UIImageView alloc] init];
        [self.imgBottomView addSubview:_imagePerson];
        [_imagePerson mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.labelMan.mas_left);
            make.width.height.equalTo(12);
            make.bottom.equalTo(-2);
        }];
        _imagePerson.image = [UIImage imageNamed:@"观看人数"];
	}
	return _imagePerson;
}


@end
