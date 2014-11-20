//
//  ContactViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/19/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController

@property (strong,nonatomic) IBOutlet UITextView *txtContacto;
@property (strong,nonatomic) IBOutlet UILabel *txtContacto2;
@property int language;

@end
