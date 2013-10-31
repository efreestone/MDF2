// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  DetailsViewController.h
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

//Declare table view cell items
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *tweetTimeLabel;
//Declare strings to hold tweet details and image
@property (strong, nonatomic) NSString *tweetTextString;
@property (strong, nonatomic) NSString *tweetTimeString;
@property (strong, nonatomic) UIImage *tweetProfileImage;

@end
