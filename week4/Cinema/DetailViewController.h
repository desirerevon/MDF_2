//
//  DetailViewController.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PreviewPlayer.h"
#import "PreviewPlayerViewController.h"

@interface DetailViewController : UIViewController

{
    PreviewPlayer *movie;
    PreviewPlayerViewController *movieDetails;
    IBOutlet UIImageView *theImages;
    IBOutlet UILabel *theTitles;
    IBOutlet UILabel *theShowtimes;
}

@property (nonatomic, strong) PreviewPlayerViewController *movieDetails;
@property (nonatomic, strong) PreviewPlayer *movie;
@property (strong, nonatomic) IBOutlet UIImageView *theImages;
@property (strong, nonatomic) IBOutlet UILabel *theTitles;
@property (strong, nonatomic) IBOutlet UILabel *theShowtimes;

-(IBAction)previewMovie:(id)sender;
-(IBAction)onClick:(id)sender;

@end
