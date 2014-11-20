//
//  RecipesTableViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/24/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "RecipesTableViewController.h"
#import "RecipesTableViewCell.h"
#import "RecipeViewController.h"
#import "Conexion.h"
#import "listSnack.h"
#import "AdDetailTableViewController.h"
#import "RecipeDetailTableViewController.h"

@interface RecipesTableViewController ()

@end

@implementation RecipesTableViewController

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
    Conexion *conn = [[Conexion alloc] init];
    [conn openDB];
    counter = 0;
    _listSnacks = [conn getSnackList:_idIngrediente];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [_listSnacks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipesCell" forIndexPath:indexPath];
    int row = (int)[indexPath row];

    listSnack *snack = _listSnacks[row];
        if([snack getIdIng1] == 76){
            _imgText3 = [NSString stringWithFormat:@"bread%d.jpg",arc4random()%10];
            [snack setIng1:_imgText3];
            counter ++;
            [cell.ing1 setImage:[UIImage imageNamed: _imgText3]];
        }
        else{
            [cell.ing1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[snack getIng1]]]];
        }
        if([snack getIdRecipe] != 72)
            [cell.ing2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[snack getIng2]]]];
        else{
            [snack setIng1:@"salpicon   "];
            [cell.ing2 setImage:[UIImage imageNamed:@"salpicon.jpg.jpg"]];
        }
        [cell.ing3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[snack getIng3]]]];
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor colorWithRed:0.318 green:0.318 blue:0.318 alpha:0.05];
        bgColorView.layer.masksToBounds = YES;
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosure_red.png"]];
        [cell setSelectedBackgroundView:bgColorView];
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
    if ([[segue identifier] isEqualToString:@"goRecipeDetail"]) {
        RecipeViewController *detail = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = (int)[myIndexPath row];
        listSnack *pub = _listSnacks[row];
        detail.lsnk = pub;
        detail.imgText3 = _imgText3;
    }else{
        RecipeDetailTableViewController *detail = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = (int)[myIndexPath row];
        listSnack *pub = _listSnacks[row];
        detail.lsnk = pub;
        detail.imgText3 = _imgText3;
    }
    
    
}


@end
