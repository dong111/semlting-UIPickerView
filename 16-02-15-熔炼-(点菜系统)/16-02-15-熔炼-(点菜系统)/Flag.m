//
//  Flag.m
//  16-02-15-熔炼-(点菜系统)
//
//  Created by 陈栋 on 16/2/16.
//  Copyright © 2016年 man. All rights reserved.
//

#import "Flag.h"

@implementation Flag
- (instancetype) initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) flagWithDic:(NSDictionary *)dic{
    return [[Flag alloc] initWithDic:dic];
}


+ (NSArray *) flagsList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
    
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tmpArray  = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArray) {
        Flag *flag = [[Flag alloc] initWithDic:dic];
        [tmpArray addObject:flag];
    }
    
    return tmpArray;
}


@end
