//
//  ACexpositoresViewController.h
//  AnimaComic
//
//  Created by Jose Maria on 29/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Expositor;

@interface ACexpositoresViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *vistaProximamente;
@property (weak, nonatomic) IBOutlet UIImageView *vistaNegra;
@property (nonatomic, strong) NSArray *listaExpositores;
@property (weak, nonatomic) IBOutlet UITableView *tablaExpositores;
- (IBAction)actualizarLista:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *actualizarBoton;
@property (nonatomic, strong) Expositor *expositor;

@end
