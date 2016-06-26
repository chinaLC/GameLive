//
//  YXRecommendHeaderView.m
//  TRProject
//
//  Created by 李晨 on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendHeaderView.h"

@interface YXRecommendHeaderView ()

/** 左方视图 */
@property (nonatomic, strong) UIImageView *leftImage;
@end
@implementation YXRecommendHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageV];
        [self labelDel];
        [self labelTitle];
        [self con];
    }
    return self;
}
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.con addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.labelDel.mas_left).equalTo(-5);
            make.centerY.equalTo(0);
            make.width.height.equalTo(18);
        }];
    }
    return _imageV;
}

- (UILabel *)labelTitle {
    if(_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImage.mas_right).equalTo(8);
            make.centerY.equalTo(0);
        }];
        _labelTitle.font = [UIFont systemFontOfSize:22];
        
    }
    return _labelTitle;
}

- (UILabel *)labelDel {
    if(_labelDel == nil) {
        _labelDel = [[UILabel alloc] init];
        [self.con addSubview:_labelDel];
        [_labelDel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
        }];
        _labelDel.font = [UIFont systemFontOfSize:15];
    }
    return _labelDel;
}


- (UIControl *)con {
    if(_con == nil) {
        _con = [[UIControl alloc] init];
        [self addSubview:_con];
        CGFloat width = kScreenW /4.0;
        [_con mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.height.equalTo(50);
            make.width.equalTo(width);
            make.centerY.equalTo(0);
        }];
//        _con.backgroundColor = [UIColor redColor];
    }
    return _con;
}
- (UIImageView *)leftImage {
	if(_leftImage == nil) {
		_leftImage = [[UIImageView alloc] init];
        [self addSubview:_leftImage];
        [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.width.equalTo(3);
            make.height.equalTo(30);
            make.centerY.equalTo(0);
        }];
        
        _leftImage.image = [UIImage imageNamed:@"栏目标题"];
	}
	return _leftImage;
}

@end
