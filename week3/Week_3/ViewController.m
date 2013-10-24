//
//  ViewController.m
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "ViewController.h"
#import "VideoViewController.h"
#import "PhotoViewController.h"
#import "VideoViewController.h"
#import "PhotoAlbumViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>


@interface ViewController ()

@end

@interface ViewController ()

@end

@implementation ViewController

typedef enum
{
    PHOTOCAPTURE = 0,
    VIDEOCAPTURE,
    VIEWALBUM
}captureModes;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Action sets up the buttons for onClick action for each option
- (IBAction)onPress:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button != nil)
    {
        if (button.tag == 0)
        {
            //Photo Capture 
            [self capturePhotoAndVideo:PHOTOCAPTURE];
        }
        else if (button.tag == 1)
        {
            //Video Capture 
            [self capturePhotoAndVideo:VIDEOCAPTURE];
        }
        else if (button.tag == 2)
        {
            //View Captured Images and Video
            [self capturePhotoAndVideo:VIEWALBUM];
        }
    }
}

//Capture Type and Mode
- (void)capturePhotoAndVideo:(int)typeOfCapture
{
    chooseCaptureMode = typeOfCapture;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    imagePicker.allowsEditing = NO;
    
    
    if (typeOfCapture == PHOTOCAPTURE)
    {
        imagePicker.allowsEditing = YES;
    }
    else if (typeOfCapture == VIDEOCAPTURE)
    {
        imagePicker.videoQuality = UIImagePickerControllerQualityTypeMedium;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString*) kUTTypeMovie, nil];
    }
    else if (typeOfCapture == VIEWALBUM)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}



//When the option has been chosen it will then choose the type of media: image, video or album
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        if (chooseCaptureMode == PHOTOCAPTURE)
        {
            PhotoViewController *photoViewer = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
            
            if (photoViewer != nil)
            {
                photoViewer.mediaInfo = info;
                
                [self presentViewController:photoViewer animated:YES completion:nil];
            }
        }
        else if (chooseCaptureMode == VIDEOCAPTURE)
        {
            VideoViewController *videoCapture = [[VideoViewController alloc] initWithNibName:@"VideoViewController" bundle:nil];
            
            if (videoCapture != nil)
            {
                videoCapture.mediaInfo = info;
                
                [self presentViewController:videoCapture animated:YES completion:nil];
            }
        }
        else if (chooseCaptureMode == VIEWALBUM)
        {
            PhotoViewController *albumView = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
            
            if (albumView != nil)
            {
                albumView.mediaInfo = info;
                
                [self presentViewController:albumView animated:YES completion:nil];
            }
        }
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end