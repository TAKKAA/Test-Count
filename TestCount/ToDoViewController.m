//
//  ToDoViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/20.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ToDoViewController.h"
#import "CustomTableViewCell.h"

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
    
    UINib *nib = [UINib nibWithNibName:@"Empty" bundle:nil];
    [table registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
    //    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"完了" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    //
    //    self.navigationItem.leftBarButtonItem = done;
    
    UIBarButtonItem *plus = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(plus)];
    
    self.navigationItem.rightBarButtonItem = plus;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return array.count;
    //    return  10;
    
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
    
    if (!array) {
        
        array = [[NSMutableArray alloc] init];
        
    }
    
    // TODO: 現在操作中のセルを取得
    CustomTableViewCell *customCell = [[CustomTableViewCell alloc] init];
    
    NSInteger row = [array count];
    [array insertObject:customCell.todoTextField.text atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [table insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [table reloadData];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *cellIdefender = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdefender];
    
    if(!cell){
        
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdefender];
        
        
    }
    
    cell.todoTextField.text = array[indexPath.row];
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        [array removeObjectAtIndex:indexPath.row];
        
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
