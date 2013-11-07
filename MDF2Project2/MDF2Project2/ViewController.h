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
//Declare twitter users dictionary (directly from parsing)
@property (strong, nonatomic) NSDictionary *twitterUsersDict;
//Declare second dictionary to hold "users" object from twitterUsersDictionary
@property (strong, nonatomic) NSDictionary *usersDictionary;

//Declare second UIImage to fix display issue on detail view.
@property (strong, nonatomic) UIImage *profileImageLarge;

//Declare array to hold screen names for all users
@property (strong, nonatomic) NSArray *followerNames;
//Declare array to hold image urls for all users
@property (strong, nonatomic) NSArray *imageURLArray;
//Declare string to pass single username to grabUserImage
@property (strong, nonatomic) NSString *passedImageString;

//Declare loading alert view. Displays on initial load and refresh
@property (strong, nonatomic) UIAlertView *loadingAlert;

@property (strong, nonatomic) NSMutableDictionary *urlDictionary;

@property (strong, nonatomic) NSString *passedScreenName;

//Declare custom method to grab Twitter followers
-(void)getTwitterUsers;
//Declare custom method to split follower dictionary into individual user objects
-(void)grabUserImage;
//Method used to dismiss loading alert view. Called in cellForRowAtIndexPath
-(void)dismissLoadingAlert;
//Method to create twitter denied alert if access is denied
-(void)twitterDeniedAlert;



@end
