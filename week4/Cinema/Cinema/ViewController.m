//
//  ViewController.m
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "PreviewPlayer.h"
#import "MovieTheaterData.h"
#import "HeaderLabelCell.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myTableView, allMovies, movieData, headerView;

- (void)viewDidLoad
{
    [self.myTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MovieTheaterData *alamo = [MovieTheaterData theaterWithName:@"Alamo Drafthouse"
                                             location:@"San Antonio, TX"
                                             andImage:[UIImage imageNamed:@"alamoDrafthouse.png"]];
    MovieTheaterData *amc = [MovieTheaterData theaterWithName:@"AMC Theater"
                                              location:@"San Antonio, TX"
                                              andImage:[UIImage imageNamed:@"AMC.png"]];
    MovieTheaterData *palladium =[MovieTheaterData theaterWithName:@"Palladium"
                                                location:@"San Antonio, TX"
                                                andImage:[UIImage imageNamed:@"Palladium.png"]];
    //begin movie info for each trailer
    self.allMovies = [NSArray arrayWithObjects:
                   [PreviewPlayer movieWithName:@"Captain Phillips"
                                  showTimes:[NSArray arrayWithObjects:@"7:00 AM", @"9:45 PM", @"10:30 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/sony_pictures/captainphillips/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/captainphillips/captainphillips-tlr1_r640s.mov"]
                               whichTheater:alamo],
                   [PreviewPlayer movieWithName:@"Carrie"
                                  showTimes:[NSArray arrayWithObjects:@"11:00 AM", @"1:00 PM", @"5:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/sony_pictures/carrie/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/carrie/carrie-tlr2_r640s.mov"]
                               whichTheater:alamo],
                   [PreviewPlayer movieWithName:@"Gravity"
                                  showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"1:45 PM", @"6:00 PM", @"7:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/wb/gravity/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/gravity/gravity-tlr1_r640s.mov"]
                               whichTheater:alamo],
                   [PreviewPlayer movieWithName:@"The Fifth Estate"
                                  showTimes:[NSArray arrayWithObjects:@"11:15 AM", @"2:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/dreamworks/thefifthestate/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/dreamworks/thefifthestate/thefifthestate-tlr1_r640s.mov"]
                               whichTheater:alamo],
                    [PreviewPlayer movieWithName:@"Cloudy With A Chance Of Meatballs"
                                  showTimes:[NSArray arrayWithObjects:@"11:45 AM", @"12:00 PM", @"1:00 PM", @"2:30 PM", @"5:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/sony_pictures/cloudywithachanceofmeatballs2/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/cloudywithachanceofmeatballs2/cloudywithachanceofmeatballs2-tlr1_r640s.mov"]
                               whichTheater:alamo],
                      
                                            ////end Alamo Theater
                        
                   [PreviewPlayer movieWithName:@" The Fith Estate"
                                  showTimes:[NSArray arrayWithObjects:@"9:00 AM", @"12:00 PM", @"3:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/dreamworks/thefifthestate/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/dreamworks/thefifthestate/thefifthestate-tlr1_r640s.mov"]
                               whichTheater:amc],
                      [PreviewPlayer movieWithName:@"Gravity"
                                         showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"1:45 PM", @"6:00 PM", @"7:00 PM", nil]
                                             image:@"http://trailers.apple.com/trailers/wb/gravity/images/poster.jpg"
                                        trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/gravity/gravity-tlr1_r640s.mov"]
                                      whichTheater:amc],
                   [PreviewPlayer movieWithName:@"Insidious"
                                  showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"2:00 PM", @"2:45 PM", @"3:40 PM", @"5:15 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/filmdistrict/insidious/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/independent/insidiouschapter2/insidiouschapter2-tlr_r640s.mov"]
                               whichTheater:amc],
                      [PreviewPlayer movieWithName:@"Captain Phillips"
                                         showTimes:[NSArray arrayWithObjects:@"7:00 AM", @"9:45 PM", @"10:30 PM", nil]
                                             image:@"http://trailers.apple.com/trailers/sony_pictures/captainphillips/images/poster.jpg"
                                        trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/captainphillips/captainphillips-tlr1_r640s.mov"]
                                      whichTheater:amc],
                   [PreviewPlayer movieWithName:@"Prisoners"
                                  showTimes:[NSArray arrayWithObjects:@"3:00 PM", @"6:00 PM", @"8:00 PM", @"9:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/wb/prisoners/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/prisoners/prisoners-tlr_r640s.mov"]
                               whichTheater:amc],
                   
                                                //// end AMC Theater
                      
                      
                      
                      
                      [PreviewPlayer movieWithName:@"Cloudy With A Chance Of Meatballs"
                                         showTimes:[NSArray arrayWithObjects:@"11:45 AM", @"12:00 PM", @"1:00 PM", @"2:30 PM", @"5:00 PM", nil]
                                             image:@"http://trailers.apple.com/trailers/sony_pictures/cloudywithachanceofmeatballs2/images/poster.jpg"
                                        trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/cloudywithachanceofmeatballs2/cloudywithachanceofmeatballs2-tlr1_r640s.mov"]
                                      whichTheater:palladium],
                   [PreviewPlayer movieWithName:@"Escape Plan"
                                  showTimes:[NSArray arrayWithObjects:@"10:00 AM", @"3:00 PM", @"4:00 PM", nil]
                                      image:@"http://trailers.apple.com/trailers/summit/escapeplan/images/poster.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/summit/escapeplan/escapeplan-tlr2_r640s.mov"]
                               whichTheater:palladium],
                      [PreviewPlayer movieWithName:@"The Fifth Estate"
                                         showTimes:[NSArray arrayWithObjects:@"11:15 AM", @"2:00 PM", nil]
                                             image:@"http://trailers.apple.com/trailers/dreamworks/thefifthestate/images/poster.jpg"
                                        trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/dreamworks/thefifthestate/thefifthestate-tlr1_r640s.mov"]
                                      whichTheater:palladium],
                      [PreviewPlayer movieWithName:@"Gravity"
                                         showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"1:45 PM", @"6:00 PM", @"7:00 PM", nil]
                                             image:@"http://trailers.apple.com/trailers/wb/gravity/images/poster.jpg"
                                        trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/gravity/gravity-tlr1_r640s.mov"]
                                      whichTheater:palladium],
                   [PreviewPlayer movieWithName:@"Runner,Runner"
                                  showTimes:[NSArray arrayWithObjects:@"11:00 AM", @"2:00 PM", @"9:05 PM", nil]
                                      image:@"http://a2.mzstatic.com/us/r30/Video3/v4/87/e5/ad/87e5ad6c-76dc-24c8-dd24-6a7ed97e6940/RNRN_1400x2100_FM1.200x200-75.jpg"
                                 trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/fox/runnerrunner/runnerrunner-tlr2_r640s.mov"]
                               whichTheater:palladium],
                   nil];
                                            ////end Palladium Theater
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Creates a custom table header using the custom CustomHeaderLabel nib
-(UITableViewCell *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *headerNib= [[NSBundle mainBundle] loadNibNamed:@"HeaderLabelCell" owner:self options:nil];
    
    NSArray *theaters = [PreviewPlayer theatersForMovies:self.allMovies];
    MovieTheaterData *theater = [theaters objectAtIndex:section];
    
    headerView = (HeaderLabelCell *)[headerNib objectAtIndex:0];
    
    if (headerView != nil)
    {
        //Create the header data objects
        UIImage *theatreImage = theater.theImage;
        NSString *cinemaName = theater.theName;
        NSString *cinemaLocation = theater.theLocation;
        
        //Assign the data to the table header objects
        headerView.nameOfTheater.text = cinemaName;
        headerView.locationOfTheater.text = cinemaLocation;
        headerView.imageOfTheater.image = theatreImage;
    }
    
    return headerView;
}

