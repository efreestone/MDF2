// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  DetailsViewController.m
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

//Synthesize for getters/setters
@synthesize iconImage,tweetTextLabel, tweetTimeLabel, tweetTextString, tweetTimeString, tweetProfileImage;

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
    //Set text and image to labels from objects passed from Main View Controller
    iconImage.image = tweetProfileImage;
    tweetTextLabel.text = tweetTextString;
    tweetTimeLabel.text = tweetTimeString;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
