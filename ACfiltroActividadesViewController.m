//
//  ACfiltroActividadesViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 23/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACfiltroActividadesViewController.h"
#import "MBProgressHUD.h"
#import "ACactividadesViewController.h"
#import "ANWsclassService.h"
#import "ACAppDelegate.h"
#import "Actividad.h"
#import "MBProgressHUD.h"
#import "ACTableViewCell.h"

@interface ACfiltroActividadesViewController ()

@property NSMutableArray * tipos;
@property NSMutableArray * tiposBD;


@end

@implementation ACfiltroActividadesViewController
@synthesize tipos,tiposBD,tiposFiltro;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES animated:YES];
    tiposBD =[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObjects:@"Juegos y competiciones",@"Invitados",@"Conciertos y proyecciones",@"Charlas y conferencias",@"Concursos",@"Talleres",@"Exposiciones",nil]];

    tipos = [[NSMutableArray alloc]initWithArray:[NSArray arrayWithObjects:@"juegos",@"invitados",@"conciertos",@"charlas",@"concursos",@"talleres",@"exposiciones",nil]];

    if(!tipos)
        tipos = [[NSMutableArray alloc]initWithArray:[NSArray arrayWithObjects:@"Juegos y competiciones",@"Invitados",@"Conciertos y proyecciones",@"Charlas y conferencias",@"Concursos",@"Talleres",@"Exposiciones",nil]];
    tiposFiltro= [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(addCategoria:) name:@"addFiltro" object:nil];
    [center addObserver:self selector:@selector(quitaCategoria:) name:@"remFiltro" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (IBAction)aplicaFiltro:(id)sender {
//    ACactividadesViewController *actividadesVC = (ACactividadesViewController *)[self.navigationController popViewControllerAnimated:YES];
//    actividadesVC.filtro = tiposFiltro;
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"filtro"]) {
        ACactividadesViewController *actividadesVC = segue.destinationViewController;
        actividadesVC.filtro = self.tiposFiltro;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tipos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ACTableViewCell *categoriaCell = [tableView dequeueReusableCellWithIdentifier:@"categoriaCell"];
    categoriaCell.nombreCategoria.text = [tipos objectAtIndex:indexPath.row];
//    categoriaCell.imagenCategoria.image =


    return categoriaCell;
}

-(void)addCategoria:(NSNotification *)notif{
    NSString * cat = [notif.userInfo objectForKey:@"categoria"];
    [tiposFiltro addObject:cat];
        NSLog(@"%@",tiposFiltro);
}

-(void)quitaCategoria:(NSNotification *)notif{
    NSString * cat = [notif.userInfo objectForKey:@"categoria"];
    [tiposFiltro removeObject:cat];
    NSLog(@"%@",tiposFiltro);
}





@end
