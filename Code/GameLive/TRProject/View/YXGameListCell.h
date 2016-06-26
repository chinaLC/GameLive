//
//  YXGameListCell.h
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXGameListCell : UICollectionViewCell
/** 直播截图 */
@property (nonatomic, strong) UIImageView *imageV;

/** 直播题目 */
@property (nonatomic, strong) UILabel *labelTitle;

/** 直播人数 */
@property (nonatomic, strong) UILabel *labelMan;

/** 主播名 */
@property (nonatomic, strong) UILabel *labelName;


@end
