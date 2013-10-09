//
//  DetailViewController.h
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : ViewController

{
    IBOutlet UIImageView  *twitterImage;
    IBOutlet UILabel  *screenNameLabel;
    
    FollowerData *info;
}

@property (nonatomic, strong) IBOutlet UIImageView *twitterImage;
@property (nonatomic, strong) IBOutlet UILabel *screenNameLabel;
@property FollowerData *info;

-(IBAction)onBack:(id)sender;

@end