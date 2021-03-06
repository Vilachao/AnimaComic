/*
	ANArrayOfExpositorws.h
	The implementation of properties and methods for the ANArrayOfExpositorws array.
	Generated by SudzC.com
*/
#import "ANArrayOfExpositorws.h"

#import "ANExpositorWS.h"
@implementation ANArrayOfExpositorws

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				ANExpositorWS* value = [[ANExpositorWS createWithNode: child] object];
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
			[s appendString: [item serialize: @"ExpositorWS"]];
		}
		return s;
	}
@end
