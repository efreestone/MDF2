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
//Declare twitter users array
@property (strong, nonatomic) NSDictionary *twitterUsersDict;

//Declare UIImage to hold profile image
@property (strong, nonatomic) UIImage *profileImage;
//Declare second UIImage to fix display issue on detail view.
@property (strong, nonatomic) UIImage *profileImageLarge;

@property (strong, nonatomic) NSDictionary *followerDictionary;

@property (strong, nonatomic) NSString *userNameString;

@property (strong, nonatomic) NSDictionary *countDictionary;

//Declare custom method to grab Twitter followers
-(void)getTwitterUsers;



@end
