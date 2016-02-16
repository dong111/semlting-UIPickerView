//
//  flagPickerDelegate.m
//  16-02-15-熔炼-(点菜系统)
//
//  Created by 陈栋 on 16/2/16.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDFlagPickerDelegate.h"

@implementation CDFlagPickerDelegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}
@end
