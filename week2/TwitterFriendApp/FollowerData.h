//
//  FollowerData.h
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollowerData : NSObject

{
    UIImage *userImage;
    NSString *userNames;
}

-(id)initWithTitle:(NSString*)names images:(UIImage *)profileImage;

@property (nonatomic, strong) UIImage *userImage;
@property (nonatomic, strong) NSString *userNames;

@end