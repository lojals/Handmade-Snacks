//
//  RecipesTableViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/24/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RecipesTableViewController : UITableViewController{
    int counter;
}

@property (strong,nonatomic) NSMutableArray *listSnacks;

@property int idIngrediente;
@property NSString* imgText3;
@end
