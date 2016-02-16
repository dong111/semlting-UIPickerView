//
//  FlagViwe.h
//  16-02-15-熔炼-(点菜系统)
//
//  Created by 陈栋 on 16/2/16.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flag.h"

@interface FlagViwe : UIView

@property (nonatomic,strong) Flag *flag;

+ (instancetype)flagView;

@end
