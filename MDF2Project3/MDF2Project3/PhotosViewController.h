// Elijah Freestone
// MDF2 1311
// Project 3
// November 9th, 2013

//
//  PhotosViewController.h
//  MDF2Project3
//
//  Created by Elijah Freestone on 11/13/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosViewController : UIViewController

//Declare image views
@property (strong, nonatomic) IBOutlet UIImageView *originalImageView;
@property (strong, nonatomic) IBOutlet UIImageView *editedImageView;
//Declare images passed from ViewController
@property (strong, nonatomic) UIImage *passedSelectedImage;
@property (strong, nonatomic) UIImage *passedEditedImage;

//Declare IBAction methods for save and cancel
-(IBAction)onSaveImage:(id)sender;
-(IBAction)onCancel:(id)sender;

@end
