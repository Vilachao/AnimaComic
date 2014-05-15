//
//  Entrada.h
//  AnimaComic
//
//  Created by Jose Maria on 08/05/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entrada : NSManagedObject

@property (nonatomic, retain) NSString * codigo;
@property (nonatomic, retain) NSString * dni;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * idEntrada;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo;

@end
