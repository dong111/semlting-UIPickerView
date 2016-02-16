//
//  Flag.h
//  16-02-15-熔炼-(点菜系统)
//
//  Created by 陈栋 on 16/2/16.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Flag : UIView

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;

- (instancetype) initWithDic:(NSDictionary *)dic;

+ (instancetype) flagWithDic:(NSDictionary *)dic;


+ (NSArray *) flagsList;
@end
