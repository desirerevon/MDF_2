//
//  CustomCollectionCell.h
//  TwitterFriendApp
//
//  Created by Desire Gardner on 10/9/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowerData.h"

@interface CustomCollectionCell : UICollectionViewCell

{
    IBOutlet UIImageView *backgroundImage;
    IBOutlet UILabel *title;
}

-(void)refreshCellData:(UIImage*)image titleString:(NSString *)titleString;

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, strong) IBOutlet UILabel *title;
@property FollowerData *info;


@end