// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  DetailsViewController.h
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

//Declare image view
@property (strong, nonatomic) IBOutlet UIImageView *posterImageView;
//Declare labels
@property (strong, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *playTimesLabel;

//Declare strings and image set from view controller
@property (strong, nonatomic) NSString *passedMovieTitle;
@property (strong, nonatomic) NSString *passedPlayTimes;
@property (strong, nonatomic) UIImage *passedPosterImage;

@end
