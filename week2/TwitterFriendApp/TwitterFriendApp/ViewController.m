//
//  ViewController.m
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "ViewController.h"
#import "FollowerData.h"
#import "CustomCollectionCell.h"
#import "DetailViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize myCollectionView, theImage, friends, tweetDictionary, twitterDictionary, userName, info;

- (void)viewDidLoad
{
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionCell" bundle:nil];
    if (nib != nil)
    {
        [myCollectionView registerNib:nib forCellWithReuseIdentifier:@"customCell"];
    }
    
    [super viewDidLoad];
    [self getFriendsWithImages];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)getFriendsWithImages
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //Set account type to twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            
            //Requests user to grant access to twitter on device
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    
                    //Holds the users twitter accounts.
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil) {
                        
                        //Sets the users current account at index 0
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil) {
                            
                            NSString *friendsList = @"https://api.twitter.com/1.1/followers/list.json?cursor=-1&skip_status=true&include_user_entities=false&count=20";
                            
                            //SLrequest for twitter
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendsList] parameters:nil];
                            
                            if (request != nil) {
                                [request setAccount:currentAccount];
                                
                                //Performs request
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200) {
                                        
                                        NSError *jsonError = nil;
                                        
                                        twitterDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        [myCollectionView reloadData];
                                        
                                        userArray = [twitterDictionary objectForKey:@"users"];
                                        userData = [[NSMutableArray alloc]init];
                                        for (int i=0; i<[userArray count]; i++) {
                                            
                                            //String variable that stores all images
                                            NSString *imageUrl = [[userArray objectAtIndex:i] objectForKey:@"profile_image_url"];
                                            
                                            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
                                            
                                            //Handle variable that stores all the screen names
                                            NSString *handle = [[userArray objectAtIndex:i]objectForKey:@"name"];
                                            
                                            UIImage *tweetImage = [UIImage imageWithData:data];
                                            
                                            info = [[FollowerData alloc]initWithTitle:handle images:tweetImage];
                                            [userData addObject:info];
                                            
                                        }
                                    }else{
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [self errorAlert];
                                        });
                                    }
                                    
                                }];
                            }
                            
                            NSLog(@"%@",currentAccount);
                        }
                        
                    }
                    
                }else
                {
                    [self nonGrantedAccessAlert];
                    NSLog(@"User did not allow access");
                }
                
            }];
        }
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [userData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    if (cell != nil) {
        
        
        if (twitterDictionary != nil)
        {
            
            info = [userData objectAtIndex:indexPath.row];
            
            //Access the userimage and screennames from the followerinfo object
            [cell refreshCellData:info.userImage titleString:info.userNames];
        }
        
        return cell;
        
    }
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(125.0f, 125.0f);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    if (detailViewController != nil) {
        
        
        info = [userData objectAtIndex:indexPath.row];
        
        detailViewController.info = info;
        
        [self presentViewController:detailViewController animated:YES completion:nil];
    }
}


-(void)errorAlert
{
    //Shows if can't connect to twitter
    UIAlertView *theAlertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Unable to connect to twitter please try again later!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [theAlertView show];
}

-(void)nonGrantedAccessAlert
{
    //Shows if user doesn't add twitter account
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please add a twitter account to your device!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alertView show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end