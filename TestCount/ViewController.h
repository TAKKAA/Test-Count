//
//  ViewController.h
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/19.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

double countDownDate;
double countDownHour;
double countDownMinute;


#import <UIKit/UIKit.h>
#import "CountDownViewController.h"

NSString *test;
NSDate *Test;

@interface ViewController : UIViewController{
    
    IBOutlet UILabel *date;
    
}
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;



-(IBAction)DateChanged:(id)sender;
-(IBAction)decide:(id)sender;




@end

