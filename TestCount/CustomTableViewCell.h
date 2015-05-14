//
//  CustomTableViewCell.h
//  TestCount
//
//  Created by 中山　貴仁 on 2015/05/14.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell<UITextFieldDelegate>{
    
    
    
}

@property(nonatomic, weak)IBOutlet UITextField *todoTextField;

@end
