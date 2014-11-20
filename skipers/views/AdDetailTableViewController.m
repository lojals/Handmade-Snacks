//
//  AdDetailTableViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "AdDetailTableViewController.h"
#import "PublicidadViewCell.h"
#import "WebViewController.h"
#import "Conexion.h"
#import "Publicidad.h"

@interface AdDetailTableViewController ()

@end

@implementation AdDetailTableViewController
@synthesize adList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    adList = [[NSMutableArray alloc] init];
    Conexion *cone = [[Conexion alloc] init];
    [cone openDB];
    adList = [cone getAdvertisementByIngrediente:_idIngrediente];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [adList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublicidadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pubCell" forIndexPath:indexPath];
    int row = (int)[indexPath row];
    Publicidad *pub = adList[row];
    cell.tel.text = [pub getTelPublicidad];
    cell.backgroundColor = [UIColor colorWithRed:1.f  green:1.f blue:1.f alpha:0.02f];
    NSString *imageName = [NSString stringWithFormat:@"%@.%@", pub.getImgPublicidad, @"png"];
    [cell.image setImage:[UIImage imageNamed:imageName]];
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:0.318 green:0.318 blue:0.318 alpha:0.05];
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];
    return cell;
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goWeb"]) {
        WebViewController *detail = [segue destinationViewController];
        NSIndexPath *myIndexPath2 = [self.tableView indexPathForSelectedRow];
        int row = (int)[myIndexPath2 row];
        Publicidad *pub = adList[row];
        detail.url = pub.getWebPublicidad;
    }
}


@end
