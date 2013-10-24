//
//  HeaderLabelCell.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderLabelCell : UITableViewCell

{
    IBOutlet UILabel *nameOfTheater;
    IBOutlet UILabel *locationOfTheater;
    IBOutlet UIImageView *imageOfTheater;
    

}


@property (nonatomic, strong) IBOutlet UILabel *nameOfTheater;
@property (nonatomic, strong) IBOutlet UILabel *locationOfTheater;
@property (nonatomic, strong) IBOutlet UIImageView *imageOfTheater;

@end
