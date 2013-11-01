// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  TwitterCell.m
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "TwitterCell.h"

@implementation TwitterCell

//Synthesize for getters/setters
@synthesize iconImage, tweetTextLabel, tweetTimeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
