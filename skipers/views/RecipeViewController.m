//
//  RecipeViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/25/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "RecipeViewController.h"
#import "TabBarController.h"
#import <QuartzCore/QuartzCore.h>
#import "Conexion.h"
#import "Receta.h"
#import "NavControllers/IdeasNavController.h"
#import "WebViewController.h"
#import "AdDetailTableViewController.h"
#import <MessageUI/MessageUI.h>

@interface RecipeViewController ()

@end

@implementation RecipeViewController
@synthesize language;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)addSchedule:(id)sender {
    Conexion *conn = [[Conexion alloc]init];
    [conn openDB];
   
    NSString * query = [NSString stringWithFormat:@"INSERT INTO Export (idReceta,nomReceta,namReceta) VALUES (%d,(SELECT nom_receta from RECETA where id_receta = %d),(SELECT nam_receta from RECETA where id_receta = %d));", [_lsnk getIdRecipe],[_lsnk getIdRecipe],[_lsnk getIdRecipe]];
    [conn execQuery: query];    
    UIAlertView *alert;
    if(language ==1)
        alert = [[UIAlertView alloc] initWithTitle:@"Chevere!" message:@"Agregada a la semana..." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    else
        alert = [[UIAlertView alloc] initWithTitle:@"Cool!" message:@"Added to the week..." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    language = ((IdeasNavController*)self.parentViewController).language;
    [_ing1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[_lsnk getIng1]]]];
    [_ing2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[_lsnk getIng2]]]];
    [_ing3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[_lsnk getIng3]]]];
    Conexion *conn = [[Conexion alloc]init];
    [conn openDB];
    _listRec = [conn getRecipe:language :[_lsnk getIdRecipe]];
    
    _idIng1 = [_lsnk getIdIng1];
    _idIng2 = [_lsnk getIdIng2];
    _idIng3 = [_lsnk getIdIng3];
    
    NSString *n = [[[NSAttributedString alloc] initWithData:[[[_listRec objectAtIndex:0] getNombre] dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil] string];
    [self.navigationItem setTitle: n];
     
    _txtIng.text = [[_listRec objectAtIndex:0] getIngredientes];
    _txtDir.text = [[_listRec objectAtIndex:0] getPreparacion];
    _txtLov.text = [[_listRec objectAtIndex:0] getAmor];
    // Arrays que checkean la publicidad
    NSMutableArray *ingList1 = [[NSMutableArray alloc] init];
    NSMutableArray *ingList2 = [[NSMutableArray alloc] init];
    NSMutableArray *ingList3 = [[NSMutableArray alloc] init];
    
    
    
    ingList1 = [conn getAdvertisementByIngrediente:_idIng1];
    ingList2 = [conn getAdvertisementByIngrediente:_idIng2];
    ingList3 = [conn getAdvertisementByIngrediente:_idIng3];
    if([ingList1 count]==0){
        [_ad1 setEnabled:FALSE];
        _ad1.alpha = 0.0;
    }
    
    if([ingList2 count]==0){
        [_ad2 setEnabled:FALSE];
         _ad2.alpha = 0.0;
    }
    
    if([ingList3 count]==0){
        [_ad3 setEnabled:FALSE];
         _ad3.alpha = 0.0;
    }
    
    
    NSString *html;
    if (language == 1) {
        html = [NSString stringWithFormat:@"<html lang=\"es\"><HEAD><meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\"></HEAD><body>Ingredientes<br/><br/>%@<br/><hr/>Preparación<br/><br/>%@</font> <br/><br/><font color=\"#FF0000\">Loncheras con Amor ♥</font><br/><br/>%@</font>",[[_listRec objectAtIndex:0] getIngredientes],[[_listRec objectAtIndex:0] getPreparacion], [[_listRec objectAtIndex:0] getAmor]];
        _mensaje = @"Handmade Snacks - Loncheras con amor";
        _lblExport.text = @"Agreguelo a su semana!";
    }else{
        html = [NSString stringWithFormat:@"<html lang=\"es\"><HEAD><meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\"></HEAD><body>Ingredients<br/><br/>%@<br/><hr/>Directions<br/><br/>%@</font><br/><br/><font color=\"#FF0000\">Snacks packed with love ♥</font><br/><br/>%@</font>",[[_listRec objectAtIndex:0] getIngredientes],[[_listRec objectAtIndex:0] getPreparacion],[[_listRec objectAtIndex:0] getAmor] ];
        _mensaje = @"Handmade Snacks - Snacks packed with love";
        _lblExport.text = @"Add for the week!";
    }
    html = [html stringByAppendingString:@"</body></html><style>body{font-family: 'HelveticaNeue-Thin';font-size: 20px; text-align:left;}H1{font-family: 'HelveticaNeue-Thin';font-size: 25px; text-align:left;}H2{font-family: 'HelveticaNeue-Thin';font-size: 23px; text-align:left; color: #FF0000;}</style>"];
    
    _image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[_listRec objectAtIndex:0] getImg]]];
    
    NSError *err = nil;
    _txtIng.attributedText =
    [[NSAttributedString alloc]
     initWithData: [html dataUsingEncoding:NSUTF8StringEncoding]
     options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
     documentAttributes: nil
     error: &err];
    
    CGRect frame;
    frame = _txtIng.frame;
    NSLog(@"%f", [self textViewHeightForAttributedText:_txtIng.attributedText andWidth:frame.size.width]);
    frame.size.height = [self textViewHeightForAttributedText:_txtIng.attributedText andWidth:frame.size.width];
    _txtIng.frame = frame;
    
     self.navigationController.navigationBar.backItem.title = @" ";
    //[_txtIng contentSize].height =frame.size.height ;
   // _txtIng.heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0f constant:size.height];
    //[_txtIng sizeToFit];
    //[_txtIng setScrollEnabled:NO];
    
    
    int randDrink = arc4random()%10;
    if (randDrink < 5) {
        _urlActual = @"http://www.aguadelnacimiento.com";
        if(language == 1){
            [_adDrink setBackgroundImage:[UIImage imageNamed:@"tomeAgua.png"] forState:UIControlStateNormal];
            [_adDrink setImage: [UIImage imageNamed:@"tomeAgua.png"] forState:UIControlStateNormal];
        }
        else{
            [_adDrink setBackgroundImage:[UIImage imageNamed:@"drinkwater.png"] forState:UIControlStateNormal];
            [_adDrink setImage: [UIImage imageNamed:@"drinkwater.png"] forState:UIControlStateNormal];
        }
    }else{
        _urlActual = @"http://purojugo.com";
        if(language == 1){
            [_adDrink setBackgroundImage:[UIImage imageNamed:@"tomeJugo.png"] forState:UIControlStateNormal];
            [_adDrink setImage: [UIImage imageNamed:@"tomeJugo.png"] forState:UIControlStateNormal];
        }
        else{
            [_adDrink setBackgroundImage:[UIImage imageNamed:@"drinkjuice.png"] forState:UIControlStateNormal];
            [_adDrink setImage: [UIImage imageNamed:@"drinkjuice.png"] forState:UIControlStateNormal];
        }
    }
    
}
- (void)viewDidAppear:(BOOL)animated{
    if (![(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"] ) {
        self.navigationController.navigationBar.backItem.title = @" ";
    }
}


- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}

- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

- (IBAction)postFacebook:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil)
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:_mensaje]; //the message you want to post
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://bit.ly/handmadesnacks"]];
        //[mySLComposerSheet addImage:imgInformation.image];
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        }];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    
}
- (IBAction)postTwitter:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil)
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [mySLComposerSheet setInitialText:_mensaje]; //the message you want to post
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://bit.ly/handmadesnacks"]];
        //[mySLComposerSheet addImage:imgInformation.image];
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        }];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goWeb"]) {
        WebViewController *detail = [segue destinationViewController];
        detail.url = _urlActual;
    }else{
        AdDetailTableViewController *adPage = [segue destinationViewController];
        if([[segue identifier] isEqualToString:@"goPub1"]){
            adPage.idIngrediente = _idIng1;
        }
        
        if([[segue identifier] isEqualToString:@"goPub2"]){
            adPage.idIngrediente = _idIng2;
        }
        
        if([[segue identifier] isEqualToString:@"goPub3"]){
            adPage.idIngrediente = _idIng3;
        }
    }
}
@end
