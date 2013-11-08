// Elijah Freestone
// MDF2 1311
// Project 2
// November 2nd, 2013

//
//  ViewController.h
//  MDF2Project2
//
//  Created by Elijah Freestone on 11/2/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

//Declare collection view
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
//Declare retry button. Only shown and active after connection fails or twitter access denied
@property (strong, nonatomic) IBOutlet UIButton *retryButton;

//Declare twitter users dictionary (directly from parsing)
@property (strong, nonatomic) NSDictionary *twitterUsersDict;
//Declare second dictionary to hold "users" object from twitterUsersDictionary
@property (strong, nonatomic) NSDictionary *usersDictionary;
//Declare mutable dictionary to hold images with keys (cache)
@property (strong, nonatomic) NSMutableDictionary *imageDictionary;

//Declare array to hold screen names for all users
@property (strong, nonatomic) NSArray *followerNames;
//Declare array to hold image urls for all users
@property (strong, nonatomic) NSArray *imageURLArray;
//Declare string to pass single image url string between methods
@property (strong, nonatomic) NSString *passedImageString;
//Declare string used to pass single screen names between methods
@property (strong, nonatomic) NSString *passedScreenName;
//Declare UIImage for "original" sized profile images. Passed into urlDictionary
@property (strong, nonatomic) UIImage *profileImageLarge;

//Declare loading alert view. Displays on initial load and refresh
@property (strong, nonatomic) UIAlertView *loadingAlert;

//Declare IBAction method to retry connection and/or twitter access request
-(IBAction)onRetryClick:(id)sender;

//Declare custom method to check internet connection
-(void)checkConnection;
//Declare custom method to grab Twitter followers
-(void)getTwitterUsers;
//Declare custom method to split follower dictionary into individual user objects
-(void)grabUserImage;
//Method used to dismiss loading alert view. Called in cellForRowAtIndexPath
-(void)dismissLoadingAlert;
//Method to create twitter denied alert if access is denied
-(void)twitterDeniedAlert;



@end
