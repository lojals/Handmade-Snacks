//
//  InfoViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/16/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "InfoViewController.h"
#import "NavControllers/IdeasNavController.h"
#import "ExportViewController.h"
#import "AdTableViewController.h"
#import "WebViewController.h"


@interface InfoViewController ()

@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _lang = ((IdeasNavController*)self.parentViewController).language;
    if (self) {
        // Custom initialization
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
        if (_lang==1) {
            NSLog(@"Español");
            _btnWeek.titleLabel.text = @"Organiza tu semana";
            [_btnWeek setTitle:@"Organiza tu semana" forState:UIControlStateNormal];
            [_btnWeek setTitle:@"Organiza tu semana" forState:UIControlStateSelected];
            
            _btnHot.titleLabel.text = @"Deleitese";
            [_btnHot setTitle:@"Deleitese" forState:UIControlStateNormal];
            [_btnHot setTitle:@"Deleitese" forState:UIControlStateSelected];
            
            
            _btnBuy.titleLabel.text = @"Amigos!";
            [_btnBuy setTitle:@"Amigos!" forState:UIControlStateNormal];
            [_btnBuy setTitle:@"Amigos!" forState:UIControlStateSelected];
            
            
        }else{
            NSLog(@"Ingles");
            _btnWeek.titleLabel.text = @"Weekly planner";
            [_btnWeek setTitle:@"Weekly planner" forState:UIControlStateNormal];
            [_btnWeek setTitle:@"Weekly planner" forState:UIControlStateSelected];
            
            _btnHot.titleLabel.text = @"What's tasty";
            [_btnHot setTitle:@"What's tasty" forState:UIControlStateNormal];
            [_btnHot setTitle:@"What's tasty" forState:UIControlStateSelected];
            
            _btnBuy.titleLabel.text = @"Friends!";
            [_btnBuy setTitle:@"Friends!" forState:UIControlStateNormal];
            [_btnBuy setTitle:@"Friends!" forState:UIControlStateSelected];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated{
    
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        self.tabBarController.tabBar.tintColor  = [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
    } else {
        self.tabBarController.tabBar.tintColor  = [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.000 green:0.698 blue:0.400 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]}];
    }

    
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goExport"]) {
        ExportViewController *detail = [segue destinationViewController];
        detail.language = _lang;
    }else{
        if([[segue identifier] isEqualToString:@"goWeb"]) {
            WebViewController *detail = [segue destinationViewController];
            NSLog(@"Idioma seleccionado %d",_lang);
            
            detail.url = [NSString stringWithFormat:@"http://jomobile.co/skipers/tasty_%d.html",_lang ];
        }else{
            AdTableViewController *detail = [segue destinationViewController];
            NSLog(@"Idioma seleccionado %d",_lang);
            detail.language = _lang;
        }
    }
}


@end
