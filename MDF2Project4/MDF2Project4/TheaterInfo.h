// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  TheaterInfo.h
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterInfo : NSObject

//Declare strings for theater name and info
@property (strong, nonatomic) NSString *theaterName;
@property (strong, nonatomic) NSString *theaterInfo;

//Declare theater image
@property (strong, nonatomic) UIImage *theaterImage;

//Declare movie arrays to contain MovieInfo objects for each theater
@property (strong, nonatomic) NSMutableArray *passedMoviesArray1;
@property (strong, nonatomic) NSArray *passedMoviesArray2;
@property (strong, nonatomic) NSArray *passedMoviesArray3;

@end
