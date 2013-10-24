//
//  PreviewPlayerViewController.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PreviewPlayerViewController : ViewController
{
    MPMoviePlayerController *moviePlayer;
    NSURL *movieURL;
}

-(IBAction)onClick:(id)sender;
-(IBAction)onBack:(id)sender;

-(void)showErrorDialog;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) NSURL *movieURL;

@end