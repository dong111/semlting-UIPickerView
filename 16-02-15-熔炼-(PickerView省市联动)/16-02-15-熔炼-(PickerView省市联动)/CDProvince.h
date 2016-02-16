//
//  CDProvince.h
//  16-02-15-熔炼-(PickerView省市联动)
//
//  Created by 陈栋 on 16/2/17.
//  Copyright © 2016年 man. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDProvince : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSArray *cities;

- (instancetype) initWithDic:(NSDictionary *)dic;

+ (instancetype) provinceWithDic:(NSDictionary *)dic;


+ (NSArray *) provincesList;


@end
