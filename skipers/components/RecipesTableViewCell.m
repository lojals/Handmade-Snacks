//
//  RecipesTableViewCell.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/24/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "RecipesTableViewCell.h"

@implementation RecipesTableViewCell
@synthesize ing1,ing2,ing3;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
