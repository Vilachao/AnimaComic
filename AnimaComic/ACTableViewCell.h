//
//  ACTableViewCell.h
//  AnimaComic
//
//  Created by Jose Maria on 13/05/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombreCategoria;
@property (weak, nonatomic) IBOutlet UIImageView *imagenCategoria;
@property (weak, nonatomic) IBOutlet UISwitch *cambioCategoria;
@property (weak, nonatomic) IBOutlet UILabel *fechaActividad;
@property (weak, nonatomic) IBOutlet UILabel *nombreActividad;
@property (weak, nonatomic) IBOutlet UILabel *horaActividad;
@property (weak, nonatomic) IBOutlet UIImageView *imagenActividad;
@property (weak, nonatomic) IBOutlet UILabel *horaFinActividad;

@property (weak, nonatomic) NSString *categoria;
@end
