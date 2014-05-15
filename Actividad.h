//
//  Actividad.h
//  AnimaComic
//
//  Created by Jose Maria on 08/05/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Actividad : NSManagedObject

@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * dia;
@property (nonatomic, retain) NSString * facebook;
@property (nonatomic, retain) NSString * horaFin;
@property (nonatomic, retain) NSString * horaInicio;
@property (nonatomic, retain) NSNumber * idActividad;
@property (nonatomic, retain) NSString * lugar;
@property (nonatomic, retain) NSString * rutaFoto;
@property (nonatomic, retain) NSString * subtitulo;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSString * web;

@end
