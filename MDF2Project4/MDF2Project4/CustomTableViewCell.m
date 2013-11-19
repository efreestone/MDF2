// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  CustomTableViewCell.m
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

//Synthesize for getters/setters
@synthesize movieTitleLabel, playTimesLabel, posterImageView;

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
