 //
//  ViewController.m
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/14/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "CustomCellViewController.h"
#import "DetailViewController.h"
#import "UserDetailViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize twitterDictionary, twitterData;

- (void)viewDidLoad
{
    //Display loading alert
    [self loadingAlert];
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error){
                if (granted)
                {
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil)
                    {
                        userAccount = [twitterAccounts objectAtIndex:0];
                        if (userAccount != nil)
                        {
                            NSString *userTimeString = @"https://api.twitter.com1.1/statuses/user_timeline.json";
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:nil];
                            if (request != nil)
                            {
                                //1.1 api requires a user to be logged in
                                [request setAccount:userAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200)
                                    {
                                        NSError *jsonError = nil;
                                        
                                        feed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        if (feed != nil)
                                        {
                                            //Causes the tableview to reload
                                            [twitterTableView reloadData];
                                            NSLog(@"%@", [feed description]);
                                        }
                                    }
                                }];
                            }
                        }
                    }
                }
                else
                {
                    NSLog(@"User did not grant access");
                }
            }];
        }
    }    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


//
-(void)reloadFeed
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //Sets the account type to twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            
            //Requests access based on if the user grants access via signing in to twitter on device
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    
                    //An array which holds the users twitter accounts.
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil) {
                        
                        userAccount = [twitterAccounts objectAtIndex:0];
                        if (userAccount != nil) {
                            
                            NSString *timelineString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            //SLrequest for twitter
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:timelineString] parameters:nil];
                            
                            //Sets the request to the users current active twitter account
                            if (request != nil) {
                                [request setAccount:userAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200) {
                                        
                                        NSError *jsonError = nil;
                                        
                                        //Parsing of twitter feed
                                        feed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        
                                        //Reloads tableview
                                        [twitterTableView reloadData];
                                        if (feed != nil) {
                                            
                                            NSLog(@"%@", [feed description]);
                                            
                                        }
                                        
                                    }
                                    
                                }];
                            }
                            
                            NSLog(@"%@",userAccount);
                        }
                        
                    }
                    
                }else
                {
                    //Will display error alert
                    [self errorAlert];
                    NSLog(@"User did not allow access");
                }
                
            }];
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    if (detailView != nil)
    {
        //Create an NSDictionary from the twitter array
        NSDictionary *tweetData = [feed objectAtIndex:indexPath.row];
        
        //Pass the tweetData dictionary to the detail view
        detailView.twitterData = tweetData;
        
        //Show the detailed view controller
        [self presentViewController:detailView animated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (feed != nil)
    {
        return [feed count];
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
    
    CustomCellViewController *cell = (CustomCellViewController *)[nib objectAtIndex:0];
    if (cell != nil)
    {
        twitterDictionary = [feed objectAtIndex:indexPath.row];
        NSString *date = [twitterDictionary objectForKey:@"created_at"];
        NSString *imageUrl = [[twitterDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        if (twitterDictionary != nil)
        {
            cell.imageView.image = [UIImage imageNamed:@"placeholder"];
            cell.tweetLabel.text = (NSString *)[twitterDictionary objectForKey:@"text"];
            cell.dateLabel.text = date;
            cell.imageView.image = [UIImage imageWithData:data];
            
        }
        return cell;
    }
    return nil;
}


-(void)viewDidAppear:(BOOL)animated
{
    //Get the twitter timeline when the view is shown
    [self reloadFeed];
    
    [super viewDidAppear:animated];
}

//Display users twitter profile info
-(IBAction)onDisplay:(id)sender
{
    UIButton *profileButton = (UIButton *)sender;
    if (profileButton != nil)
    {
        UserDetailViewController *userViewController = [[UserDetailViewController alloc]initWithNibName:@"UserDetailViewController" bundle:nil];
        
        NSDictionary *tweetDict = [feed objectAtIndex:0];
        if (tweetDict != nil) {
            
            userViewController.tweetDict = tweetDict;
            [self presentViewController:userViewController animated:YES completion:nil];
        }
    }
    
}

-(IBAction)onRefresh:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    // Will execute reload tweets if clicked
    if (button.tag == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Reloading Tweets" message:@"Please Wait..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.center = CGPointMake(139.5, 75.5);
        [alertView addSubview:spinner];
        [spinner startAnimating];
        [alertView show];
        
        [self reloadFeed];
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        
        NSLog(@"refresh");
        
        //Will execute the post code if clicked
    }else if (button.tag == 1)
    {
        SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        if (slComposeViewController != nil) {
            
            [slComposeViewController setInitialText:@"Posted From"];
            
            [self presentViewController:slComposeViewController animated:true completion:nil];
        }
    }
}

-(void)errorAlert
{
    //Shows if user doesn't add twitter account
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please add a twitter account to your device!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
}

-(void)loadingAlert
{
    //Shows when tweets are loading
    UIAlertView *theAlertView = [[UIAlertView alloc] initWithTitle:@"Loading Tweets..." message:@"Please Wait..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(140, 80);
    [theAlertView addSubview:spinner];
    [spinner startAnimating];
    [theAlertView show];
    [theAlertView dismissWithClickedButtonIndex:0 animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end