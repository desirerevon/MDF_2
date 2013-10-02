//
//  CustomCellView.m
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "CustomCellViewController.h"

@implementation CustomCellViewController
@synthesize tweetLabel, dateLabel, userImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end