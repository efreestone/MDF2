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
//Import photos view controller
#import "PhotosViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    PhotosViewController *photosViewController;
}

//Synthesize for getters/setters
@synthesize originalImageView, editedImageView, originalImageLabel, editedImageLabel, cameraButton, albumButton, videoButton, selectedImage, editedImage;

- (void)viewDidLoad
{
    photosViewController = [[PhotosViewController alloc] init];
    
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
            //Set source type to camera
            pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            //Set delegate
            pickerController.delegate = self;
            //Set editing
            pickerController.allowsEditing = false;
            //Present picker controller
            [self presentViewController:pickerController animated:true completion:nil];
            NSLog(@"Camera button clicked");
        //Album button
        } else if (buttonClicked.tag == 1) {
            //Set source type to saved photos album. "Camera Roll" in the case of my iPad
            pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
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
    selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //photosViewController = [[PhotosViewController alloc] init];
    if (selectedImage != nil) {
        
        photosViewController.passedSelectedImage = selectedImage;
    }
    //Cast edited image into a UIImage
    editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (editedImage != nil) {

        photosViewController.passedEditedImage = editedImage;
    }
    //Dismiss picker view
    [picker dismissViewControllerAnimated:true completion:nil];
}

//Built in method to capture cancel button selection in picker
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //Dismiss picker view
    [picker dismissViewControllerAnimated:true completion:nil];
    //Override push to photos view. Because I am using storyboards, data pass to photos view doesn't work without prepareForSegue and the push is initiated with the albums button.
    [self.navigationController popViewControllerAnimated:true];
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Verify identifier of push segue to photos view
    if ([segue.identifier isEqualToString:@"PhotoView"]) {
        //Grab destination view controller
        photosViewController = segue.destinationViewController;
        
        if (photosViewController != nil) {
            //These are set in didFinishPickingMediaWithInfo
            //photosViewController.passedSelectedImage = selectedImage;
            //photosViewController.passedEditedImage = editedImage;
        }
    }
}

@end
