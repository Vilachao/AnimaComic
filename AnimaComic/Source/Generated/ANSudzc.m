/*
	ANSudzc.m
	Creates a list of the services available with the AN prefix.
	Generated by SudzC.com
*/
#import "ANSudzc.h"

@implementation ANSudzC

@synthesize logging, server, defaultServer;

@synthesize wsclassService;


#pragma mark Initialization

-(id)initWithServer:(NSString*)serverName{
	if(self = [self init]) {
		self.server = serverName;
	}
	return self;
}

+(ANSudzC*)sudzc{
	return (ANSudzC*)[[ANSudzC alloc] init];
}

+(ANSudzC*)sudzcWithServer:(NSString*)serverName{
	return (ANSudzC*)[[ANSudzC alloc] initWithServer:serverName];
}

#pragma mark Methods

-(void)setLogging:(BOOL)value{
	logging = value;
	[self updateServices];
}

-(void)setServer:(NSString*)value{
	server = value;
	[self updateServices];
}

-(void)updateServices{

	[self updateService: self.wsclassService];
}

-(void)updateService:(SoapService*)service{
	service.logging = self.logging;
	if(self.server == nil || self.server.length < 1) { return; }
	service.serviceUrl = [service.serviceUrl stringByReplacingOccurrencesOfString:defaultServer withString:self.server];
}

#pragma mark Getter Overrides


-(ANWsclassService*)wsclassService{
	if(wsclassService == nil) {
		wsclassService = [[ANWsclassService alloc] init];
	}
	return wsclassService;
}


@end
			