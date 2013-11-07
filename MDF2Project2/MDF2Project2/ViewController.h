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

//Declare UIImage to hold profile image
@property (strong, nonatomic) UIImage *profileImage;
//Declare second UIImage to fix display issue on detail view.
@property (strong, nonatomic) UIImage *profileImageLarge;
//Declare second dictionary to hold "users" object from twitterUsersDictionary
@property (strong, nonatomic) NSDictionary *followerDictionary;

@property (strong, nonatomic) NSString *userNameString;

@property (strong, nonatomic) NSDictionary *usersDictionary;

@property (strong, nonatomic) NSArray *followerNames;

@property (strong, nonatomic) NSArray *imageURLArray;

@property (strong, nonatomic) NSString *passedImageString;

//Declare loading alert view. Displays on initial load and refresh
@property (strong, nonatomic) UIAlertView *loadingAlert;

//Declare custom method to grab Twitter followers
-(void)getTwitterUsers;
//Declare custom method to split follower dictionary into individual user objects
-(void)grabUserImage;
//Method used to dismiss loading alert view. Called in cellForRowAtIndexPath
-(void)dismissLoadingAlert;
//Method to create twitter denied alert if access is denied
-(void)twitterDeniedAlert;



@end
