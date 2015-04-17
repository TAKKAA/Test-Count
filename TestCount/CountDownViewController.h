//
//  CountDownViewController.h
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/20.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface CountDownViewController : UIViewController{
    
   IBOutlet UILabel *countDownLabel;
   IBOutlet UILabel *currentLabel;
   IBOutlet UILabel *testLabel;
    
    NSTimer *timer;

}


-(IBAction)back:(id)sender;


@end
