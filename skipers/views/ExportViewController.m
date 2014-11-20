//
//  ExportViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/9/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "ExportViewController.h"
#import <MessageUI/MessageUI.h>
#import "Conexion.h"
#import "Export.h"
#import "Receta.h"

@interface ExportViewController ()

@end

@implementation ExportViewController
@synthesize conn;
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
    conn = [[Conexion alloc]init];
    [conn openDB];
    _listExport = [conn getExport];
    
    if(_language ==1){
        _txtInfo.text = @"Loncheras de la semana.";
        _txtBody = @"Loncheras de la semana";
        _btnErase.titleLabel.text = @"Borrar";
        [_btnErase setTitle:@"Borrar" forState:UIControlStateNormal];
        [_btnErase setTitle:@"Borrar" forState:UIControlStateSelected];
        
        _btnSend.titleLabel.text = @"Enviar";
        [_btnSend setTitle:@"Enviar" forState:UIControlStateNormal];
        [_btnSend setTitle:@"Enviar" forState:UIControlStateSelected];
        
    }else{
        _txtInfo.text = @"Snacks of the week";
        _txtBody = @"Snacks of the week";
        _btnErase.titleLabel.text = @"Reset";
        [_btnErase setTitle:@"Reset" forState:UIControlStateNormal];
        [_btnErase setTitle:@"Reset" forState:UIControlStateSelected];
        
        _btnSend.titleLabel.text = @"Send";
        [_btnSend setTitle:@"Send" forState:UIControlStateNormal];
        [_btnSend setTitle:@"Send" forState:UIControlStateSelected];
    }
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
    return [_listExport count];
}

- (IBAction)sendEmail:(id)sender {
    [self showEmail:@"logo.png"];
    
}

- (void)showEmail:(NSString*)file {
    
    NSString *emailTitle = _txtBody;
    NSString *messageBody = [NSString stringWithFormat:@"<html lang=\"es\"><HEAD><meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\"></HEAD><body>%@<br/><hr>", _txtBody];
    
    for (int i=0; i<[_listExport count]; i++) {
        Export *export = _listExport[i];
        NSMutableArray *test = [conn getRecipe:_language :[export getIdExport]];
        Receta *rec = test[0];
        if (_language ==1){
            messageBody = [messageBody stringByAppendingString:[NSString  stringWithFormat: @"<h3>Lonchera %d: %@</h3> <h3>Ingredientes</h3> <p>%@<p/> <h3>Preparación</h3> <p>%@<p/><hr/>",i+1, [rec getNombre], [rec getIngredientes], [rec getPreparacion]]];
        }else{
            messageBody = [messageBody stringByAppendingString:[NSString  stringWithFormat: @"<h3>Snack %d: %@</h3> <h3>Ingredients</h3> <p>%@<p/> <h3>Directions</h3> <p>%@<p/><hr/>",i+1, [rec getNombre], [rec getIngredientes], [rec getPreparacion]]];
        }
    }
    messageBody = [messageBody stringByAppendingString:@"</body></html><style>body{font-family: 'HelveticaNeue-Thin';font-size: 20px; text-align:left;}"];
    //NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
   // [mc setToRecipients:toRecipents];
    
    // Determine the file name and extension
    NSArray *filepart = [file componentsSeparatedByString:@"."];
    NSString *filename = [filepart objectAtIndex:0];
    NSString *extension = [filepart objectAtIndex:1];
    
    // Get the resource path and read the file using NSData
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:extension];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    // Determine the MIME type
    NSString *mimeType;
    if ([extension isEqualToString:@"jpg"]) {
        mimeType = @"image/jpeg";
    } else if ([extension isEqualToString:@"png"]) {
        mimeType = @"image/png";
    } else if ([extension isEqualToString:@"doc"]) {
        mimeType = @"application/msword";
    } else if ([extension isEqualToString:@"ppt"]) {
        mimeType = @"application/vnd.ms-powerpoint";
    } else if ([extension isEqualToString:@"html"]) {
        mimeType = @"text/html";
    } else if ([extension isEqualToString:@"pdf"]) {
        mimeType = @"application/pdf";
    }
    
    // Add attachment
    [mc addAttachmentData:fileData mimeType:mimeType fileName:filename];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}


- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)eraseExport:(id)sender {
    [conn execQuery:@"DELETE from Export;" ];
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Borrando" message:@"Borrando Lista" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    //[alert show];
    [[self navigationController] popViewControllerAnimated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"exportCell" forIndexPath:indexPath];
    int row = [indexPath row];
    Export *exp = _listExport[row];
    
    NSString * html;
    if(_language==1){
        html = [NSString stringWithFormat:@"<html lang=\"es\"><HEAD><meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\"></HEAD><body>%@",[exp getNomExport]];
    }else{
        html = [NSString stringWithFormat:@"<html lang=\"es\"><HEAD><meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\"></HEAD><body>%@",[exp getNamExport]];
    }
    html = [html stringByAppendingString:@"</body></html><style>body{font-family: 'HelveticaNeue-Thin';font-size: 20px; text-align:left;}"];
    
    NSError *err = nil;
    cell.textLabel.attributedText =
    [[NSAttributedString alloc]
     initWithData: [html dataUsingEncoding:NSUTF8StringEncoding]
     options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
     documentAttributes: nil
     error: &err];
    
    
    return cell;
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

/*
#pragma mark - Navigation

// In a storyboard-based applcation, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
