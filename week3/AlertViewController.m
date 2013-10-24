//
//  AlertViewController.m
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController


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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)showAlertWithMessage:(NSString *)title message:(NSString *)message confirmText:(NSString *)confirm cancelText:(NSString *)cancel
{
    //Create a nil UIAlertView object
    UIAlertView *alertView = nil;
    
    //Create the alert and parameters based on if the alert should have more than just a cancel button
    //If the confirm parameter is nil than only a single button alert should be created otherwise create a two button alert
    if (confirm != nil)
    {
        alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancel otherButtonTitles:confirm, nil];
    }
    else if (confirm == nil)
    {
        alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancel otherButtonTitles:nil];
    }
    
    if (alertView != nil)
    {
        //Shows the alert view
        [alertView show];
    }
}


@end