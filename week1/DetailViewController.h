//
//  DetailViewController.h
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

{
    NSDictionary *twitterData;
    
    IBOutlet UITextView *tweetView;
    IBOutlet UILabel *userLabel;
    IBOutlet UILabel *timeLabel;
    NSString *userName;
    
}

@property (nonatomic, strong) NSDictionary *twitterData;
@property (nonatomic, strong) NSDictionary *twitterDictionary;



- (IBAction)onClick:(id)sender;

@end