//Changes the header height
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

//Assigns the number of sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[PreviewPlayer theatersForMovies:self.allMovies] count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* theaters = [PreviewPlayer theatersForMovies:self.allMovies];
    MovieTheaterData *theater = [theaters objectAtIndex:section];
    return [[PreviewPlayer moviesForTheater:theater fromMovies:self.allMovies] count];
}

//Custom table view cell
-(UITableViewCell *)tableView:(UITableViewCell *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *theaters = [PreviewPlayer theatersForMovies:self.allMovies];
    MovieTheaterData *theater = [theaters objectAtIndex:indexPath.section];
    PreviewPlayer *currentMovie = [[PreviewPlayer moviesForTheater:theater fromMovies:self.allMovies] objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"TableViewCell";
    TableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    NSURL *imageURL = [NSURL URLWithString:currentMovie.imagesForMovie];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    if (cell != nil)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = (TableViewCell *)[views objectAtIndex:0];
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[TableViewCell class]])
            {
                cell.movieImage.image = image;
                cell.movieTitle.text = currentMovie.titleOfMovie;
                cell.movieShowtimes.text = [currentMovie allShowtimes];
            }
        }
    }
    return cell;
}
//When click goes to detail view of movie
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    NSArray *theaters = [PreviewPlayer theatersForMovies:self.allMovies];
    MovieTheaterData *theater = [theaters objectAtIndex:indexPath.section];
    PreviewPlayer *currentMovie = [[PreviewPlayer moviesForTheater:theater fromMovies:self.allMovies] objectAtIndex:indexPath.row];
    detailView.movie = currentMovie;
    
    NSURL *imageURL = [NSURL URLWithString:currentMovie.imagesForMovie];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    if (detailView != nil)
    {
        detailView.theImages.image = image;
        detailView.theTitles.text = currentMovie.titleOfMovie;
        detailView.theShowtimes.text = [currentMovie allShowtimes];
        
        [self presentViewController:detailView animated:YES completion:nil];
    }
}

//Assigns the tableview height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
