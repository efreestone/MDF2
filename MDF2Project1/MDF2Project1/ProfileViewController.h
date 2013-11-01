// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  ProfileViewController.h
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

//Declare profile items (profile image, name, etc)
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *followersLabel;
@property (strong, nonatomic) IBOutlet UILabel *followingLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusCountLabel;
//Declare strings to hold profile details and image
@property (strong, nonatomic) UIImage *profileImage;
@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) NSString *screenNameString;
@property (strong, nonatomic) NSString *descriptionString;
@property (strong, nonatomic) NSString *locationString;
@property (strong, nonatomic) NSString *followersString;
@property (strong, nonatomic) NSString *followingString;
@property (strong, nonatomic) NSString *statusCountString;



@end
