// Elijah Freestone
// MDF2 1311
// Project 2
// November 2nd, 2013

//
//  DetailsViewController.h
//  MDF2Project2
//
//  Created by Elijah Freestone on 11/5/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

//Declare image, label, and close button
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;

//Declare onClose method for close button
-(IBAction)onClose:(id)sender;

@end
