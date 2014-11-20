//
//  CoolInfoTableViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/23/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "CoolInfoTableViewController.h"
#import "Interesting.h"
#import "Conexion.h"
#import "InterestingTableViewCell.h"
#import "WebViewController.h"

@interface CoolInfoTableViewController ()

@end

@implementation CoolInfoTableViewController
@synthesize interestingList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    interestingList = [[NSMutableArray alloc] init];
    Conexion *cone = [[Conexion alloc] init];
    NSLog(@"%d",_language);
    [cone openDB];
    interestingList = [cone getCoolInformation:_language];
    
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        if(_language == 1){
            [self.navigationItem setTitle:@"Información Chevere"];
        }else{
            [self.navigationItem setTitle:@"Cool Information"];
        }
    }
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.839 green:0.529 blue:0.988 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:21.0]}];
    self.navigationController.navigationBar.translucent = NO;
}
- (void) popVC{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [interestingList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InterestingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interestingCell" forIndexPath:indexPath];
    int row = (int)[indexPath row];
    Interesting *inte = interestingList[row];
    cell.backgroundColor = [UIColor colorWithRed:1.f  green:1.f blue:1.f alpha:0.02f];
    cell.title.text = [inte getNamInteresting];
    cell.url.text = [inte getContentInteresting];
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosure_red.png"]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goCool"]) {
        WebViewController *detail = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = (int)[myIndexPath row];
        Interesting *inte = interestingList[row];
        NSLog(@"%@", inte.getContentInteresting);
        detail.url = inte.getContentInteresting;
    }
}


@end
