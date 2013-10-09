//
//  FollowerData.m
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "FollowerData.h"

@implementation FollowerData
@synthesize userNames, userImage;

-(id)initWithTitle:(NSString*)names images:(UIImage *)profileImage;
{
    if ((self = [super init])) {
        
        userImage = profileImage;
        userNames = names;
        
        
    }
    return self;
}

@end