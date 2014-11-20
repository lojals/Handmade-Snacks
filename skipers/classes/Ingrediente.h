//
//  Ingrediente.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingrediente : NSObject
{
    int idIngrediente;
    NSString *nomIngrediente;
    NSString *imgIngrediente;
    int tipoIngrediente;
}
//Gets
-(int) getIdIngrediente;
-(NSString*) getNomIngrediente;
-(NSString*) getImgIngrediente;
-(int) getTipoIngrediente;
//Sets
-(void) setIdIngrediente:(int)idIngredienteN;
-(void) setNomIngrediente:(NSString*)nomIngredienteN;
-(void) setImgIngrediente:(NSString*)imgIngredienteN;
-(void) setTipoIngrediente:(int)tipoIngredienteN;

@end
