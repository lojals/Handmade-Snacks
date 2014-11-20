//
//  InfoViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/16/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InfoViewController : UIViewController <UITabBarDelegate>
@property int lang;
@property (strong, nonatomic) IBOutlet UIButton *btnWeek;
@property (strong, nonatomic) IBOutlet UIButton *btnHot;
@property (strong, nonatomic) IBOutlet UIButton *btnBuy;



@end
