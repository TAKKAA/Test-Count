//
//  ViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/19.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.picker.minimumDate = [NSDate date];
    
   
}

-(IBAction)DateChanged:(id)sender{
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    NSLocale* loc = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [df setLocale:loc];
    df.dateFormat = @"M月 dd日 EEEE HH時　mm分";
    date.text = [df stringFromDate:self.picker.date];
    test = date.text;
    
}

-(IBAction)decide:(id)sender{
    
    NSDateFormatter *df2 = [[NSDateFormatter alloc]init];
    [df2 setDateFormat:@"M-dd-HH-mm"];
    
    NSString *CurrentDate = [df2 stringFromDate:[NSDate date]];
    NSString *TestDate = [df2 stringFromDate:self.picker.date];
    
//    NSDate *Current = [NSDate date];
//    NSDate *Test = [self.picker date];
    
    NSDate *Current = [df2 dateFromString:CurrentDate];
    Test = [df2 dateFromString:TestDate];

    NSTimeInterval since = [Test timeIntervalSinceDate:Current];
    
    countDownDate = floor(since/(24*60*60));
    
    countDownHour = floor(fmod(since,24*60*60)/ (60*60));
    
    countDownMinute = floor((since - countDownDate * 24*60*60 - countDownHour * 60*60)/60);
    
    NSLog(@"%.0f日",countDownDate);
    NSLog(@"%.0f時間",countDownHour);
    NSLog(@"%.0f分",countDownMinute);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
