//
//  Ingrediente.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/22/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Ingrediente.h"

@implementation Ingrediente

-(id)init{
    self = [super init];
    if (self) {
        idIngrediente = 0;
        nomIngrediente = @"";
        imgIngrediente = @"";
        tipoIngrediente = 0;
    }
    return self;
}
//Gets implementation
-(int) getIdIngrediente{
    return idIngrediente;
}
-(NSString*) getNomIngrediente{
    return  nomIngrediente;
}
-(NSString*) getImgIngrediente{
    return imgIngrediente;
}
-(int) getTipoIngrediente{
    return tipoIngrediente;
}

//Sets implementation
-(void) setIdIngrediente:(int)idIngredienteN{
    idIngrediente = idIngredienteN;
}
-(void) setNomIngrediente:(NSString*)nomIngredienteN{
    nomIngrediente = nomIngredienteN;
}
-(void) setImgIngrediente:(NSString*)imgIngredienteN{
    imgIngrediente = imgIngredienteN;
}
-(void) setTipoIngrediente:(int)tipoIngredienteN{
    tipoIngrediente = tipoIngredienteN;
}

@end
