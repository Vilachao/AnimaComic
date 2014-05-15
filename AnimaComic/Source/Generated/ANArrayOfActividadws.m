/*
	ANArrayOfActividadws.h
	The implementation of properties and methods for the ANArrayOfActividadws array.
	Generated by SudzC.com
*/
#import "ANArrayOfActividadws.h"

#import "ANActividadWS.h"
@implementation ANArrayOfActividadws

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				ANActividadWS* value = [[ANActividadWS createWithNode: child] object];
				if(value != nil) {
					[self addObject: value];
				}
			}
		}
		return self;
	}
	
	+ (NSMutableString*) serialize: (NSArray*) array
	{
		NSMutableString* s = [NSMutableString string];
		for(id item in array) {
			[s appendString: [item serialize: @"ActividadWS"]];
		}
		return s;
	}
@end
