//
//  CustomCollectionCell.m
//  MDF2Project2
//
//  Created by Elijah Freestone on 11/4/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "CustomCollectionCell.h"

@implementation CustomCollectionCell

//Synthesize for getters/setters
@synthesize profileImageView, userNameLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//Custom method to refresh cells and apply image/username (from collection view video)
-(void)refreshCellData:(UIImage *)image titleString:(NSString *)titleString {
    profileImageView.image = image;
    userNameLabel.text = titleString;
}

@end
