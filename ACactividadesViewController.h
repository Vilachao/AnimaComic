//
//  ACactividadesViewController.h
//  AnimaComic
//
//  Created by Jose Maria on 23/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACactividadesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *vistaProximamente;
@property (weak, nonatomic) IBOutlet UIImageView *vistaNegra;
@property (nonatomic, strong) NSMutableArray *listaActividades;
@property (nonatomic, strong) NSArray *listaActividadesAux;
@property (nonatomic, strong) NSArray *filtro;
@property (weak, nonatomic) IBOutlet UITableView *tableActividad;
- (IBAction)actualizarLista:(id)sender;


@end
