//
//  Receta.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/7/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Receta.h"

@implementation Receta

-(id)init{
    self = [super init];
    if (self) {
        idReceta = 0;
        nombre = @"";
        ingredientes = @"";
        preparacion = @"";
        amor = @"";
        img = @"";
    }
    return self;
}


//GETS
-(int)getIdReceta{
    return idReceta;
}

-(NSString*)getNombre{
    return  nombre;
}

-(NSString*)getIngredientes{
    return ingredientes;
}

-(NSString*)getPreparacion{
    return preparacion;
}

-(NSString*)getAmor{
    return amor;
}

-(NSString*)getImg{
    return img;
}

//SETS
-(void)setIdReceta:(int)idRecetaN{
    idReceta = idRecetaN;
}

-(void)setNombre:(NSString*)nombreN{
    nombre = nombreN;
}


-(void)setIngredientes:(NSString*)ingredientesN{
    ingredientes = ingredientesN;
}
-(void)setPreparacion:(NSString*)preparacionN{
    preparacion = preparacionN;
}
-(void)setAmor:(NSString*)amorN{
    amor = amorN;
}

-(void)setImg:(NSString*)imgN{
    img = imgN;
}
@end
