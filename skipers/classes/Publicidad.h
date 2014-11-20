//
//  Publicidad.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Publicidad : NSObject{
    int idPublicidad;
    NSString *nomPublicidad;
    NSString *webPublicidad;
    NSString *telPublicidad;
    NSString *imgPublicidad;
}

//GETS
-(int) getIdPublicidad;
-(NSString*) getNomPublicidad;
-(NSString*) getWebPublicidad;
-(NSString*) getTelPublicidad;
-(NSString*) getImgPublicidad;
//SETS
-(void) setIdPublicidad:(int)idPublicidadN;
-(void) setNomPublicidad:(NSString*) nomPublicidadN;
-(void) setWebPublicidad:(NSString*) webPublicidadN;
-(void) setTelPublicidad: (NSString*) telPublicidadN;
-(void) setImgPublicidad: (NSString*) imgPublicidadN;


@end
