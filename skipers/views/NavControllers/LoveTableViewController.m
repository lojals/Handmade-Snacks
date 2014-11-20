//
//  LoveTableViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/2/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "LoveTableViewController.h"
#import "Conexion.h"
#import "Love.h"
#import "LoveTableViewCell.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad
@interface LoveTableViewController ()

@end

@implementation LoveTableViewController

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
    if(_language == 1){
        _loveList = [conn getAllLove:1];
    }else{
        _loveList = [conn getAllLove:2];
    }
    
    NSString *deviceModel = (NSString*)[UIDevice currentDevice].model;
    if ([[deviceModel substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"iPad"]) {
        NSLog(@"iPad");
        _size = 20;
    } else {
        NSLog(@"iPhone or iPod Touch");
        _size = 13;
    }
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
    return [_loveList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = (int)[indexPath row];
    Love *lov = _loveList[row];
    LoveTableViewCell *cell;
    if ([lov haveImg]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellLove2" forIndexPath:indexPath];
        cell.loveImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[lov getImgLove]]];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellLove1" forIndexPath:indexPath];
    }
    NSString *html = [NSString stringWithFormat:@"<html lang=\"es\"><HEAD><meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\">                   </HEAD><body>%@",[lov getContLove]];
    NSError *err = nil;
    cell.loveCounter.text = [NSString stringWithFormat:@"%d ♥.",row+1];
    
    html = [html stringByAppendingString:[NSString stringWithFormat:@"</body></html><style>body{font-family: 'HelveticaNeue-Thin';font-size:%dpx;}</style>",_size ]];
    cell.loveContent.attributedText =
    [[NSAttributedString alloc]
     initWithData: [html dataUsingEncoding:NSUTF8StringEncoding]
     options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0] }
     documentAttributes: nil
     error: &err];
    
    
    
//    cell.loveContent.text = [lov getContLove];
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = (int)[indexPath row];
    Love *lov = _loveList[row];
    if ([lov haveImg]) {
        if (  [(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"] ) {
            return 300;
        } else {
            return 200;
        }
    }else{
        if (  [(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"]) {
            return 110;
        } else {
            return 90;
        }
    }
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
