//
//  ViewController.h
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    int chooseCaptureMode;
    NSDictionary *infoDictionary;
}

-(void)capturePhotoAndVideo:(int)captureType;

-(IBAction)onPress:(id)sender;

@end