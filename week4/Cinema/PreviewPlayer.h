//
//  PreviewPlayer.h
//  Cinema
//
//  Created by Desire Gardner on 10/20/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieTheaterData.h"


@interface PreviewPlayer : NSObject

{
    NSString *titleOfMovie;
    NSArray *theMovieShowtimes;
    NSURL *moviePreview;
    MovieTheaterData *myTheaters;
}

@property (nonatomic, strong) NSString *titleOfMovie;
@property (nonatomic, strong) NSArray *theMovieShowtimes;
@property (nonatomic, strong) NSString *imagesForMovie;
@property (nonatomic, strong) NSURL *moviePreview;
@property (nonatomic, strong) MovieTheaterData *myTheaters;

+(PreviewPlayer *)movieWithName:(NSString *)name
          showTimes:(NSArray *)showTimes
              image:(NSString *)image
         trailerURL:(NSURL *)trailerURL
       whichTheater:(MovieTheaterData *)theaters;

+(NSArray *)theatersForMovies:(NSArray *)movies;
+(NSArray *)moviesForTheater:(MovieTheaterData *)theaters fromMovies:(NSArray *)movies;
-(NSString *)allShowtimes;

@end
