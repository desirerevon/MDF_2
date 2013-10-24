//
//  VideoViewController.m
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "VideoViewController.h"
#import "AlertViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

@synthesize mediaInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //NSURL for extracting the media url.
    NSURL *url = [mediaInfo valueForKey:UIImagePickerControllerMediaURL];
    
    //NSString for holding the path of the previous URL
    NSString *path = [url path];
    
    videoURLView.text = path;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Once the button is chosen for video option it will open and allow recording 
- (IBAction)onPress:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button != nil)
    {
        if (button.tag == 0)
        {
            [AlertViewController showAlertWithMessage:@"Alert" message:@"Your video was canceled." confirmText:nil cancelText:@"Ok"];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else if (button.tag == 1)
        {
            NSURL *urlString = [mediaInfo valueForKey:UIImagePickerControllerMediaURL];
            
            if (urlString)
            {
                NSString *videoPath = [urlString path];
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
            }
        }
    }
}

//Sets up error alert messages for video
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        [AlertViewController showAlertWithMessage:@"Alert" message:@"An error occured. Please try again." confirmText:nil cancelText:@"Ok"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (error == nil)
    {
        [AlertViewController showAlertWithMessage:@"Alert" message:@"Your video has been saved." confirmText:nil cancelText:@"Ok"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end