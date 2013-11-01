// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  MainViewController.m
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "MainViewController.h"
//Import twitter cell
#import "TwitterCell.h"
//Import details view controller
#import "DetailsViewController.h"
//Import accounts framework
#import <Accounts/Accounts.h>
//Import social framework
#import <Social/Social.h>

@interface MainViewController ()

@end

@implementation MainViewController

//Synthesize for getters/setters
@synthesize refreshButton, addButton, profileButton, myTableView, twitterFeedArray, profileImage, profileImageLarge;

@synthesize testArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    testArray = [[NSArray alloc] initWithObjects: @{@"Tweet":@"Test 1", @"Time":@"7:55pm Oct 29th, 2103"}, @{@"Tweet":@"Test 2", @"Time":@"7:57pm Oct 29th, 2103"}, @{@"Tweet":@"Test 3", @"Time":@"8:10pm Oct 29th, 2103"}, nil];
    
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
                                        twitterFeedArray = [NSJSONSerialization JSONObjectWithData: responseData options:0 error:nil];
                                        if (twitterFeedArray != nil) {
                                            //NSLog(@"%@", [twitterFeedArray description]);
                                            [myTableView reloadData];
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
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (twitterFeedArray != nil) {
        return [twitterFeedArray count];
        NSLog(@"feed count = %lu", (unsigned long)[twitterFeedArray count]);
    } else {
        return 0;
        NSLog(@"Twitter feed is nil");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Cast a single tweet from twitter feed array into NSDictionary
    NSDictionary *tweetDictionary = [twitterFeedArray objectAtIndex:indexPath.row];
    //Cast user section of tweetDictionary into its own dictionary
    NSDictionary *userDictionary = [tweetDictionary objectForKey:@"user"];
    if (userDictionary != nil) {
        //Cast image url into string
        NSString *imageString = [NSString stringWithFormat: @"%@", [userDictionary valueForKey:@"profile_image_url"]];
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
    }
    //Cast time/date from twitter feed array into NSString
    NSString *dateString = (NSString *) [[twitterFeedArray objectAtIndex:indexPath.row] objectForKey:@"created_at"];
    //NSLog(@"%@", dateString);
    //Allocate date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //Set format for current date
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    //Cast string into NSDate
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    //NSLog(@"NSDate = %@", dateFromString);
    
    [dateFormatter setDateFormat:@"eee, MM/dd/yyyy 'at' hh:mm a"];
    NSString *dateWithNewFormat = [dateFormatter stringFromDate:dateFromString];
    //NSLog(@"dateWithNewFormat: %@", dateWithNewFormat);
    
    //Allocate and reuse cells
    TwitterCell *cell = (TwitterCell *)[tableView dequeueReusableCellWithIdentifier:@"TwitterCell"];
    //Apply text to tweet text label
    cell.tweetTextLabel.text = (NSString *) [[twitterFeedArray objectAtIndex:indexPath.row] objectForKey:@"text"];
    //Apply text to tweet time label
    cell.tweetTimeLabel.text = dateWithNewFormat;
    //Apply icon image
    cell.iconImage.image = profileImage;
    
    return cell;
}

//Method for refresh button click
-(IBAction)onRefreshClick:(id)sender {
    
}

//Method for add button click
-(IBAction)onAddClick:(id)sender {
    
}

#pragma mark - Navigation

//Built in function to pass data with segue to display in DetailsViewContoller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Verify identifier of push segue to Details view
    if ([segue.identifier isEqualToString:@"DetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //Grab destination view controller
        DetailsViewController *detailsViewController = segue.destinationViewController;
        //Send tweet text to NSString in DetailViewController for display
        
        //Cast time/date from twitter feed array into NSString
        NSString *dateString = (NSString *) [[twitterFeedArray objectAtIndex:indexPath.row] objectForKey:@"created_at"];
        //NSLog(@"%@", dateString);
        //Allocate date formatter
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //Set format for current date
        [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"]; //MMM dd, yyyy hh:mm:ss a
        //Cast string into NSDate
        NSDate *dateFromString = [dateFormatter dateFromString:dateString];
        //NSLog(@"NSDate = %@", dateFromString);
        [dateFormatter setDateFormat:@"eee, MM/dd/yyyy 'at' hh:mm a"]; //MM/dd/yyyy HH:mm
        NSString *dateWithNewFormat = [dateFormatter stringFromDate:dateFromString];
        
        detailsViewController.tweetTextString = [[twitterFeedArray objectAtIndex:indexPath.row] objectForKey:@"text"];
        //Send tweet time/date to NSString in DetailViewController for display
        detailsViewController.tweetTimeString = dateWithNewFormat;
        //Send profile image to UIImage in DetailViewController for display
        if (profileImageLarge != nil) {
            //profileImageLarge is original sized instead of 48X48px of "_normal" image
            detailsViewController.tweetProfileImage = profileImageLarge;
        }
    }
}

@end
