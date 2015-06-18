//
//  CustomTableViewCell.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/05/14.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "DataManager.h"
#import "ToDoViewController.h"

@implementation CustomTableViewCell

@synthesize todoTextField;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ( !(self = [super initWithCoder:aDecoder]) ) return nil;
    self.todoTextField.delegate =self;
    self.todoTextField.placeholder = @"今日やることを入力";
    self.todoTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.todoTextField.returnKeyType = UIReturnKeyDone;
    
//    DataManager *dataManager = [[DataManager alloc]init];
//    ToDoViewController *todoView = [[ToDoViewController alloc]init];
//    dataManager.textArray = [[NSMutableArray alloc]init];
//    todoView.array = [[NSMutableArray alloc]init];
//    
//    
//    self.todoTextField.text = [dataManager.textArray objectAtIndex:todoView.array];
    
    return self;
}


- (void)awakeFromNib {
    // Initialization code
    self.todoTextField.delegate =self;
    self.todoTextField.placeholder = @"今日やることを入力";
    self.todoTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.todoTextField.returnKeyType = UIReturnKeyDone;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.todoTextField.delegate =self;
        self.todoTextField.placeholder = @"今日やることを入力";
        self.todoTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.todoTextField.returnKeyType = UIReturnKeyDone;
    }
    return self;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    int maxInputLength = 14;    //文字制限数
    
    //入力済のテキストを取得
    NSMutableString *str = [self.todoTextField.text mutableCopy];
    
    //入力済のテキストと入力が行われたテキストを結合
    [str replaceCharactersInRange:range withString:string];
    
    if([str length] > maxInputLength)
    {
        return NO;  //入力を禁止する
    }
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.todoTextField resignFirstResponder];
    
    DataManager *dataManager = [[DataManager alloc] init];
    dataManager.textArray = [[NSMutableArray alloc]init];
    
    NSInteger row = [dataManager.textArray count];
    
    [dataManager.textArray insertObject:self.todoTextField.text atIndex:row];
    
    NSLog(@"＝＝＝＝＝＝＝ %@",dataManager.textArray);
    
//////////////////////////////////////////////////////////////////////////
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
       
    [defaults setObject:dataManager.textArray forKey:@"text"];
    
    [defaults synchronize];
    
//////////////////////////////////////////////////////////////////////////
    
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    //    [text resignFirstResponder];
    //
    //    if (!textField.isFirstResponder) {
    //
    //        [textField becomeFirstResponder];
    //
    //    }
    //
    //    return YES;
    [textField endEditing:YES];
    
    return YES;
    
}

//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
////    textField.text
//    
//    return YES;
//}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
