//
//  CustomTableViewCell.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/05/14.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.todoTextField.delegate =self;
    self.todoTextField.placeholder = @"今日やることを入力";
    self.todoTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.todoTextField.returnKeyType = UIReturnKeyDone;
    
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




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
