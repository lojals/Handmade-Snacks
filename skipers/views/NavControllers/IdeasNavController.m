//
//  IdeasNavController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/18/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "IdeasNavController.h"
#import "../TabBarController.h"

@interface IdeasNavController ()

@end

@implementation IdeasNavController
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
    // Do any additional setup after loading the view.
    /*NSLog(@"Muttaffukka");
    NSLog(@"%d",((TabBarController*)self.parentViewController).language);*/
    language = ((TabBarController*)self.parentViewController).language;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
