//
//  ToDoViewController.h
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/20.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    IBOutlet UITableView *table;
    
    NSMutableArray *sellArray;
        
//    NSMutableArray *array;
    
}

@property(nonatomic, strong)NSMutableArray *array;

@end
