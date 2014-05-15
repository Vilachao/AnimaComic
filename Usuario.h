//
//  Usuario.h
//  AnimaComic
//
//  Created by Jose Maria on 08/05/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSString * clave;
@property (nonatomic, retain) NSNumber * idUsuario;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * usuario;

@end
