// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  ProfileViewController.m
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

//Synthesize IBOutlets for getters/setters
@synthesize iconImage, nameLabel, screenNameLabel, descriptionLabel, locationLabel, followersLabel, followingLabel, statusCountLabel;

//Synthesize strings/image for getters/setters
@synthesize profileImage, nameString, screenNameString, descriptionString, locationString, followersString, followingString, statusCountString;

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
    iconImage.image = profileImage;
    nameLabel.text = nameString;
    screenNameLabel.text = screenNameString;
    descriptionLabel.text = descriptionString;
    locationLabel.text = locationString;
    followersLabel.text = followersString;
    followingLabel.text = followingString;
    statusCountLabel.text = statusCountString;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
