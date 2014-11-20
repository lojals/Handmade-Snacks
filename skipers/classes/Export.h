//
//  Export.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/9/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Export : NSObject{
    int idExport;
    NSString *namExport;
    NSString *nomExport;
}

//GETS
-(int) getIdExport;
-(NSString*) getNamExport;
-(NSString*) getNomExport;
//SETS
-(void) setIdExport:(int)idExportN;
-(void) setNamExport:(NSString*)namExportN;
-(void) setNomExport:(NSString*)nomExportN;
@end
