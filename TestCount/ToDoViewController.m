//
//  ToDoViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/20.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ToDoViewController.h"
#import "CustomTableViewCell.h"
#import "DataManager.h"

@interface ToDoViewController ()

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    table.delegate = self;
    table.dataSource = self;
    table.allowsSelection = NO;
    
    if (!self.array) {
        self.array = [[NSMutableArray alloc] init];
    }
    
////////////////////////////////////////////////////////////////////
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"******%@", [defaults arrayForKey:@"array"]);
    
    NSLog(@"[----]%@",[defaults arrayForKey:@"text"]);
    
    if ([defaults arrayForKey:@"array"]) {
        self.array = [[defaults arrayForKey:@"array"] mutableCopy];
    }
    
//////////////////////////////////////////////////////////////////////
    
    UINib *nib = [UINib nibWithNibName:@"Empty" bundle:nil];
    [table registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
    //    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"完了" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    //    self.navigationItem.leftBarButtonItem = done;
    
    UIBarButtonItem *plus = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(plus)];
    
    self.navigationItem.rightBarButtonItem = plus;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
    
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
    
    
    NSInteger row = [self.array count];
    
    [self.array insertObject:@"" atIndex:row];

/////////////////////////////////////////////////////////////////////
    
    DataManager *data = [DataManager new];
    
    [data.textArray addObject:@""];
    
    NSLog(data.textArray,@"%@");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.array forKey:@"array"];
    
    [defaults setValue:data.textArray forKey:@"text"];
    
    [defaults synchronize];

///////////////////////////////////////////////////////////////////

    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    
    NSLog(@"self.array ========= %@", self.array);

//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [table insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
 
//    [table reloadData];

    NSLog(@"%long",row);
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdefender = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdefender];
    
    if(!cell){
        
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdefender];
        
    }
    
    /////////////////////////////////////////////////////////////////////////////////////

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    DataManager *dataManager = [[DataManager alloc]init];

    if ([defaults arrayForKey:@"text"]) {
        
        dataManager.textArray = [[defaults arrayForKey:@"text"] mutableCopy];
        
    }

    /////////////////////////////////////////////////////////////////////////////////////
    
    cell.todoTextField.text = dataManager.textArray[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults removeObjectForKey:@"array"];
        [defaults removeObjectForKey:@"text"];
        
        [self.array removeObjectAtIndex:indexPath.row];
        
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
