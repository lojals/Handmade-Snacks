//
//  SnacksViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/30/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "SnacksViewController.h"
#import "Ingrediente.h"
#import "../classes/Conexion.h"
#import "RecipesTableViewController.h"
#import "IdeasNavController.h"

@interface SnacksViewController ()

@end

@implementation SnacksViewController
@synthesize locked,language;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    language = ((IdeasNavController*) self.parentViewController).language;
    Conexion *conn = [[Conexion alloc] init];
    [conn openDB];
    VeggieArray = [NSMutableArray new];
    VeggieArray = [conn getVeggies:language];
    locked = false;
    
    
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        NSLog(@"iPad");
        _size = 28;
        _sizeImg = 200;
        _sizeSlot = 260;
    } else {
        NSLog(@"iPhone or iPod Touch");
        _size = 13;
        _sizeImg = 120;
        _sizeSlot = 160;
    }
    
    if (language == 1) {
        _lblInstruct1.text = @"1. Desliza las frutas/vegetales.";
        _lblInstruct2.text = @"2. Escoge una.";
        _lblInstruct3.text = @"3. Bloqueala.";
        _lblInstruct4.text = @"4.Juggle.";
        
    }else{
        _lblInstruct1.text = @"1. Scroll fruits/veggies.";
        _lblInstruct2.text = @"2. Choose one.";
        _lblInstruct3.text = @"3. Lock it.";
        _lblInstruct4.text = @"4.Juggle.";
    }

    _lblIngredient.text = [[VeggieArray objectAtIndex:0] getNomIngrediente];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
}

- (void)viewDidAppear:(BOOL)animated{
    if (  [(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"] ) {
        self.tabBarController.tabBar.tintColor  = [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
    } else {
        self.tabBarController.tabBar.tintColor  = [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.996 green:0.086 blue:0.086 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:12.0]}];
        self.navigationController.navigationBar.backItem.title = @"";
        [self.navigationItem setTitle:@"Snacks"];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RecipesTableViewController *detail = [segue destinationViewController];
    
    if(locked){
        detail.idIngrediente = [[VeggieArray objectAtIndex:[_veggiePicker selectedRowInComponent:0]] getIdIngrediente];
    }else{
        [_veggiePicker selectRow:arc4random()%[VeggieArray count] inComponent:0 animated:NO];
         _lblIngredient.text = [[VeggieArray objectAtIndex:[_veggiePicker selectedRowInComponent:0]] getNomIngrediente];
        detail.idIngrediente = [[VeggieArray objectAtIndex:[_veggiePicker selectedRowInComponent:0]] getIdIngrediente];
    }
}

- (IBAction)lockIngredient:(id)sender {
    if(!locked){
        [_btnLock setBackgroundImage:[UIImage imageNamed:@"lock.png"] forState:UIControlStateNormal];
        locked = true;
        _veggiePicker.alpha = 0.6;
    }else{
        [_btnLock setBackgroundImage:[UIImage imageNamed:@"unlock.png"] forState:UIControlStateNormal];
        locked = false;
         _veggiePicker.alpha = 1.0;
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [VeggieArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [VeggieArray objectAtIndex:row];
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //UIView *viewd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    UIImageView *slotImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, _sizeImg, _sizeImg)];
    [slotImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[VeggieArray objectAtIndex:row] getImgIngrediente]]]];
    //[viewd addSubview:slotImage];
    // UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 250, 60)];
    //label.textColor = [UIColor blackColor];
    //label.font = [UIFont fontWithName:@"HelveticaNeue-thin" size:25];
    //label.text = [[VeggieArray objectAtIndex:row] getNomIngrediente];
    //label.textAlignment = NSTextAlignmentCenter;
    //label.lineBreakMode = UILineBreakModeWordWrap;
    //label.numberOfLines = 2;
    //[viewd addSubview:label];
    //return viewd;
    return slotImage;
}

-(void)action{
    [_veggiePicker selectRow:arc4random()%94+3 inComponent:0 animated:YES];
    //if([DataArray objectAtIndex:[_veggiePicker selectedRowInComponent:0]])
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return  _sizeSlot;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _lblIngredient.text = [[VeggieArray objectAtIndex:row] getNomIngrediente];
}

@end
