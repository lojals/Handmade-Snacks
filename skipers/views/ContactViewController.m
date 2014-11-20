//
//  ContactViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/19/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "ContactViewController.h"
#import "WebViewController.h"
#import "NavControllers/IdeasNavController.h"
@interface ContactViewController ()

@end

@implementation ContactViewController
@synthesize language;
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
    language = ((IdeasNavController*)self.parentViewController).language;
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
    }else{
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]}];
    
    }
    if (language==1) {
        [self.navigationItem setTitle:@"Escribanos"];
        _txtContacto.text = @"Nos encantaría saber de Usted... Loncheras, recetas, tips, y cualquier comentario es bienvenido... Por favor escríbanos.";
        _txtContacto2.text = @"Ó puede seguirnos en";
    }else{
        [self.navigationItem setTitle:@"Write Us"];
        _txtContacto.text = @"We would love to hear from you... Snacks, recipes, ideas, tips, any feedback is welcome... Please write Us.";
        _txtContacto2.text = @"Or follow Us on";
    }
    if (![[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"])
    {
        _txtContacto.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:19];
        _txtContacto.textAlignment = NSTextAlignmentCenter;
        _txtContacto.textColor = [UIColor darkGrayColor];
        _txtContacto.editable = NO;
        _txtContacto.dataDetectorTypes = UIDataDetectorTypeAll;
        _txtContacto.tintColor = [UIColor colorWithRed:0.400 green:0.157 blue:0.055 alpha:1];
    }
}
- (IBAction)goContact:(id)sender {
    //#define URLEMail @"mailto:sb@sw.com?subject=title&body=content"
    #define URLEMail @"mailto:skipers@outlook.com"
    NSString *url = [URLEMail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: url]];
}

- (void)viewDidAppear:(BOOL)animated{
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]}];
    }else{
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.157 green:0.671 blue:0.075 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]}];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)goInstagram:(id)sender {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://user?username=handmadesnacks"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goFacebook"]) {
        WebViewController *detail = [segue destinationViewController];
        detail.url = @"https://www.facebook.com/pages/Skipers/1425595487685332?fref=ts";
    }else{
        if([[segue identifier] isEqualToString:@"goPin"]) {
            WebViewController *detail = [segue destinationViewController];
            detail.url = @"http://www.pinterest.com/handmadesnacks/";
        }
    }
}


@end
