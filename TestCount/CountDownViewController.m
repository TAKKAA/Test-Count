//
//  CountDownViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/20.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "CountDownViewController.h"
#import "ViewController.h"


@interface CountDownViewController ()

@end

@implementation CountDownViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self button];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    NSLocale* loc = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [df setLocale:loc];
    [df setDateFormat:@"M月 dd日 EEEE HH時 mm分"];
    
    NSString *CurrentDate = [df stringFromDate:[NSDate date]];
    //    NSString *TestDate = [df2 stringFromDate:view.picker.date];
    
    currentLabel.text = CurrentDate;
    
   timer =  [NSTimer scheduledTimerWithTimeInterval:10
                                     target:self
                                   selector:@selector(update)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(time)
                                   userInfo:nil
                                    repeats:YES];
    
    countDownLabel.text = [NSString stringWithFormat:@"テストまであと %.0f日 %.0f時間 %.0f分",countDownDate,countDownHour,countDownMinute];
    
    testLabel.text = test;
    
//　　 日付が変わったら
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(hoge:)
//                                                 name:UIApplicationSignificantTimeChangeNotification
//                                               object:nil];

}

-(void)time{
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    NSLocale* loc = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [df setLocale:loc];
    [df setDateFormat:@"M月 dd日 EEEE HH時 mm分"];
    
    NSString *CurrentDate = [df stringFromDate:[NSDate date]];
    //    NSString *TestDate = [df2 stringFromDate:view.picker.date];
    
    currentLabel.text = CurrentDate;
}

-(void)update{
    
//    ViewController *view = [[ViewController alloc]init];
    
    NSDateFormatter *df2 = [[NSDateFormatter alloc]init];
    NSLocale *loc = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [df2 setLocale:loc];
    [df2 setDateFormat:@"M月 dd日 EEEE曜日 HH時 mm分"];
    
    NSString *CurrentDate = [df2 stringFromDate:[NSDate date]];
//    NSString *TestDate = [df2 stringFromDate:view.picker.date];
    
    NSDate *Current = [df2 dateFromString:CurrentDate];
//    NSDate *Test = [df2 dateFromString:TestDate];
    
    NSTimeInterval since = [Test timeIntervalSinceDate:Current];
    
    countDownDate = floor(since/(24 * 60 * 60));
    
    countDownHour = floor(fmod(since,24*60*60)/ (60*60));
    
    countDownMinute = floor((since - countDownDate * 24*60*60 - countDownHour * 60*60)/60);
    
    countDownLabel.text = [NSString stringWithFormat:@"テストまであと %.0f日 %.0f時間 %.0f分",countDownDate,countDownHour,countDownMinute];
    
    if (countDownMinute == 0) {
      
        [timer invalidate];
        
    }
}

//-(void)hoge:(id)sender{
//    
//    
//   
//    
//}


-(void)button{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(back)];
    
    [self.navigationItem setHidesBackButton:YES];

}

-(void)back{
    
//    CountDownViewController  *view = [self.storyboard instantiateViewControllerWithIdentifier:@"count"];
//    
//    //NavigationControllerを使って遷移する
//    [self.navigationController pushViewController:view animated:YES];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];

    
    [self.navigationItem setHidesBackButton:NO];
    
}

-(void)done{
  
    [self button];
}

-(IBAction)back:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
