//
//  ExportViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/9/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conexion.h"

@interface ExportViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *listExport;
@property (strong, nonatomic) IBOutlet UILabel *txtInfo;
@property (strong, nonatomic) IBOutlet UIButton *btnSend;
@property (strong, nonatomic) IBOutlet UIButton *btnErase;


@property (nonatomic, strong) Conexion * conn;
@property (nonatomic, strong) IBOutlet UITableView * tabla;
@property int language;


@property (nonatomic, strong) NSString* emailAsunto;
@property (nonatomic, strong) NSString* txtBody;

@end
