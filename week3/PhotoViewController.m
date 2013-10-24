//
//  PhotoViewController.m
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "PhotoViewController.h"
#import "AlertViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

@synthesize mediaInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    

        saveMediaInfo = [[NSMutableArray alloc] init];
        
        didBothImagesSave = 0;
    }
    return self;
}


//selects the type of image 
- (void)viewDidLoad
{
    original = [mediaInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    
    if (original != nil)
    {
        originalImage.image = original;
    }
    

    edited = [mediaInfo objectForKey:@"UIImagePickerControllerEditedImage"];
    
    if (edited != nil)
    {
        editedImage.image = edited;
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Sets up the alerts when button is chosen
- (IBAction)onPress:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button != nil)
    {
        if (button.tag == 0)
        {
            [AlertViewController showAlertWithMessage:@"Alert" message:@"You did not save the image." confirmText:nil cancelText:@"Ok"];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else if (button.tag == 1)
        {
            UIImageWriteToSavedPhotosAlbum(original, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            
            UIImageWriteToSavedPhotosAlbum(edited, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }
}


//Sets up error message alerts
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == nil)
    {
        [saveMediaInfo insertObject:@"Photo was saved." atIndex:0];
    }
    else if (error != nil)
    {
        NSString *errorString;
        
        if (didBothImagesSave == 0)
        {
            errorString = @"Error! Please try again.";
        }
        else if (didBothImagesSave == 1)
        {
            errorString = @"Error! Please try again.";
        }
        
        [saveMediaInfo insertObject:errorString atIndex:0];
    }
    
    if (didBothImagesSave == 1)
    {
        NSString *logIndex1 = [saveMediaInfo objectAtIndex:0];
        NSString *logIndex2 = [saveMediaInfo objectAtIndex:1];
        
        if ([logIndex1 isEqualToString:logIndex2])
        {
            [AlertViewController showAlertWithMessage:@"Alert" message:@"Photos have been saved." confirmText:nil cancelText:@"Ok"];
        }
        else if ([logIndex1 isEqualToString:@"Photo has saved successfully"])
        {
            [AlertViewController showAlertWithMessage:@"Alert" message:@"Photo." confirmText:nil cancelText:@"Ok"];
        }
        else if ([logIndex2 isEqualToString:@"Photo has been saved"])
        {
            [AlertViewController showAlertWithMessage:@"Alert" message:@"An error occured! Please try again." confirmText:nil cancelText:@"Ok"];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    didBothImagesSave++;
}


@end