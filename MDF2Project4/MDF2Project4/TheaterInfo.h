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

@end
