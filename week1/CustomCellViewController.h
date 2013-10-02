//
//  CustomCellView.h
//  TwitterTestApp
//
//  Created by Desire Gardner on 8/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCellViewController : UITableViewCell
{
    IBOutlet UIImageView *userImage;
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateLabel;
}

@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *tweetLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@end
