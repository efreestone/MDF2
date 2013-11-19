// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  CustomTableViewCell.h
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

//Declare labels and image view
@property (strong, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *playTimesLabel;
@property (strong, nonatomic) IBOutlet UIImageView *posterImageView;

@end
