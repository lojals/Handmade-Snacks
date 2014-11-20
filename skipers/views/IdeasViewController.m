//
//  IdeasViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/17/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "IdeasViewController.h"
#import "NavControllers/IdeasNavController.h"
#import "CoolInfoTableViewController.h"
#import "LoveTableViewController.h"
#import "ViewController.h"


@interface IdeasViewController ()

@end

@implementation IdeasViewController
//@synthesize coolbtn,presbtn,lovebtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        NSLog(@"Entra a Ideas 2");
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lang = ((IdeasNavController*)self.parentViewController).language;
    NSLog(@"Entra a Ideas");
    if (self) {
        // Custom initialization
        if (_lang==1) {
            NSLog(@"Español");
            _coolbtn.titleLabel.text = @"Información chevere";
            [_coolbtn setTitle:@"Información chevere" forState:UIControlStateNormal];
            [_coolbtn setTitle:@"Información chevere" forState:UIControlStateSelected];
            
            _presbtn.titleLabel.text = @"Recetas";
            [_presbtn setTitle:@"Recetas" forState:UIControlStateNormal];
            [_presbtn setTitle:@"Recetas" forState:UIControlStateSelected];
            
            
            _lovebtn.titleLabel.text = @"Loncheras con amor";
            [_lovebtn setTitle:@"Loncheras con amor" forState:UIControlStateNormal];
            [_lovebtn setTitle:@"Loncheras con amor" forState:UIControlStateSelected];
            
            
        }else{
            NSLog(@"Ingles");
            _coolbtn.titleLabel.text = @"Cool Information";
            [_coolbtn setTitle:@"Cool Information" forState:UIControlStateNormal];
            [_coolbtn setTitle:@"Cool Information" forState:UIControlStateSelected];
            
            _presbtn.titleLabel.text = @"Recipes";
            [_presbtn setTitle:@"Recipes" forState:UIControlStateNormal];
            [_presbtn setTitle:@"Recipes" forState:UIControlStateSelected];
            
            _lovebtn.titleLabel.text = @"Snacks packed with love";
            [_lovebtn setTitle:@"Snacks packed with love" forState:UIControlStateNormal];
            [_lovebtn setTitle:@"Snacks packed with love" forState:UIControlStateSelected];
        }
    }
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.424 green:0.145 blue:0.408 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
    self.navigationController.navigationBar.translucent = NO;
    /*self.tabBar.selectedImageTintColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor whiteColor];*/

    //self.tabBarController.tabBar.backgroundImage =  [UIImage imageNamed:@"foot.png"];
    //self.tabBarController.tabBar.backgroundColor = [UIColor colorWithRed:0.424 green:0.145 blue:0.408 alpha:1];
    
    // Do any additional setup after loading the view.
    // Custom initialization
    /*[[UITabBar appearance] setTintColor:[UIColor whiteColor]];
     
     [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
     
     
     [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.984 green:0.278 blue:0.259 alpha:1]];
     
     
     self.tabBar.selectedImageTintColor = [UIColor whiteColor];
     self.tabBar.backgroundColor = [UIColor whiteColor];
     self.tabBar.tintColor = [UIColor whiteColor];
     self.tabBarController.tabBar.tintColor  = [UIColor whiteColor];
     self.tabBarController.tabBar.backgroundImage =  [UIImage imageNamed:@"foot.png"];
     
     NSLog(@"%d",_language);
     [self.tabBarController setSelectedIndex:1];
     
     
     // [[self tabBar] setBarTintColor:[UIColor clearColor]];
     
     //[[UITabBar appearance] setBarTintColor:[[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]];
     
     self.tabBarController.tabBar.translucent = TRUE;
     [self.tabBarController.tabBar setTranslucent:YES];
     
     //[[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.984 green:0.278 blue:0.259 alpha:0.2]];
     //        self.tabBarController.tabBar.translucent = YES;
     
     //    self.tabBarController.tabBar.barStyle = UIBarStyleBlackTranslucent;
     self.tabBar.alpha = 0.99;
     
     //UITabBarController *tabController = (UITabBarController *)self.rootViewController;
     */
    /* UIImage *selectedImage = [UIImage imageNamed:@"HomeActive"];
     UIImage *unselectedImage = [UIImage imageNamed:@"HomeInactive"];
     [[self.tabBar.items objectAtIndex:0] setTintColor:[UIColor whiteColor]];
     [[self.tabBar.items objectAtIndex:0] setTitle:@"Mutta"];*/
}
- (void)viewDidAppear:(BOOL)animated{
    
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        self.tabBarController.tabBar.tintColor  = [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
        self.navigationController.navigationBar.translucent = NO;
    } else {
        self.tabBarController.tabBar.tintColor  = [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]}];
        self.navigationController.navigationBar.translucent = NO;
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goCool"]) {
        LoveTableViewController *detail = [segue destinationViewController];
        NSLog(@"Idioma seleccionado %d",_lang);
        detail.language = _lang;
    }else{
        if([[segue identifier] isEqualToString:@"goLove"]) {
            CoolInfoTableViewController *detail = [segue destinationViewController];
            NSLog(@"Idioma seleccionado %d",_lang);
            detail.language = _lang;
        }else{
            ViewController *detail = [segue destinationViewController];
            NSLog(@"Idioma seleccionado %d",_lang);
            detail.language = _lang;
        }
    }
    
}


@end
