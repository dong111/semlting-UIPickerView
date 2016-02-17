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
//当前默认选择省份
@property (nonatomic,assign) NSInteger indexOfproVinces;
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

#pragma mark --DataSource 方法重写
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
         //获取对应省份的城市个数
       CDProvince *province = self.provinces[self.indexOfproVinces];
        count = province.cities.count;
    }
    return count;
}
#pragma mark --显示数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0) {
        CDProvince *province = self.provinces[row];
        return province.name;
    }
    CDProvince *province = self.provinces[self.indexOfproVinces];
    return province.cities[row];
}

//改变row事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
        //更改索引
        self.indexOfproVinces = row;
        //刷新数据
        //全部刷新
//        [pickerView reloadAllComponents];
        
        //部分刷新
        [pickerView reloadComponent:1];
        
        //不管之前第二列选中第几行，重新刷新数据后，都显示每二列的第一行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}


@end
