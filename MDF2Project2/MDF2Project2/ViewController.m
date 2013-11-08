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
//Import Reachability (from Apple but not a framework)
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myCollectionView, twitterUsersDict, profileImageLarge, usersDictionary, followerNames, imageURLArray, passedImageString, loadingAlert, imageDictionary, passedScreenName, retryButton;

- (void)viewDidLoad
{
    //Create nib for registration
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionCell" bundle:nil];
    if (cellNib != nil) {
        //Register custom cell nib
        [myCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"CustomCell"];
    }
    
    //Allocate mutable dictionary to hold images with keys
    imageDictionary = [[NSMutableDictionary alloc] initWithCapacity:20];
    
    //Allocate alert view
    loadingAlert = [[UIAlertView alloc] initWithTitle:@"Loading..." message:@"One moment please while your Twitter Friends load. This alert will auto-dismiss when complete." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    //Call checkConnection. Calls getTwitterUsers if connection succeeds
    [self checkConnection];
    
    //NSLog(@"urlDictionary = %@", [imageDictionary description]);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

/*-(void)viewWillAppear:(BOOL)animated {
    [self getTwitterUsers];
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Twitter and connection related methods

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
                    //Disable and hide retry button
                    retryButton.enabled = false;
                    retryButton.hidden = true;
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
                                            //Grab "users" object from twitterUsersDictionary
                                            usersDictionary = [twitterUsersDict objectForKey:@"users"];
                                            //Grab value for "screen_name" of each user and put in an array
                                            followerNames = [usersDictionary valueForKey:@"screen_name"];
                                            //NSLog(@"%@", [followerNames description]);
                                            
                                            imageURLArray = [usersDictionary valueForKey:@"profile_image_url"];
                                            //NSLog(@"%@", [imageURLArray description]);
                                            [myCollectionView reloadData];
                                        }
                                    }
                                }];
                            }
                        }
                    }
                } else {
                    NSLog(@"User did not grant access");
                    //Enable and show retry button
                    retryButton.enabled = true;
                    retryButton.hidden = false;
                    
                    //Show denied alert and hide loading alert
                    [self twitterDeniedAlert];
                    [self dismissLoadingAlert];
                }
            }];
        }
    }
}

//Custom method to check internet connection. Also calls getTwitterUsers
-(void)checkConnection {
    //Check connectivity before sending twitter request. Modified/refactored from Apple example
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus currentNetworkStatus = [networkReachability currentReachabilityStatus];
    //If connection failed
    if (currentNetworkStatus == NotReachable) {
        //Enable and show retry button
        retryButton.enabled = true;
        retryButton.hidden = false;
        //Show no connection alert
        [self noConnectionAlert];
    } else {
        //Show loading alert. Auto-dismisses once loading is done (dismissed in cellForRowAtIndexPath)
        //[loadingAlert show];
        [self showLoadingAlert];
        //Call twitter request method
        [self getTwitterUsers];
    }
}

//Custom method to get profile image
-(void)grabUserImage {
    if (imageURLArray != nil) {
        
        //Cast a new image url string removing "_normal" to get profile image in original size
        NSString *largeImageString = [passedImageString stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
        //NSLog(@"%@", largeImageString);
        //Inject url string into NSURL
        NSURL *largeImageURL = [NSURL URLWithString:largeImageString];
        //Inject image url into NSData
        NSData *largeImageData = [[NSData alloc] initWithContentsOfURL:largeImageURL];
        //Inject NSData into image with data
        //profileImageLarge is "original" sized instead of 48X48px of "_normal" image
        profileImageLarge = [[UIImage alloc] initWithData:largeImageData];
        //[UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }
    [imageDictionary setObject:profileImageLarge forKey:passedScreenName];
    //NSLog(@"urlDictionary = %@", [urlDictionary description]);
}

#pragma mark - Collection View Data Source

//Built in method to set number of cells in a section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (twitterUsersDict != nil) {
        //NSLog(@"feed count = %lu", (unsigned long)[twitterUsersArray count]);
        return [followerNames count];
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
    //Cast single image url string and pass to grabUserImage
    passedImageString = [imageURLArray objectAtIndex:indexPath.row];
    //Cast single screen name and pass to grabUserImage and use as key. Also used to access images in urlDictionary.
    passedScreenName = [followerNames objectAtIndex:indexPath.row];
    //[self grabUserImage];
    
    CustomCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    //NSLog(@"celForItem is working");
    if (cell != nil) {
        //Check if the image exists in urlDictionary
        if ([imageDictionary objectForKey:passedScreenName] == nil) {
            if (imageURLArray != nil) {
                //Call method to grab image and add it to urlDictionary
                [self grabUserImage];
                //Call refresh method in custom cell view
                [cell refreshCellData:[imageDictionary objectForKey:passedScreenName] titleString:[NSString stringWithFormat: @"@%@", passedScreenName]];
            }
        } else {
            //NSLog(@"cell is created");
            //Call refresh method in custom cell view
            [cell refreshCellData:[imageDictionary objectForKey:passedScreenName] titleString:[NSString stringWithFormat: @"@%@", passedScreenName]];
        
            NSLog(@"urlDictionary cell = %@", [imageDictionary description]);
        }
        //Dismiss the refresh alert view (does nothing if the alert view isn't currently shown such as initial loading).
        [self dismissLoadingAlert];
        return cell;
    }
    return nil;
}

//Built in method to grab which cell was selected and send the info to details view
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //Cast single image url string and pass to grabUserImage
    passedImageString = [imageURLArray objectAtIndex:indexPath.row];
    //Cast single screen name and pass to grabUserImage and use as key. Also used to access images in urlDictionary.
    passedScreenName = [followerNames objectAtIndex:indexPath.row];
    //[self grabUserImage];
    //Allocate detail view with nibs for either device
    DetailsViewController *detailsView_iPhone = [[DetailsViewController alloc] initWithNibName:@"DetailsView_iPhone" bundle:nil];
    DetailsViewController *detailsView_iPad = [[DetailsViewController alloc] initWithNibName:@"DetailsView_iPad" bundle:nil];
    //Check device type
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //Device is iPhone
        if (detailsView_iPhone != nil) {
            [self presentViewController:detailsView_iPhone animated:TRUE completion:nil];
            detailsView_iPhone.profileImageView.image = [imageDictionary objectForKey:passedScreenName];
            detailsView_iPhone.userNameLabel.text = [NSString stringWithFormat:@"@%@", passedScreenName];
        }
    } else {
        //Device is iPad
        if (detailsView_iPad != nil) {
            [self presentViewController:detailsView_iPad animated:TRUE completion:nil];
            detailsView_iPad.profileImageView.image = [imageDictionary objectForKey:passedScreenName];
            detailsView_iPad.userNameLabel.text = [NSString stringWithFormat:@"@%@", passedScreenName];
        }
    }
}

#pragma mark - Alert view related code

-(void)showLoadingAlert {
    [loadingAlert show];
    //Disable and hide retry button
    retryButton.enabled = false;
    retryButton.hidden = true;
}

//Method to dimiss the loading alert view after the refresh is complete. Called in cellForRowAtIndexPath
-(void)dismissLoadingAlert {
    [loadingAlert dismissWithClickedButtonIndex:-1 animated:true];
}

//Method to create and show alert if twitter access was denied
-(void)twitterDeniedAlert {
    //Enable and show retry button
    retryButton.enabled = true;
    retryButton.hidden = false;
    //Allocate alert view
    UIAlertView *deniedAlert = [[UIAlertView alloc] initWithTitle:@"Access Denied!" message:@"Access to Twitter was denied. Please approve access if you would like to use this app. Go to \"Settings/Twitter\", flip switch next to \"MDF2Project@\" and tap Retry." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show alert
    [deniedAlert show];
}

//Method to create and show alert view if there is no internet connectivity
-(void)noConnectionAlert {
    UIAlertView *connectionAlert = [[UIAlertView alloc] initWithTitle:@"No Connection!" message:@"There is no Internet Connection. Please turn on WiFi and tap Retry." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show alert
    [connectionAlert show];
}

//Method to retry connection and/or twitter access
-(IBAction)onRetryClick:(id)sender {
    [self checkConnection];
}

@end
