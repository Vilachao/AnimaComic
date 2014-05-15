//
//  ACactividadesViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 23/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "MBProgressHUD.h"
#import "ACactividadesViewController.h"
#import "ANWsclassService.h"
#import "ACAppDelegate.h"
#import "Actividad.h"
#import "MBProgressHUD.h"
#import "ACTableViewCell.h"
#import "ACdetalleActividadesViewController.h"
#define ACTIVIDAD @"http://animacomic.kometasoft.com/public/images/actividad/"

@interface ACactividadesViewController ()
{
    int offsetActividad;
    int indiceActividad;
    int semaforo;
}


@property ANWsclassService *service;

@end

@implementation ACactividadesViewController

@synthesize service;

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
    semaforo = 0;
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES animated:YES];
#ifdef LITE
    
    self.vistaProximamente.hidden=NO;
    self.vistaNegra.hidden=NO;
    self.navigationController.navigationBar.hidden = YES;
    
#else
    
    self.vistaProximamente.hidden=YES;
    self.vistaNegra.hidden=YES;

#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated{

    [self loadData];
    NSLog(@"valor %d",[self.listaActividades count]);
    if([self.listaActividades count]<1)
        [self getActividadWS];
}


- (void)getActividadWS {
    if(!service)
        service = [ANWsclassService service];
    	service.logging = NO;
        offsetActividad = 0;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
	[service getAllActividad:self action:@selector(getAllActividadHandler:) lastId: 0 offset: offsetActividad limit: 10 fechaUltComp: @""];

}

- (void) getAllActividadHandler: (id) value {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
	// Handle errors
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error en servidor" message:@"vuelva a intentarlo mas tarde" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
	if([value isKindOfClass:[NSError class]]) {

		NSLog(@"%@", value);
        [alert show];
        return;
	}
    
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
        [alert show];
        return;
	}
    if(!semaforo)
    {
        semaforo = 1;
        [self borrarBD];
    }
    ANArrayOfActividad* result = (ANArrayOfActividad*)value;
        if(result && ([result.actividads count] > 0)){
            [self insertaActividad:result.actividads :0];
            NSLog(@"getActividades returned the value: %@", result.actividads);
        }else{
            //entra cuando ha terminado de cargar todos los datos de la BD
            semaforo =0;
            [self loadData];
        }
}


-(void)borrarBD{
    ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest * allActividades = [[NSFetchRequest alloc] init];
    [allActividades setEntity:[NSEntityDescription entityForName:@"Actividad" inManagedObjectContext:context]];
    [allActividades setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    NSArray * actividades = [context executeFetchRequest:allActividades error:&error];
    
    //error handling goes here
    for (NSManagedObject * actividad in actividades) {
        [context deleteObject:actividad];
    }
    NSError *saveError = nil;
    [context save:&saveError];

}

- (void)insertaActividad:(NSMutableArray *)Actividads :(int)offset {
    ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error = nil;
    offsetActividad = offsetActividad + (int)[Actividads count];
    for(ANActividadWS *actividadWS in Actividads){
        Actividad *actividadX = [NSEntityDescription insertNewObjectForEntityForName:@"Actividad" inManagedObjectContext:context];
        actividadX.titulo = actividadWS.titulo;
        actividadX.idActividad =  [[NSNumber alloc] initWithInt:actividadWS._id];
        actividadX.dia = actividadWS.dia;
        actividadX.descripcion = actividadWS.descripcion;
        actividadX.facebook = actividadWS.facebook;
        actividadX.horaFin = actividadWS.horafin;
        actividadX.horaInicio = actividadWS.horainicio;
        actividadX.lugar = actividadWS.lugar;
        actividadX.rutaFoto = actividadWS.rutafoto;
        actividadX.subtitulo = actividadWS.subtitulo;
        actividadX.tipo = actividadWS.tipo;
        actividadX.titulo = actividadWS.titulo;
        actividadX.twitter = actividadWS.twitter;
        actividadX.web = actividadWS.web;
        
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
     [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    
     [service getAllActividad:self action:@selector(getAllActividadHandler:) lastId: 0 offset: offsetActividad limit: 10 fechaUltComp: @""];
}


- (void)loadData {
    

    if (!self.filtro || ![self.filtro count]){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Actividad"];
        ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
        self.listaActividades = [[NSMutableArray alloc] initWithArray:[appDelegate.managedObjectContext executeFetchRequest:request error:nil]];

    }else{
        if(!self.listaActividades)
            self.listaActividades = [[NSMutableArray alloc] init];
        for (NSString *actividad in self.filtro) {
            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Actividad"];
            request.predicate = [NSPredicate predicateWithFormat:@"(tipo == %@)",actividad];
            NSLog(@"Actividad: %@",actividad);
            ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
            [self.listaActividades addObjectsFromArray:[appDelegate.managedObjectContext executeFetchRequest:request error:nil]];
        }
        NSLog(@"ListaActividades: %@", self.listaActividades);
    }
    [self.tableActividad reloadData];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listaActividades count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ACTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Actividad *emp = self.listaActividades[indexPath.row];
    cell.nombreActividad.text = emp.titulo;
    cell.fechaActividad.text=emp.dia;
    cell.horaActividad.text=emp.horaInicio;
    cell.horaFinActividad.text=emp.horaFin;
    NSString *urlString = [NSString stringWithFormat:@"%@%@",ACTIVIDAD,emp.rutaFoto];
    NSURL *url = [NSURL URLWithString:urlString];
    UIImage *img = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:url]];
    cell.imagenActividad.image=img;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableActividad deselectRowAtIndexPath:indexPath animated:YES];
    indiceActividad= indexPath.row;
    [self performSegueWithIdentifier:@"Actividad" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Actividad"]) {
        Actividad *actividad = self.listaActividades[indiceActividad];
        ACdetalleActividadesViewController *actividadDetallada = segue.destinationViewController;
        actividadDetallada.actividad = actividad;
    }
}

- (IBAction)actualizarLista:(id)sender {
        [self getActividadWS];
}

@end
