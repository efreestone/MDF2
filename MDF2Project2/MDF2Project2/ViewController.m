// Elijah Freestone
// MDF2 1311
// Project 2
// November 2nd, 2013

//
//  ViewController.m
//  MDF2Project2
//
//  Created by Elijah Freestone on 11/2/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"
//Import custom cell
#import "CustomCollectionCell.h"
//Import detail view
#import "DetailsViewController.h"
//Import accounts framework
#import <Accounts/Accounts.h>
//Import social framework
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myCollectionView, twitterUsersDict, profileImage, profileImageLarge, followerDictionary, countDictionary, userNameString, followerInfo, cellNumber;

- (void)viewDidLoad
{
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionCell" bundle:nil];
    if (cellNib != nil) {
        [myCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"CustomCell"];
    }
    
    [self getTwitterUsers];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Twitter call

//Create custom method for grabbing twitter friends so it can be called when needed (modified from project 1)
-(void)getTwitterUsers {
    //Create ACAccountStore to store account details (twitter in this case)
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        //Set account type to twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier: ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            //Set up request with code block
            [accountStore requestAccessToAccountsWithType: accountType options:nil completion: ^(BOOL granted, NSError *error){
                //If access was granted
                if (granted) {
                    //Save accounts to array
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType: accountType];
                    if (twitterAccounts != nil) {
                        //Grab currently logged in twitter account
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil) {
                            
                            //Set up URL for friends request with status skipped
                            NSString *friendListString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                            //Set up request with URL
                            SLRequest *request = [SLRequest requestForServiceType: SLServiceTypeTwitter requestMethod: SLRequestMethodGET URL: [NSURL URLWithString: friendListString] parameters:nil];
                            if (request != nil) {
                                //Set account. Twitter 1.1 API requires authentication (user needs to be logged in)
                                [request setAccount:currentAccount];
                                //Make request to the server
                                [request performRequestWithHandler: ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    //Check status code
                                    NSInteger responseCode = [urlResponse statusCode];
                                    //Response code of 200 means the request was successful
                                    if (responseCode == 200) {
                                        //Put JSON object returned into array
                                        twitterUsersDict = [NSJSONSerialization JSONObjectWithData: responseData options:0 error:nil];
                                        if (twitterUsersDict != nil) {
                                            //NSLog(@"%@", [twitterUsersArray description]);
                                            
                                            countDictionary = [twitterUsersDict objectForKey:@"users"];
                                            followerInfo = [countDictionary valueForKey:@"screen_name"];
                                            NSLog(@"%@", [followerInfo description]);
                                            //NSLog(@"%@", [userDictionary description]);
                                            
                                            //NSLog(@"twitterUserArray count = %lu", (unsigned long)[twitterUsersArray count]);
                                            /*if ([userDictionary isKindOfClass: [NSArray class]]) {
                                                //NSLog(@"is NSArray");
                                                followerInfo = [[NSMutableArray alloc] init];
                                                [followerInfo addObject:userDictionary];
                                                NSLog(@"followerInfo: %@", [followerInfo description]);
                                            }*/
                                            
                                            [myCollectionView reloadData];
                                        }
                                    }
                                }];
                            }
                        }
                    }
                } else {
                    NSLog(@"User did not grant access");
                }
            }];
        }
    }
}

-(void)splitUserDictionary {
    //NSIndexPath *indexPath = [[NSIndexPath alloc] init];
    //followerDictionary = [[twitterUsersDict objectForKey:@"users"] objectAtIndex:indexPath.row];
    //followerInfo = [[NSMutableArray alloc] initWithCapacity:20];
    if (followerDictionary != nil) {
        
        //Cast image url into string
        NSString *imageString = [NSString stringWithFormat:@"%@", [followerDictionary objectForKey:@"profile_image_url"]];
        //Cast a new image url string removing "_normal" to get profile image in original size for detail view
        NSString *largeImageString = [imageString stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
        //NSLog(@"%@", imageString);
        //Inject url string into NSURL
        NSURL *imageURL = [NSURL URLWithString:imageString];
        NSURL *largeImageURL = [NSURL URLWithString:largeImageString];
        //Inject image url into NSData
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
        NSData *largeImageData = [[NSData alloc] initWithContentsOfURL:largeImageURL];
        //Inject NSData into image with data
        profileImage = [[UIImage alloc] initWithData:imageData];
        //profileImageLarge is "original" sized instead of 48X48px of "_normal" image
        profileImageLarge = [[UIImage alloc] initWithData:largeImageData];
        
        //Cast username into string
        userNameString = [NSString stringWithFormat:@"%@", [followerDictionary objectForKey:@"screen_name"]];
    }
    /*for (int i = 0; i <= [countDictionary count]; i++)
    {
        [followerInfo insertObject:userNameString atIndex:i];
        //NSLog(@"followerInfo: %lu", (unsigned long)[followerInfo count]);
    }
    //[followerInfo insertObject:userNameString atIndex:cellNumber];
    NSLog(@"followerInfo: %@", [followerInfo description]);*/
    //return followerDictionary;
}

#pragma mark - Collection View Data Source

//Built in method to set number of cells in a section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (twitterUsersDict != nil) {
        return [followerInfo count];
        //NSLog(@"feed count = %lu", (unsigned long)[twitterUsersArray count]);
    } else {
        return 0;
        NSLog(@"Twitter feed is nil");
    }
}

