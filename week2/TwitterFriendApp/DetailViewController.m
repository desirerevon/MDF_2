//
//  DetailViewController.m
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize screenNameLabel, twitterImage, info;

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
    twitterImage.image = info.userImage;
    screenNameLabel.text = [NSString stringWithFormat:@"@%@",info.userNames];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onBack:(id)sender
{
    UIButton *backButton = (UIButton *)sender;
    
    if (backButton.tag == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end