//
//  Publicidad.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Publicidad.h"

@implementation Publicidad

-(id)init{
    self = [super init];
    if (self) {
        idPublicidad = 0;
        nomPublicidad = @"";
        webPublicidad = @"";
        telPublicidad = @"";
        imgPublicidad = @"";
    }
    return self;
}


-(int) getIdPublicidad{
    return idPublicidad;
}
-(NSString*) getNomPublicidad{
    return nomPublicidad;
}
-(NSString*) getWebPublicidad{
    return webPublicidad;
}
-(NSString*) getTelPublicidad{
    return telPublicidad;
}
-(NSString*) getImgPublicidad{
    return imgPublicidad;
}
//SETS
-(void) setIdPublicidad:(int)idPublicidadN{
    idPublicidad = idPublicidadN;
}
-(void) setNomPublicidad:(NSString*) nomPublicidadN{
    nomPublicidad = nomPublicidadN;
}
-(void) setWebPublicidad:(NSString*) webPublicidadN{
    webPublicidad = webPublicidadN;
}
-(void) setTelPublicidad: (NSString*) telPublicidadN{
    telPublicidad = telPublicidadN;
}
-(void) setImgPublicidad: (NSString*) imgPublicidadN{
    imgPublicidad = imgPublicidadN;
}

@end
