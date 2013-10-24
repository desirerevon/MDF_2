//
//  TableViewCell.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
{
    IBOutlet UIImageView *movieImage;
    IBOutlet UILabel *movieTitle;
    IBOutlet UILabel *movieShowtimes;
    
}

@property (strong, nonatomic) IBOutlet UIImageView *movieImage;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *movieShowtimes;



@end

