//
//  Conexion.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Conexion.h"
#import "Ingrediente.h"
#import "Publicidad.h"
#import "Interesting.h"
#import "listSnack.h"
#import "Love.h"
#import "Receta.h"
#import "Export.h"

@implementation Conexion
@synthesize returnList;

-(id)init{
    self = [super init];
    if (self) {
        returnList = [[NSMutableArray alloc] init];
    }
    return self;
}
-(NSString *) filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"loncheras.sqlite"];
    return writableDBPath;
}
//open the db
-(void)openDB {
    if(sqlite3_open([[self filePath] UTF8String], &db)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open");
    }else{
        //NSLog(@"database opened");
    }
}
// Method to return an NSMutableArray with Ingredients with Advertisents
-(NSMutableArray*) getIngredientsWithAds:(int)language{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql;
    
    if(language == 1)
        sql = [NSString stringWithFormat:@"SELECT i.id_ingrediente, i.nom_ingrediente, i.nam_ingrediente, i.img_ingrediente, i.tipo_ingrediente FROM Ingrediente i, ing_pub_pnt p WHERE i.id_ingrediente = p.id_ingrediente GROUP BY i.id_ingrediente ORDER BY i.nom_ingrediente;"];
    else
        sql = [NSString stringWithFormat:@"SELECT i.id_ingrediente, i.nam_ingrediente, i.nom_ingrediente, i.img_ingrediente, i.tipo_ingrediente FROM Ingrediente i, ing_pub_pnt p WHERE i.id_ingrediente = p.id_ingrediente GROUP BY i.id_ingrediente ORDER BY i.nam_ingrediente;"];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Ingrediente *ingObj = [[Ingrediente alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [ingObj setIdIngrediente: field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [ingObj setNomIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
          //  [ingObj setNamIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 3);
            [ingObj setImgIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 4);
            field1str = [[NSString alloc]initWithUTF8String:field1];
            [ingObj setTipoIngrediente: field1str.intValue];
            [returnList addObject:ingObj];
        }
        return returnList;
    }
    return returnList;
}
//Method to return all advertisemnts
-(NSMutableArray*)getAdvertisementByIngrediente:(int)idIngrediente{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT img_publidad,tel_publicidad,web_publicidad FROM publicidad p, ing_pub_pnt i WHERE i.id_publicidad = p.id_publicidad AND i.id_ingrediente = %d;",idIngrediente];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Publicidad *pubObj = [[Publicidad alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            [pubObj setImgPublicidad: [[NSString alloc]initWithUTF8String:field1] ];            
            field1 = (char *) sqlite3_column_text(statement, 1);
            [pubObj setTelPublicidad: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [pubObj setWebPublicidad: [[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:pubObj];
        }
    }
    return returnList;
}
//Method to return all cool information
-(NSMutableArray*)getCoolInformation:(int)language{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"Select * from interesting where idLanguage = %d order by RANDOM();",language];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Interesting *intObj = [[Interesting alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            [intObj setIdInteresting: [[NSString alloc]initWithUTF8String:field1].intValue ];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [intObj setNamInteresting:[[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [intObj setContentInteresting:[[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:intObj];
        }
    }
    return returnList;
}
//Method to return all Ingredients
-(NSMutableArray*)getIngredients:(NSString*)order{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"Select i.id_ingrediente, i.nom_ingrediente, i.nam_ingrediente, i.img_ingrediente, i.tipo_ingrediente FROM Ingrediente i ORDER BY %@;",order];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Ingrediente *ingObj = [[Ingrediente alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [ingObj setIdIngrediente: field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [ingObj setNomIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
          //  [ingObj setNamIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 3);
            [ingObj setImgIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 4);
            field1str = [[NSString alloc]initWithUTF8String:field1];
            [ingObj setTipoIngrediente: field1str.intValue];
            [returnList addObject:ingObj];
        }
        return returnList;
    }
    return returnList;
}
//Method to return all Veggies
-(NSMutableArray*)getVeggies:(int)language{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql;
    if(language ==1){
        sql = [NSString stringWithFormat:@"Select distinct i.id_ingrediente, i.nom_ingrediente,  i.img_ingrediente, (select count(*) from  ing_pub_pnt where id_ingrediente = i.id_ingrediente) as pub from ingrediente i, receta_ingrediente_pnt r where i.id_ingrediente = r.id_ingrediente AND tipo_ingrediente = 2   ORDER BY nom_ingrediente;"];
    }else{
        sql = [NSString stringWithFormat:@"Select distinct i.id_ingrediente, i.nam_ingrediente, i.img_ingrediente, (select count(*) from  ing_pub_pnt where id_ingrediente = i.id_ingrediente) as pub from ingrediente i, receta_ingrediente_pnt r where i.id_ingrediente = r.id_ingrediente AND tipo_ingrediente = 2   ORDER BY nam_ingrediente;"];
    }
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Ingrediente *ingObj = [[Ingrediente alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [ingObj setIdIngrediente: field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [ingObj setNomIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [ingObj setImgIngrediente: [[NSString alloc]initWithUTF8String:field1]];
            [ingObj setTipoIngrediente: 2];
            [returnList addObject:ingObj];
        }
        return returnList;
    }
    return returnList;
}

-(NSMutableArray*)getSnackList:(int)ingredient{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT A.id_receta, A.img_ingrediente, B.img_ingrediente, C.img_ingrediente, A.id_ingrediente,B.id_ingrediente,C.id_ingrediente FROM ( (select i.id_ingrediente,i.img_ingrediente, p.id_receta from receta_ingrediente_pnt p, ingrediente i where p.id_receta in (select id_receta from receta_ingrediente_pnt ipp where ipp.id_ingrediente = %d) AND i.id_ingrediente = p.id_ingrediente AND i.tipo_ingrediente = 1 GROUP BY id_receta) A  INNER JOIN (select i.id_ingrediente,i.img_ingrediente, p.id_receta from receta_ingrediente_pnt p, ingrediente i where p.id_receta in (select id_receta from receta_ingrediente_pnt ipp where ipp.id_ingrediente = %d) AND i.id_ingrediente = p.id_ingrediente AND i.tipo_ingrediente = 2 GROUP BY id_receta) B INNER JOIN (select i.id_ingrediente,i.img_ingrediente, p.id_receta from receta_ingrediente_pnt p, ingrediente i where p.id_receta in (select id_receta from receta_ingrediente_pnt ipp where ipp.id_ingrediente = %d) AND i.id_ingrediente = p.id_ingrediente AND i.tipo_ingrediente = 3 GROUP BY id_receta)C) WHERE A.id_receta = B.id_receta AND B.id_receta = C.id_receta ORDER by RANDOM() limit 5;",ingredient,ingredient,ingredient];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            listSnack *listObj = [[listSnack alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [listObj setIdRecipe:field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [listObj setIng1: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [listObj setIng2: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 3);
            [listObj setIng3: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 4);
            field1str = [[NSString alloc]initWithUTF8String:field1];
            [listObj setIdIng1:field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 5);
            field1str = [[NSString alloc]initWithUTF8String:field1];
            [listObj setIdIng2:field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 6);
            field1str = [[NSString alloc]initWithUTF8String:field1];
            [listObj setIdIng3:field1str.intValue];
            [returnList addObject:listObj];
        }
    }
    int count = 0;
    for (int i=0; i<[returnList count]; i++) {
        if ([[returnList objectAtIndex:i] getIdIng1]== 76) {
            count ++;
            if (count == 2) {
                [returnList removeObjectAtIndex:i];
            }
        }
    }
    return returnList;
}

-(NSMutableArray*)getAllLove:(int)language{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql;
    if (language==1) {
        sql = [NSString stringWithFormat:@"SELECT contenido_idea,img_idea from IDEA WHERE tipo_idea = 3"];
    }else{
        sql = [NSString stringWithFormat:@"SELECT content_idea,img_idea from IDEA WHERE tipo_idea = 3"];
    }
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Love *listObj = [[Love alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            [listObj setContLove: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [listObj setImgLove: [[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:listObj];
        }
    }
    return returnList;
}

-(NSMutableArray*)getRecipe:(int)language :(int)idReceta{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql;
    if (language==1) {
        sql = [NSString stringWithFormat:@"SELECT nom_receta,ing_receta_esp, desc_receta_esp, nota_receta, img_love FROM RECETA WHERE id_RECETA = %d;", idReceta];
    }else{
        sql = [NSString stringWithFormat:@"SELECT nam_receta,ing_receta_eng, desc_receta_eng, note_receta, img_love FROM RECETA WHERE id_RECETA = %d;", idReceta];
    }
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Receta *listObj = [[Receta alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            [listObj setNombre:[[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [listObj setIngredientes: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [listObj setPreparacion: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 3);
            [listObj setAmor: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 4);
            [listObj setImg: [[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:listObj];
        }
    }
    return returnList;
}

-(NSMutableArray*)getBasicas:(int)language{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql;
    if (language==1) {
        sql = [NSString stringWithFormat:@"SELECT nom_receta,ing_receta_esp, desc_receta_esp, img_receta FROM RECETA WHERE rec_basica = 'S';"];
    }else{
        sql = [NSString stringWithFormat:@"SELECT nam_receta,ing_receta_eng, desc_receta_eng, img_receta FROM RECETA WHERE rec_basica = 'S';"];
    }
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Receta *listObj = [[Receta alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            [listObj setNombre:[[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [listObj setIngredientes: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [listObj setPreparacion: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 3);
            [listObj setImg: [[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:listObj];
        }
    }
    return returnList;
}

-(NSMutableArray*)getExport{
    returnList = [[NSMutableArray alloc] init];
    NSString *sql;
    sql = [NSString stringWithFormat:@"SELECT * from Export;"];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            Export *listObj = [[Export alloc] init];
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *field1str = [[NSString alloc]initWithUTF8String:field1];
            [listObj setIdExport:field1str.intValue];
            field1 = (char *) sqlite3_column_text(statement, 1);
            [listObj setNomExport: [[NSString alloc]initWithUTF8String:field1]];
            field1 = (char *) sqlite3_column_text(statement, 2);
            [listObj setNamExport: [[NSString alloc]initWithUTF8String:field1]];
            [returnList addObject:listObj];
        }
    }
    return returnList;
}



- (void) execQuery:(NSString *)query {
    char *errorMsg;
    if (sqlite3_exec(db, [query UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
        NSLog(@"DB Error. '%s'", sqlite3_errmsg(db));
    }
}

@end
