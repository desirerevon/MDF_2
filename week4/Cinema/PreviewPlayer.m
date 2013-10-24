//
//  PreviewPlayer.m
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import "PreviewPlayer.h"

@implementation PreviewPlayer
@synthesize titleOfMovie, theMovieShowtimes, moviePreview, myTheaters;

+(PreviewPlayer *)movieWithName:(NSString *)name
                  showTimes:(NSArray *)showTimes
                      image:(NSString *)image
                 trailerURL:(NSURL *)trailerURL
               whichTheater:(MovieTheaterData *)theaters
{
    PreviewPlayer *movie = nil;
    image = [image stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    movie = [[PreviewPlayer alloc] init];
    if (movie != nil)
    {
        movie.titleOfMovie       = name;
        movie.theMovieShowtimes  = showTimes;
        movie.imagesForMovie     = image;
        movie.myTheaters         = theaters;
        movie.moviePreview    = trailerURL;
    }
    
    return movie;
}

+(NSArray *)theatersForMovies:(NSArray*)movies
{
    NSMutableArray *theaters = [NSMutableArray array];
    
    if (movies && movies.count > 0) {
        for (PreviewPlayer *movie in movies) {
            if (movie && ![theaters containsObject:movie.myTheaters]) {
                [theaters addObject:movie.myTheaters];
            }
        }
    }
    
    return theaters;
}

+(NSArray *)moviesForTheater:(MovieTheaterData *)theater fromMovies:(NSArray  *)movies
{
    NSMutableArray *moviesArray = [NSMutableArray array];
    
    if (theater && movies && movies.count > 0) {
        for (PreviewPlayer *movie in movies) {
            if (movies && [movie.myTheaters.theName isEqualToString:theater.theName]) {
                [moviesArray addObject:movie];
            }
        }
    }
    
    return moviesArray;
}

-(NSString *)allShowtimes
{
    NSString *allShowtimes = @"";
    
    if (self.theMovieShowtimes && self.theMovieShowtimes.count > 0) {
        for (int i = 0; i < self.theMovieShowtimes.count; i++) {
            NSString* showTime = [self.theMovieShowtimes objectAtIndex:i];
            if (i == self.theMovieShowtimes.count - 1) {
                allShowtimes = [allShowtimes stringByAppendingFormat:@"%@", showTime];
            } else {
                allShowtimes = [allShowtimes stringByAppendingFormat:@"%@, ", showTime];
            }
        }
    }
    
    return allShowtimes;
}

@end
