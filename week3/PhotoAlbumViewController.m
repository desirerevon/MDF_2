//
//  PhotoAlbumViewController.m
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "PhotoAlbumViewController.h"
#import "AlertViewController.h"

@interface PhotoAlbumViewController ()

@end

@implementation PhotoAlbumViewController

@synthesize mediaInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Opens the camera roll where images are stored 
- (void)viewDidLoad
{
    UIImage *currentImage = [mediaInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    if (currentImage != nil)
    {
        photoView.image = currentImage;
    }
    else if (!currentImage)
    {
        [AlertViewController showAlertWithMessage:@"Alert" message:@"An error occured." confirmText:nil cancelText:@"Ok"];
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPress:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button != nil)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end