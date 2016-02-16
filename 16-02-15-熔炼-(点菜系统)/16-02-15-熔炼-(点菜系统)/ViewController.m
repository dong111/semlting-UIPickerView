//
//  ViewController.m
//  16-02-15-熔炼-(点菜系统)
//
//  Created by 陈栋 on 16/2/15.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//菜单数据
@property (nonatomic,strong) NSArray *foots;
//国旗数据
@property (nonatomic,strong) NSArray *flags;
@property (weak, nonatomic) IBOutlet UILabel *fruitView;
@property (weak, nonatomic) IBOutlet UILabel *mainFootView;
@property (weak, nonatomic) IBOutlet UILabel *drinkView;
@property (weak, nonatomic) IBOutlet UIPickerView *flagPickerView;


@end

@implementation ViewController
/**
 *  懒加载数据
 *
 *  @return 菜单数据
 */
- (NSArray *)foots
{
    if (_foots==nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"];
        _foots = [NSArray arrayWithContentsOfFile:filePath];
    }
    return _foots;
}

- (NSArray *)flags
{
    if (_flags==nil) {
        _flags = [Flag flagsList];
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //测试数据
//    NSLog(@"%lu",self.foots.count);
    NSLog(@"%lu",self.flags.count);
    self.fruitView.text = @"您还没有选";
    self.mainFootView.text = @"您还没有选";
    self.drinkView.text = @"您还没有选";
//    CDFlagPickerDelegate *delegate = [[CDFlagPickerDelegate alloc] init];
//    self.flagPickerView.delegate = delegate;
//    self.flagPickerView.dataSource = delegate;
    self.flagPickerView.tag = 1;
    self.flagPickerView.delegate = self;
    self.flagPickerView.dataSource = self;
    
    
}

#pragma mark -UIPickerViewDataSource 实现方法
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView.tag==1) {
        return 1;
    }
    return self.foots.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
        return self.flags.count;
    }
    NSArray *array  = self.foots[component];
    return array.count;
}

#pragma mark -UIPickerViewDelegate 实现方法
//- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    if (pickerView.tag==1) {
//        return nil;
//    }
//    NSArray *array  = self.foots[component];
//    return array[row];
//    return @"haha";
//}
/**
 *  选中picker行事件
 *
 *  @param pickerView <#pickerView description#>
 *  @param row        <#row description#>
 *  @param component  <#component description#>
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    NSLog(@"%lu,%lu",row,component);
    NSArray *items = self.foots[component];
    
    switch (component) {
        case 0:
            self.fruitView.text = items[row];
            break;
        case 1:
            self.mainFootView.text = items[row];
            break;
        case 2:
            self.drinkView.text = items[row];
            break;
        default:
            break;
    }
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (pickerView.tag==1) {
        FlagViwe *flagView = [FlagViwe flagView];
        Flag *flag = self.flags[row];
        NSLog(@"%@--%@",flag.name,flag.icon);
        flagView.flag = flag;
        return flagView;
    }
    return view;
}



-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    if (pickerView.tag==1) {
        return 50;
    }
    return 20;
}
@end
