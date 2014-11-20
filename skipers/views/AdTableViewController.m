//
//  AdTableViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "AdTableViewController.h"
#import "Ingrediente.h"
#import "Conexion.h"
#import "AdDetailTableViewController.h"

@interface AdTableViewController ()

@end

@implementation AdTableViewController
@synthesize foodList;


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
    
    /*UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-13-01.png"]];
    [tempImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = tempImageView;*/
    
    
    
    foodList = [[NSMutableArray alloc] init];
    Conexion *cone = [[Conexion alloc] init];
    [cone openDB];
    foodList = [cone getIngredientsWithAds:_language];
    
    
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [foodList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodCell" forIndexPath:indexPath];
    int row = (int)[indexPath row];
    
    Ingrediente *ing = foodList[row];
    cell.textLabel.text = [ing getNomIngrediente];
    cell.backgroundColor = [UIColor colorWithRed:1.f  green:1.f blue:1.f alpha:0.02f];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:0.318 green:0.318 blue:0.318 alpha:0.05];
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosure_green.png"]];
    
    /*cell.texto.text = titleText.getPresent;
    cell.descr.text =  [[NSString alloc]initWithFormat:@"%@ - %@",titleText.getPast,titleText.getPart] ;
    cell.backgroundColor = [UIColor colorWithRed:1.f  green:0.2f+(titleText.getIdverb * 0.0012f) blue:0.3f alpha:1.f];
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor blackColor];
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];
    return cell;*/
    
    // Configure the cell...
    
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"detailAd"]) {
        AdDetailTableViewController *detail = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = (int)[myIndexPath row];
        Ingrediente *ing2 = foodList[row];
        detail.idIngrediente = ing2.getIdIngrediente;
        /*Verb *titleText = [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:myIndexPath.section]] objectAtIndex:myIndexPath.row];
        detail.DetailMaster = @[titleText.getPresent,titleText.getPast,titleText.getPart,titleText.getGeru,[[NSString alloc]initWithFormat:@"%d",titleText.getIdverb]];
        detail.verbo = titleText;*/
    }

}


@end
