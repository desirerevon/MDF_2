//
//  ViewController.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PreviewPlayer.h"
#import "HeaderLabelCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    IBOutlet UITableView *myTableView;
    NSArray *allMovies;
    PreviewPlayer *movieData;
    HeaderLabelCell *headerView;

}

@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) PreviewPlayer *movieData;
@property (nonatomic, strong) HeaderLabelCell *headerView;
@property (nonatomic, strong) NSArray *allMovies;

@end
