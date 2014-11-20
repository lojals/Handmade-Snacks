//
//  Conexion.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface Conexion : NSObject{
    sqlite3 *db;
}

@property (nonatomic, retain) NSMutableArray *returnList;

-(NSString *) filePath;
-(void) openDB;

-(NSMutableArray*) getIngredientsWithAds:(int)language;
-(NSMutableArray*)getAdvertisementByIngrediente:(int)idIngrediente;
-(NSMutableArray*)getCoolInformation:(int)language;
-(NSMutableArray*)getIngredients:(NSString*)order;
-(NSMutableArray*)getVeggies:(int)language;
-(NSMutableArray*)getSnackList:(int)ingredient;
-(NSMutableArray*)getAllLove:(int)language;
-(NSMutableArray*)getRecipe:(int)language :(int)idReceta;
-(NSMutableArray*)getBasicas:(int)language;

-(NSMutableArray*)getExport;

- (void) execQuery:(NSString *)query;
@end
