//
//  DetailViewController.m
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "DetailViewController.h"
#import "PreviewPlayerViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize movie, theTitles, theImages, theShowtimes, movieDetails;

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
    self.theShowtimes.text = self.movie.allShowtimes;
    
    if (self.movie && self.movie.theMovieShowtimes) {
        
        NSURL * imageURL = [NSURL URLWithString:self.movie.imagesForMovie];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        
        self.theImages.image = image;
        self.theTitles.text = self.movie.titleOfMovie;
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *backButton = (UIButton *)sender;
    if (backButton != nil)
    {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

//Goes to movie trailer view
-(IBAction)previewMovie:(id)sender
{
    movieDetails = [[PreviewPlayerViewController alloc]initWithNibName:@"PreviewPlayerViewController" bundle:nil];
    movieDetails.movieURL = self.movie.moviePreview;
    if (movieDetails != nil)
    {
        [self presentViewController:movieDetails animated:YES completion:nil];
    }
}

@end

