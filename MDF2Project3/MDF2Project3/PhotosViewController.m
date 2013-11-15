// Elijah Freestone
// MDF2 1311
// Project 3
// November 9th, 2013

//
//  PhotosViewController.m
//  MDF2Project3
//
//  Created by Elijah Freestone on 11/13/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "PhotosViewController.h"
//Import view controller
#import "ViewController.h"

@interface PhotosViewController ()

@end

@implementation PhotosViewController {
    //BOOL to determine if saved alert is showing
    BOOL alertShowing;
}

//Synthesize for getters/setters
@synthesize originalImageView, editedImageView, editedLabel, saveButton, cancelButton, passedSelectedImage, passedEditedImage;

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
    //Set image views with images passed from ViewController
    originalImageView.image = passedSelectedImage;
    editedImageView.image = passedEditedImage;
    
    //Check if passed edited image is nil and hide edited label and buttons if true
    if (passedEditedImage == nil) {
        editedLabel.hidden = true;
        saveButton.hidden = true;
        cancelButton.hidden = true;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - save image and cancel

//Save selector method
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    //An error has occurred while saving
    if (error != nil) {
        [self errorAlertView];
        NSLog(@"%@", [error description]);
    } else {
        if (alertShowing == NO) {
            [self savedAlertView];
        }
        
        NSLog(@"Save was successful");
        [self.navigationController popViewControllerAnimated:true];
    }
}

//Save image. Fired when save button is pressed
-(IBAction)onSaveImage:(id)sender {
    //Save original image
    UIImageWriteToSavedPhotosAlbum(passedSelectedImage, self, @selector(image: didFinishSavingWithError: contextInfo:), nil);
    //Save edited image
    UIImageWriteToSavedPhotosAlbum(passedEditedImage, self, @selector(image: didFinishSavingWithError: contextInfo:), nil);
}

//Cancel image. Fired when cancel button is pressed
-(IBAction)onCancel:(id)sender {
    //Nil out UIImages.
    passedSelectedImage = nil;
    passedEditedImage = nil;
    //Dismiss photos view
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - alert view

//Method to create and show error alert view
-(void)errorAlertView {
    //Create error alert
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An error occurred while attempting to save the image. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show error alert
    [errorAlert show];
}

//Method to create and show save successful alert view
-(void)savedAlertView {
    //Set BOOL alertShow to YES. This is to stop savedAlert from appearing twice when saving both photos
    alertShowing = YES;
    //Create saved alert
    UIAlertView *savedAlert = [[UIAlertView alloc] initWithTitle:@"Save Successful!" message:@"The image was saved successfully." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show alert
    [savedAlert show];
}

@end
