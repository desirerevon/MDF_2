//
//  ViewController.h
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/14/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h> 

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    NSArray *feed;
    ACAccount *userAccount;
    UIAlertView *twitAlert;
    UIImage *theImage;
    NSString *linkedImage;
    NSDictionary *twitterDictionary;
    NSDictionary *twitterData;
    
    IBOutlet UITableView *twitterTableView;
    
}

-(IBAction)onRefresh:(id)sender;
-(IBAction)onDisplay:(id)sender;

-(void)reloadFeed;
-(void)errorAlert;
-(void)loadingAlert;

@property (nonatomic, strong) NSDictionary *twitterDictionary;
@property (nonatomic, strong) NSDictionary *twitterData;


@end
