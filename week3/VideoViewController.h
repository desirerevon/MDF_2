//
//  VideoViewController.h
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController

{
    IBOutlet UITextView *videoURLView;
    
    NSDictionary *mediaInfo;
}

-(IBAction)onPress:(id)sender;

@property (nonatomic, strong) NSDictionary *mediaInfo;

@end