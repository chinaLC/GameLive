//
//  YXRecommendHeaderView.h
//  TRProject
//
//  Created by 李晨 on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXRecommendHeaderView : UICollectionReusableView

/** 右上角按钮图 */
@property (nonatomic, strong) UIImageView *imageV;

/** 左上角题目 */
@property (nonatomic, strong) UILabel *labelTitle;

/** 右上角字 */
@property (nonatomic, strong) UILabel *labelDel;

/** 关联点击事件 */
@property (nonatomic, strong) UIControl *con;


@end
