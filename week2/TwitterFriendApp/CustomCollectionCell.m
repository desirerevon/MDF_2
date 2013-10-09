//
//  CustomCollectionCell.m
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "CustomCollectionCell.h"

@implementation CustomCollectionCell
@synthesize backgroundImage, title;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void)refreshCellData:(UIImage*)image titleString:(NSString*)titleString
{
    backgroundImage.image = image;
    title.text = titleString;
}

@end