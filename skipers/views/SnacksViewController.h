//
//  SnacksViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/30/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnacksViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    NSMutableArray *VeggieArray;
    bool locked;
}
@property int language;
@property int size;
@property int sizeImg;
@property int sizeSlot;
@property (strong,nonatomic) IBOutlet UIButton *btnLock;
@property (strong,nonatomic) IBOutlet UILabel *lblIngredient;
@property (strong,nonatomic) IBOutlet UIPickerView *veggiePicker;

@property bool locked;
-(void)action;


@property (strong, nonatomic) IBOutlet UILabel *lblInstruct1;
@property (strong, nonatomic) IBOutlet UILabel *lblInstruct2;
@property (strong, nonatomic) IBOutlet UILabel *lblInstruct3;
@property (strong, nonatomic) IBOutlet UILabel *lblInstruct4;

@end
