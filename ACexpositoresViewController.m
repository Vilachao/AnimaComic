//
//  ACexpositoresViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 29/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACexpositoresViewController.h"
#import "MBProgressHUD.h"
#import "ANWsclassService.h"
#import "ACAppDelegate.h"
#import "Expositor.h"
#import "MBProgressHUD.h"
#import "ACdetalleExpositoresViewController.h"
#import "ACceldaExpositoresTableViewCell.h"

#define EXPOSITOR @"http://animacomic.kometasoft.com/public/images/expositor/"

@interface ACexpositoresViewController ()
{
    int offsetExpositor;
    int indiceExpositor;
    int semaforoBorrarExpositores;
}

@property ANWsclassService *service;
@end

@implementation ACexpositoresViewController

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
    [super viewDidLoad];
    semaforoBorrarExpositores=0;
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
    if(![self.listaExpositores count])
        [self getExpositorWS];
    
}

- (void)getExpositorWS {
    if(!service)
        service = [ANWsclassService service];
    service.logging = NO;
    offsetExpositor = 0;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    
	[service getAllExpositor:self action:@selector(getAllExpositorHandler:) lastId: 0 offset: offsetExpositor limit: 10 fechaUltComp: @""];
    
}


- (void) getAllExpositorHandler: (id) value {
    
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
    
    if(!semaforoBorrarExpositores)
    {
        [self borraExpositores];
        semaforoBorrarExpositores=1;
    }
    ANArrayOfExpositor* result = (ANArrayOfExpositor*)value;
    if(result && ([result.expositors count] > 0)){
        [self insertaExpositor:result.expositors :0];
        NSLog(@"getExpositores returned the value: %@", result.expositors);
    }else{
        //entra cuando ha terminado de cargar todos los datos de la BD
        semaforoBorrarExpositores=0;
        [self loadData];
    }
}


-(void)borraExpositores{
    ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest * allExpositores = [[NSFetchRequest alloc] init];
    [allExpositores setEntity:[NSEntityDescription entityForName:@"Expositor" inManagedObjectContext:context]];
    [allExpositores setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    NSArray * expositores = [context executeFetchRequest:allExpositores error:&error];

    //error handling goes here
    for (NSManagedObject * expositor in expositores) {
        [context deleteObject:expositor];
    }
    NSError *saveError = nil;
    [context save:&saveError];
    
}


- (void)insertaExpositor:(NSMutableArray *)Expositors :(int)offset {
    ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error = nil;
    offsetExpositor = offsetExpositor + (int)[Expositors count];
    for(ANExpositorWS *expositorWS in Expositors){
        Expositor *expositorX = [NSEntityDescription insertNewObjectForEntityForName:@"Expositor" inManagedObjectContext:context];
        expositorX.correo = expositorWS.correo;
        expositorX.idExpositor =  [[NSNumber alloc] initWithInt:expositorWS._id];
        expositorX.descripcion = expositorWS.descripcion;
        expositorX.facebook = expositorWS.facebook;
        expositorX.nombre = expositorWS.nombre;
        expositorX.rutaLogo = expositorWS.rutalogo;
        expositorX.telefono = expositorWS.telefono;
        expositorX.twitter = expositorWS.twitter;
        expositorX.web = expositorWS.web;
        NSLog(@"Nombre del expositor: %@", expositorX.nombre);
        
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    
    [service getAllExpositor:self action:@selector(getAllExpositorHandler:) lastId: 0 offset: offsetExpositor limit: 10 fechaUltComp: @""];
    
}

- (void)loadData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Expositor"];
    ACAppDelegate *appDelegate = (ACAppDelegate *) [UIApplication sharedApplication].delegate;
    self.listaExpositores = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    [self.tablaExpositores reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listaExpositores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *CellIdentifier = @"Cell";
    ACceldaExpositoresTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Expositor *emp = self.listaExpositores[indexPath.row];
    NSString *urlString = [NSString stringWithFormat:@"%@%@",EXPOSITOR,emp.rutaLogo];
    NSURL *url = [NSURL URLWithString:urlString];
    UIImage *img = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:url]];
    cell.labelExpositor.text = emp.nombre;
    cell.imagenExpositor.image=img;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tablaExpositores deselectRowAtIndexPath:indexPath animated:YES];
    indiceExpositor= indexPath.row;
    [self performSegueWithIdentifier:@"Expositor" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Expositor"]) {
        Expositor *expositor = self.listaExpositores[indiceExpositor];
        ACdetalleExpositoresViewController *expositorDetallado = segue.destinationViewController;
        expositorDetallado.expositor = expositor;
    }
}

- (IBAction)actualizarLista:(id)sender {
    self.actualizarBoton.enabled = false;
    [[NSTimer timerWithTimeInterval:10.0 target:self selector:@selector(activaActualizarBoton:) userInfo:nil repeats:NO] fire]
    ;
    [self getExpositorWS];
}

-(void)activaActualizarBoton:(NSTimer *)timer{
    self.actualizarBoton.enabled = true;
}




@end
