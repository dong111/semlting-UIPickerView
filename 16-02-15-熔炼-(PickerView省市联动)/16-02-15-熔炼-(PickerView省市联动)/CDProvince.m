//
//  CDProvince.m
//  16-02-15-熔炼-(PickerView省市联动)
//
//  Created by 陈栋 on 16/2/17.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDProvince.h"

@implementation CDProvince

- (instancetype) initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) provinceWithDic:(NSDictionary *)dic{
    return [[CDProvince alloc] initWithDic:dic];
}


+ (NSArray *) provincesList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"];
    
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tmpArray  = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArray) {
        CDProvince *province = [[CDProvince alloc] initWithDic:dic];
        [tmpArray addObject:province];
    }
    
    return tmpArray;
}


@end
