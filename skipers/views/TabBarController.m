//
//  TabBarController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/17/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "TabBarController.h"


@interface TabBarController ()

@end

@implementation TabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad

{
    

    [super viewDidLoad];
    
    self.tabBar.translucent = YES;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@" dsfsf");
}


@end
