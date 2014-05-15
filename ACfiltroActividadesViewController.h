//
//  ACfiltroActividadesViewController.h
//  AnimaComic
//
//  Created by Jose Maria on 23/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACfiltroActividadesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *botonFiltrar;
@property NSMutableArray * tiposFiltro;

//- (IBAction)aplicaFiltro:(id)sender;


@end
