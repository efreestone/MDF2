// Elijah Freestone
// MDF2 1311
// Project 3
// November 9th, 2013

//
//  ViewController.h
//  MDF2Project3
//
//  Created by Elijah Freestone on 11/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>
//Import photos view controller
#import "PhotosViewController.h"


@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//Declare image views
@property (strong, nonatomic) IBOutlet UIImageView *originalImageView;
@property (strong, nonatomic) IBOutlet UIImageView *editedImageView;
//Declare labels
@property (strong, nonatomic) IBOutlet UILabel *originalImageLabel;
@property (strong, nonatomic) IBOutlet UILabel *editedImageLabel;
//Declare camera, album, and video buttons
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UIButton *albumButton;
@property (strong, nonatomic) IBOutlet UIButton *videoButton;

//Declare images
@property (strong, nonatomic) UIImage *selectedImage;
@property (strong, nonatomic) UIImage *editedImage;

//Declare instance of photos view controller
//@property (strong, nonatomic)

//Declare IBAction button click method for camera, album, or video
-(IBAction)onClick:(id)sender;

@end
