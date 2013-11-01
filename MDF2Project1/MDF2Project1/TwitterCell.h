// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  TwitterCell.h
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterCell : UITableViewCell

//Declare table view cell items
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *tweetTimeLabel;

@end
