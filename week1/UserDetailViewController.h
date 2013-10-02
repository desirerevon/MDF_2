//
//  UserDetailViewController.h
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UserDetailViewController : UIViewController
{
    IBOutlet UILabel *usernameLabel;
    IBOutlet UITextView *descriptionView;
    IBOutlet UILabel *followersLabel;
    IBOutlet UILabel *followingLabel;
    IBOutlet UILabel *tweetsLabel;
    IBOutlet UIImageView *imageView;
    
    NSDictionary *tweetDict;
    UIImage *userImage;
}

@property (nonatomic, strong) NSDictionary *tweetDict;
@property (nonatomic, strong) UIImage *userImage;

-(IBAction)onClick:(id)sender;


@end