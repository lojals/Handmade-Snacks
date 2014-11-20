//
//  RecipeViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/25/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listSnack.h"
#import <Social/Social.h>


@interface RecipeViewController : UIViewController{
    SLComposeViewController *mySLComposerSheet;
}


@property int language;

@property (nonatomic,strong) IBOutlet UIImageView* image;

@property (nonatomic, strong) IBOutlet UIImageView *ing1;
@property (nonatomic, strong) IBOutlet UIImageView *ing2;
@property (nonatomic, strong) IBOutlet UIImageView *ing3;
@property (nonatomic, strong) IBOutlet UILabel *titleIng;

@property (nonatomic, strong) IBOutlet UITextView *txtIng;
@property (nonatomic, strong) IBOutlet UITextView *txtDir;
@property (nonatomic, strong) IBOutlet UITextView *txtLov;
@property (nonatomic, strong) IBOutlet UIButton *ad1;
@property (nonatomic, strong) IBOutlet UIButton *ad2;
@property (nonatomic, strong) IBOutlet UIButton *ad3;
@property (strong, nonatomic) IBOutlet UILabel *lblExport;

@property (nonatomic, strong) IBOutlet UIButton *adDrink;
@property (nonatomic, strong) NSMutableArray *listRec;

@property listSnack * lsnk;
@property int idIng1;
@property int idIng2;
@property int idIng3;
@property int adv;
@property NSString* urlActual;
@property NSString* mensaje;
@property NSString* imgText3;

@end
