//
//  DetailViewController.m
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "UserDetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize twitterData;

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
    
    NSString *tweet = [twitterData objectForKey:@"text"];
    
    NSString *date = [twitterData objectForKey:@"created_at"];
    
    
    userName = [twitterData objectForKey:@"screen_name"];
    
    
    tweetView.text = tweet;
    timeLabel.text = date;
    userLabel.text = [[twitterData objectForKey:@"user"] objectForKey:@"screen_name"];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender;
{
    //Dismiss the current view and return to the main view
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end