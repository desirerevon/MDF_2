//
//  TableViewCell.m
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize movieImage, movieTitle, movieShowtimes;

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