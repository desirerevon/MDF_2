//
//  MovieTheaterData.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MovieTheaterData : NSObject
{
    NSString *theName;
    NSString *theLocation;
    UIImage *theImage;
}

@property (nonatomic, strong) NSString *theName;
@property (nonatomic, strong) NSString *theLocation;
@property (nonatomic, strong) UIImage *theImage;

+( MovieTheaterData*)theaterWithName:(NSString*)name location:(NSString*)location andImage:(UIImage*)image;

@end
