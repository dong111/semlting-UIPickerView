//
//  FlagViwe.m
//  16-02-15-熔炼-(点菜系统)
//
//  Created by 陈栋 on 16/2/16.
//  Copyright © 2016年 man. All rights reserved.
//

#import "FlagViwe.h"

@interface FlagViwe ()
@property (weak, nonatomic) IBOutlet UILabel *labelView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation FlagViwe

- (void)setFlag:(Flag *)flag
{
    _flag = flag;
    //控件赋值
    self.labelView.text = flag.name;
    self.iconView.image = [UIImage imageNamed:flag.icon];
}


+ (instancetype)flagView
{
    return  [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil]lastObject];
}

@end
