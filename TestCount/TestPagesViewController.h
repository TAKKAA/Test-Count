//
//  TestPagesViewController.h
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/21.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import <UIKit/UIKit.h>

NSMutableArray *array;
NSInteger titleRow;

@interface TestPagesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    
    IBOutlet UITableView *table;
    
//    IBOutlet UILabel *label;
    
}

@end
