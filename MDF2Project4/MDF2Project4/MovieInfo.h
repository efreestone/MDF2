// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  MovieInfo.h
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject

//Declare movie title and time strings
@property (strong, nonatomic) NSString *movieTitleString;
@property (strong, nonatomic) NSString *playTimeString;

//Declare movie poster image
@property (strong, nonatomic) UIImage *moviePosterImage;

@end
