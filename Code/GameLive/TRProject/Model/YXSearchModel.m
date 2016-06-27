//
//  YXSearchModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSearchModel.h"

@implementation YXSearchModel

@end
@implementation SearchDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items":[LinkObjectModel class]};
}

@end
