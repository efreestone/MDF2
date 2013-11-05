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
//Import accounts framework
#import <Accounts/Accounts.h>
//Import social framework
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myCollectionView, twitterUsersArray;

- (void)viewDidLoad
{
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionCell" bundle:nil];
    if (cellNib != nil) {
        [myCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"CustomCell"];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Twitter call

//Create custom method for grabbing twitter timeline so it can be called when needed
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
                            
                            //Set up URL for timeline request with count set to 8 and retweets included
                            NSString *userTimelineString = @"https://api.twitter.com/1.1/statuses/user_timeline.json?count=8&include_rts=1";
                            //Set up request with URL
                            SLRequest *request = [SLRequest requestForServiceType: SLServiceTypeTwitter requestMethod: SLRequestMethodGET URL: [NSURL URLWithString: userTimelineString] parameters:nil];
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
                                        twitterUsersArray = [NSJSONSerialization JSONObjectWithData: responseData options:0 error:nil];
                                        if (twitterUsersArray != nil) {
                                            //NSLog(@"%@", [twitterFeedArray description]);
                                            
                                            //[myTableView reloadData];
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

#pragma mark - Collection View Data Source

//Built in function to set number of cells in a section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 51;
}

//Built in function to set number of sections in collection view
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//Built in function to allocate and reuse collection view cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    //NSLog(@"celForItem is working");
    if (cell != nil) {
        NSLog(@"cell is created");
        NSString *imageName = [NSString stringWithFormat:@"test_image%ld", ((indexPath.row % 4) + 1)];
        [cell refreshCellData:[UIImage imageNamed:imageName] titleString:[NSString stringWithFormat: @"cell %ld", (long)indexPath.row]];
        return cell;
    }
    
    return nil;
}





@end
