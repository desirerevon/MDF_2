//
//  ViewController.h
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowerData.h"

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView *myCollectionView;
    UIImageView *theImage;
    NSArray *friends;
    NSDictionary *twitterDictionary;
    NSDictionary *tweetDictionary;
    NSArray *userImage;
    NSArray *imageArray;
    NSArray *userArray;
    NSMutableArray *userData;
}

-(void)errorAlert;
-(void)nonGrantedAccessAlert;

@property (nonatomic, strong) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic, strong) UIImageView *theImage;
@property (nonatomic, strong) UILabel *userName;
@property (nonatomic, strong) NSDictionary *twitterDictionary;
@property (nonatomic, strong) NSDictionary *tweetDictionary;
@property (nonatomic, strong) NSArray *friends;
@property FollowerData *info;

@end