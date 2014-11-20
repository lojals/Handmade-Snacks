//
//  Receta.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/7/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Receta : NSObject{
    int idReceta;
    NSString *nombre;
    NSString *ingredientes;
    NSString *preparacion;
    NSString *amor;
    NSString *img;
}
//GETS
-(int)getIdReceta;
-(NSString*)getNombre;
-(NSString*)getIngredientes;
-(NSString*)getPreparacion;
-(NSString*)getAmor;
-(NSString*)getImg;

//SETS
-(void)setIdReceta:(int)idRecetaN;
-(void)setNombre:(NSString*)nombreN;
-(void)setIngredientes:(NSString*)ingredientesN;
-(void)setPreparacion:(NSString*)preparacionN;
-(void)setAmor:(NSString*)amorN;
-(void)setImg:(NSString*)imgN;
@end
