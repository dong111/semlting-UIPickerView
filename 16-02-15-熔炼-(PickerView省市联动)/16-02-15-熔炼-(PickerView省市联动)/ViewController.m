//
//  ViewController.m
//  16-02-15-熔炼-(PickerView省市联动)
//
//  Created by 陈栋 on 16/2/16.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *provinces;

@end

@implementation ViewController


- (NSArray *)provinces
{
    if (_provinces==nil) {
        _provinces = [CDProvince provincesList];
    }
    return _provinces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //测试数据
//    NSLog(@"%lu",self.provinces.count);
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger count = 0;
    if (component==0) {
        count = self.provinces.count;
    }else if (component==1){
       CDProvince *province = self.provinces[component];
        count = province.cities.count;
    }
    return count;
}

@end
