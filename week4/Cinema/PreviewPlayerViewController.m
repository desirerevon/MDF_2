//
//  PreviewPlayerViewController.m
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "PreviewPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@interface PreviewPlayerViewController ()

@end

@implementation PreviewPlayerViewController
@synthesize moviePlayer, movieURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Error message alert
-(void)showErrorDialog {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                    message:@"An unexpected error has occurred. Please try again."
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    
}


-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button != nil)
    {
        if (button.tag == 0)
        {
            //Stop the video from playing
            if (moviePlayer != nil)
            {
                [moviePlayer stop];
            }
        }
        else if (button.tag == 1)
        {
            //Initialize the moviePlayer with the movie URL
            moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
            
            
            if (moviePlayer != nil)
            {
                //Add the movie player view as the movieView subView
                [self.view addSubview:self.moviePlayer.view];
                
                //Set the movieplayer defaults
                moviePlayer.fullscreen = NO;
                moviePlayer.controlStyle = MPMovieControlStyleNone;
                
                //Sets the frame of the video
                moviePlayer.view.frame = CGRectMake(0, 40, 320, 320);
                
                //Play the video from the passed in URL in the movie player
                [moviePlayer play];
                
                //Pause the video for loading; will resume when the notification is hit
                [moviePlayer pause];
                
            } else {
                //Show error alert
                [self showErrorDialog];
            }
            
        }
    }
}

-(IBAction)onBack:(id)sender
{
    UIButton *backButton = (UIButton *)sender;
    if (backButton != nil)
    {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}


@end
