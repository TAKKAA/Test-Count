//
//  ToDoViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/20.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ToDoViewController.h"

@interface ToDoViewController ()

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    table.delegate = self;
    table.dataSource = self;
    table.allowsSelection = NO;
    
    array = [[NSMutableArray alloc]init];
    
    text.delegate = self;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"完了" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    self.navigationItem.leftBarButtonItem = done;
    
    UIBarButtonItem *plus = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(plus)];
    
    self.navigationItem.rightBarButtonItem = plus;
    
}

-(void)done{
    
    [text resignFirstResponder];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return array.count;
    return  10;
    
}

//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    NSInteger row = [array count];
//    
//    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
//    
//    [table insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationFade];
//    
//    [table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    
//    NSLog(@"%long",row);
//
//    
//}

-(void)plus{
    
        NSInteger row = [array count];
       [array insertObject:@"a" atIndex:row];

        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    
        [table insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationFade];
        
        [table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
        NSLog(@"%long",row);
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdefender = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdefender];

    CGRect frame = CGRectMake(30, 10, cell.contentView.bounds.size.width -30, 30);

    text = [[UITextView alloc]initWithFrame:frame];
    text.font = [UIFont systemFontOfSize:18];
    text.delegate = self;
//    text.tag = 1;
    [cell.contentView addSubview:text];
    

    
    if(!cell){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdefender];
        
//        [cell.contentView addSubview:text];
        text.delegate =self;
        
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
