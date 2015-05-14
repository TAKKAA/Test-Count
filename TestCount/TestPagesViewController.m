//
//  TestPagesViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/21.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "TestPagesViewController.h"
#import "WriteViewController.h"

@interface TestPagesViewController ()

@end

@implementation TestPagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    table.dataSource = self;
    table.delegate = self;
    table.separatorColor = [UIColor blackColor];
//    [table setSeparatorInset:UIEdgeInsetsZero];
//    [table setLayoutMargins:UIEdgeInsetsZero];
//    if ([table respondsToSelector:@selector(layoutMargins)]) {
//        table.layoutMargins = UIEdgeInsetsZero;
//    }

    
    array = [[NSMutableArray alloc] init];
    
    self.title = @"テスト範囲";
    
    [self edit];
    
}

-(void)edit{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(write:)];
     
}

-(void)write:(id)sender{
        
//     WriteViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"move"];
//    
//    //NavigationControllerを使って遷移する
//    [self.navigationController pushViewController:view animated:YES];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"項目を追加"
                                            message:nil
                                            delegate:self
                                            cancelButtonTitle:@"キャンセル"
                                            otherButtonTitles:@"追加", nil];
    
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    UITextField *field = [alert textFieldAtIndex:0];
    field.placeholder = @"教科名を入力";
    
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        NSString *subject = [[alertView textFieldAtIndex:0]text];
        
        NSInteger row = [array count];
        
        [array insertObject:subject atIndex:row];
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
        
        [table insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationFade];
        
        [table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return array.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    }
    
    //セルに入れるテキストを配列から取得
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
       return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WriteViewController *write = [self.storyboard instantiateViewControllerWithIdentifier:@"move"];
    
    [self.navigationController pushViewController:write animated:YES];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
    back.title = @"戻る";
    self.navigationItem.backBarButtonItem = back;
    
//    NSInteger row = indexPath.row;
    titleRow = indexPath.row;
//    NSLog(@"%ld",row);

}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [array removeObjectAtIndex:indexPath.row]; // 削除ボタンが押された行のデータを配列から削除
        [table deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        

    }
    
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