//Built in method to set number of sections in collection view
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//Built in method to allocate and reuse collection view cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //Split twitterUsersDict into individual dictionaries for each user item.
    followerDictionary = [[twitterUsersDict objectForKey:@"users"] objectAtIndex:indexPath.row];
    //NSLog(@"%d", [userDictionary count]);
    //userDictionary = [firstTweetDict objectForKey:@"user"];
    [self splitUserDictionary];
    //NSLog(@"%@", [followerDictionary description]);
    
    CustomCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    //NSLog(@"celForItem is working");
    if (cell != nil) {
        if (followerDictionary != nil) {
            [self splitUserDictionary];
            //NSLog(@"followerDictionary = %@", [followerDictionary description]);
            //Cast image url into string
            /*NSString *imageString = [NSString stringWithFormat:@"%@", [followerDictionary objectForKey:@"profile_image_url"]];
            //Cast a new image url string removing "_normal" to get profile image in original size for detail view
            NSString *largeImageString = [imageString stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
            //NSLog(@"%@", imageString);
            //Inject url string into NSURL
            NSURL *imageURL = [NSURL URLWithString:imageString];
            NSURL *largeImageURL = [NSURL URLWithString:largeImageString];
            //Inject image url into NSData
            NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
            NSData *largeImageData = [[NSData alloc] initWithContentsOfURL:largeImageURL];
            //Inject NSData into image with data
            profileImage = [[UIImage alloc] initWithData:imageData];
            //profileImageLarge is "original" sized instead of 48X48px of "_normal" image
            profileImageLarge = [[UIImage alloc] initWithData:largeImageData];
            
            //Cast username into string
            userNameString = [NSString stringWithFormat:@"%@", [followerDictionary objectForKey:@"screen_name"]];*/
        }
        //NSLog(@"cell is created");
        [cell refreshCellData:profileImageLarge titleString:[NSString stringWithFormat: @"@%@", userNameString]];
        //NSString *imageName = [NSString stringWithFormat:@"test_image%d", ((indexPath.row % 4) + 1)];
        //[cell refreshCellData:[UIImage imageNamed:imageName] titleString:[NSString stringWithFormat: @"cell %ld", (long)indexPath.row]];
        return cell;
    }
    
    return nil;
}

//Built in method to grab which cell was selected and send the info to details view
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //Split twitterUsersDict into individual dictionaries for each user item.
    followerDictionary = [[twitterUsersDict objectForKey:@"users"] objectAtIndex:indexPath.row];
    [self splitUserDictionary];
    //Allocate detail view with nibs for either device
    DetailsViewController *detailsView_iPhone = [[DetailsViewController alloc] initWithNibName:@"DetailsView_iPhone" bundle:nil];
    DetailsViewController *detailsView_iPad = [[DetailsViewController alloc] initWithNibName:@"DetailsView_iPad" bundle:nil];
    //Check device type
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //Device is iPhone
        if (detailsView_iPhone != nil) {
            [self presentViewController:detailsView_iPhone animated:TRUE completion:nil];
            detailsView_iPhone.profileImageView.image = profileImageLarge;
            detailsView_iPhone.userNameLabel.text = [NSString stringWithFormat:@"@%@", [followerInfo objectAtIndex:indexPath.row]];
        }
    } else {
        //Device is iPad
        if (detailsView_iPad != nil) {
            [self presentViewController:detailsView_iPad animated:TRUE completion:nil];
            detailsView_iPad.profileImageView.image = profileImageLarge;
            detailsView_iPad.userNameLabel.text = [NSString stringWithFormat:@"@%@", [followerDictionary objectForKey:@"screen_name"]];
        }
    }
}

@end
