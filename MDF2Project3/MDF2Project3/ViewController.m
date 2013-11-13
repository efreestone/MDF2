// Elijah Freestone
// MDF2 1311
// Project 3
// November 9th, 2013

//
//  ViewController.m
//  MDF2Project3
//
//  Created by Elijah Freestone on 11/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize originalImageView, editedImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//onClick method fired by all three buttons on toolbar
-(IBAction)onClick:(id)sender {
    //Cast button sender into UIButton
    UIButton *buttonClicked = (UIButton *)sender;
    //Create instance of image picker
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil) {
        //Camera button
        if (buttonClicked.tag == 0) {
            NSLog(@"Camera button clicked");
        //Album button
        } else if (buttonClicked.tag == 1) {
            //Set source type to photo library
            pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //Set delegate
            pickerController.delegate = self;
            //Set editing
            pickerController.allowsEditing = true;
            //Present picker controller
            [self presentViewController:pickerController animated:true completion:nil];
            NSLog(@"Album button clicked");
        //Video button
        } else if (buttonClicked.tag == 2) {
            NSLog(@"Video button clicked");
        }
    }
}

#pragma mark - picker delegate

//Built in method to capture media selection
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //Cast selected image into a UIImage
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil) {
        //Set original image view as selected image
        originalImageView.image = selectedImage;
    }
    //Cast edited image into a UIImage
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (editedImageView != nil) {
        //Set edited image view as edited image
        editedImageView.image = editedImage;
        //Save image to album
        UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image: didFinishSavingWithError: contextInfo:), nil);
    }
    //Dismiss picker view
    [picker dismissViewControllerAnimated:true completion:nil];
}

//Built in method to capture cancel button selection in picker
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //Dismiss picker view
    [picker dismissViewControllerAnimated:true completion:nil];
}

//Save selector method
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    //An error has occurred while saving
    if (error != nil) {
        [self errorAlertView];
        NSLog(@"%@", [error description]);
    } else {
        [self savedAlertView];
        NSLog(@"Save was successful");
    }
}

#pragma mark - alert view 

//Method to create and show error alert view
-(void)errorAlertView {
    //Create error alert
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An error occurred while attempting to save image. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show error alert
    [errorAlert show];
}

//Method to create and show save successful alert view
-(void)savedAlertView {
    //Create saved alert
    UIAlertView *savedAlert = [[UIAlertView alloc] initWithTitle:@"Save Successful!" message:@"The image was saved successfully." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show alert
    [savedAlert show];
}

@end
