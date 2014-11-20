//
//  _66ViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/12/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "_66ViewController.h"
#import "IdeasViewController.h"
#import "TabBarController.h"

@interface _66ViewController ()

@end

@implementation _66ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    @try {
        [self copyDataBase];
    }
    @catch (NSException *exception) {
        NSLog(@"Ya existia");
    }
    @finally {
       
    }
}


-(void) copyDataBase{
    NSString *path1 =[[NSBundle bundleForClass:[self class]] pathForResource:@"loncheras" ofType:@"sqlite"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *writableDBPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"loncheras.sqlite"];
    NSError *err;
    
    
    NSLog(@"Copiando");
    [[NSFileManager defaultManager] removeItemAtPath:writableDBPath error:&err];
    [[NSFileManager defaultManager] copyItemAtPath:path1 toPath:writableDBPath error:&err];
    if (err != nil) {
        NSLog(@"Err desc-%@", [err localizedDescription]);
        NSLog(@"Err reason-%@", [err localizedFailureReason]);
	}
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
            TabBarController *tbctrl = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"goSpanish"]) {
        tbctrl.language = 1;
    }else{
        tbctrl.language = 2;
    }
}



@end
