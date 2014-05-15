//
//  Expositor.h
//  AnimaComic
//
//  Created by Jose Maria on 08/05/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Expositor : NSManagedObject

@property (nonatomic, retain) NSString * correo;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * facebook;
@property (nonatomic, retain) NSNumber * idExpositor;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * rutaLogo;
@property (nonatomic, retain) NSString * telefono;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSString * web;

@end
