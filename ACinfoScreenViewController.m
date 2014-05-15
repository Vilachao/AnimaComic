//
//  ACinfoScreenViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 11/03/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACinfoScreenViewController.h"

@interface ACinfoScreenViewController ()

@end

@implementation ACinfoScreenViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	self.textView.textAlignment=NSTextAlignmentJustified;
    [self.textView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.textView.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    self.textView.layer.cornerRadius = 10;
    self.textView.clipsToBounds = YES;
    self.textView.textContainerInset = UIEdgeInsetsMake(13.0f, 13.0f, 13.0f, 13.0f);

    self.textView.selectable=NO;
    self.textView.textColor=[UIColor whiteColor];
    self.textView.text = @"Animacomic: Salón de la Animación, el Manga y el Cómic de Málaga, celebra su segunda edición los días 5 y 6 de julio en el Palacio de Ferias y Congresos de Málaga.\n\n  Una cita ineludible para los aficionados al cómic y a las distintas manifestaciones del arte de la ilustración y la animación.\n\n  Cómic americano, europeo, manga, anime y animación se dan cita en un evento consolidado como referente andaluz.\n\n  En Animacomic el visitante tendrá la oportunidad de asistir a charlas y master class de reconocidos profesionales, firma de autores y encuentros entre distintas asociaciones, siempre apostando por los creadores españoles.\n\n  Además podrá participar en un amplio abanico de actividades lúdicas, torneos y concursos.\n\n  Todo ello junto con una gran zona comercial donde podrá encontrar desde las últimas novedades hasta piezas de colección.\n\n  La gran fiesta del comic en Andalucía.";
   
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callAction:(id)sender {
    
    NSURL *phoneNumber = [NSURL URLWithString:@"telprompt://955237469"];
    [[UIApplication sharedApplication] openURL:phoneNumber];
    
}

- (IBAction)mailAction:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:info@animacomic.es"]];
}

@end
