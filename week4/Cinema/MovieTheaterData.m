//
//  MovieTheaterData.m
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "MovieTheaterData.h"

@implementation MovieTheaterData
@synthesize theName, theLocation, theImage;

+(MovieTheaterData *)theaterWithName:(NSString*)name location:(NSString*)location andImage:(UIImage*)image
{
    MovieTheaterData *theater = nil;
    
    theater = [[MovieTheaterData alloc] init];
    if (theater != nil)
    {
        theater.theName     = name;
        theater.theLocation = location;
        theater.theImage    = image;
    }
    
    return theater;
}
@end
