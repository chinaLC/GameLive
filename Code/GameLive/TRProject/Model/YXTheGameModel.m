//
//  YXTheGameModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTheGameModel.h"

@implementation YXTheGameModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[LinkObjectModel class]};
}
@end



