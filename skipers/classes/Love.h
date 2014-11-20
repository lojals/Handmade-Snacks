//
//  Love.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/2/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Love : NSObject{
    NSString* contLove;
    NSString* imgLove;
}
//GETS
-(NSString *) getContLove;
-(NSString *) getImgLove;
//SETS
-(void)setContLove:(NSString *)contLoveN;
-(void)setImgLove:(NSString *)imgLoveN;
//CUSTOM
-(bool)haveImg;
@end
