//
//  PhotoViewController.h
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController

{
    IBOutlet UIImageView *originalImage;
    IBOutlet UIImageView *editedImage;
    
    UIImage *original;
    UIImage *edited;
    NSDictionary *mediaType;
    NSMutableArray *saveMediaInfo;
    
    int didBothImagesSave;
}

-(IBAction)onPress:(id)sender;

@property (nonatomic, strong) NSDictionary *mediaInfo;

@end