//
//  WriteViewController.m
//  TestCount
//
//  Created by 中山　貴仁 on 2015/03/22.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "WriteViewController.h"
#import "TestPagesViewController.h"

@interface WriteViewController ()

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *title = [array objectAtIndex:titleRow];
    self.title = title;
    
    pc.delegate = self;
    text.delegate = self;
    

//    [self.navigationItem setHidesBackButton:YES];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];
    
        
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(picture)];
    
    doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完了" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    self.navigationItem.rightBarButtonItems = @[cameraButton, doneButton];
    
    [doneButton setEnabled:NO];
    doneButton.tintColor = [UIColor colorWithWhite:0 alpha:0];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(picture)];
    
   


    
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    [doneButton setEnabled:YES];
    doneButton.tintColor = [UIColor colorWithWhite:0 alpha:1.0];
    
}

-(void)done{
    
    [text resignFirstResponder];
    
    [doneButton setEnabled:NO];
    doneButton.tintColor = [UIColor colorWithWhite:0 alpha:0];
    
    
}

//-(void)back{
//    
////    TestPagesViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"table"];
////    
////    //NavigationControllerを使って遷移する
////    [self.navigationController pushViewController:view animated:YES];
//    
//    
//    [self.navigationController popViewControllerAnimated:YES];
//}

-(void)picture{
    
      UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"選択してください"
                            delegate:self
                            cancelButtonTitle:@"キャンセル"
                            destructiveButtonTitle:nil
                            otherButtonTitles:@"カメラロールから選択",@"写真をとる", nil];
    
    [sheet showInView:self.view];
    
    [text resignFirstResponder];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
    
    switch (buttonIndex) {
        case 0:
            
            if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] ) {
                pc  = [[UIImagePickerController alloc] init];
                pc.delegate = self;
                pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:pc animated:YES completion:nil];
            }
            
            break;
            
        case 1:
            
            if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
                pc  = [[UIImagePickerController alloc] init];
                pc.delegate = self;
                pc.sourceType = UIImagePickerControllerSourceTypeCamera;
//                pc.allowsEditing = YES;
                [self presentViewController:pc animated:YES completion:nil];
            }

            break;
            
        default:
            break;
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
   UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    photo.image = image;
    // 非表示領域を設定（四角形）
    CGRect exclusionRect = CGRectMake(0,0, 320, 500);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:exclusionRect];
    // テキストビューに設定
    text.textContainer.exclusionPaths = @[path];

    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = exclusionRect;
    [text addSubview:imageView];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
