//
//  Export.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/9/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Export.h"

@implementation Export

-(id)init{
    self = [super init];
    if (self) {
        idExport = 0;
        namExport = @"";
        nomExport = @"";
    }
    return self;
}


//GETS
-(int) getIdExport{
    return idExport;
}
-(NSString*) getNamExport{
    return namExport;
}
-(NSString*) getNomExport{
    return nomExport;
}
//SETS
-(void) setIdExport:(int)idExportN{
    idExport = idExportN;
}
-(void) setNamExport:(NSString*)namExportN{
    namExport = namExportN;
}
-(void) setNomExport:(NSString*)nomExportN{
    nomExport = nomExportN;
}

@end
