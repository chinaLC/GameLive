//
//  YXAllListModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXAllListModel.h"

@implementation YXAllListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"firstLetter":@"first_letter"};
}
@end



