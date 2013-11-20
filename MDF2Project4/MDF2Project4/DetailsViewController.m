// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  DetailsViewController.m
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

//Synthesize for getters/setters
@synthesize movieTitleLabel, playTimesLabel, posterImageView, passedMovieTitle, passedPlayTimes, passedPosterImage;

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
    movieTitleLabel.text = passedMovieTitle;
    playTimesLabel.text = passedPlayTimes;
    posterImageView.image = passedPosterImage;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
