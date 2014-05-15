/*
	ANArrayOfExpositor.h
	The implementation of properties and methods for the ANArrayOfExpositor object.
	Generated by SudzC.com
*/
#import "ANArrayOfExpositor.h"

#import "ANArrayOfExpositorws.h"
@implementation ANArrayOfExpositor
	@synthesize expositors = _expositors;

	- (id) init
	{
		if(self = [super init])
		{
			self.expositors = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (ANArrayOfExpositor*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.expositors = [[ANArrayOfExpositorws createWithNode: [Soap getNode: node withName: @"expositors"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"ArrayOfExpositor"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		if (self.expositors != nil && self.expositors.count > 0) {
			[s appendFormat: @"<expositors>%@</expositors>", [ANArrayOfExpositorws serialize: self.expositors]];
		} else {
			[s appendString: @"<expositors/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[ANArrayOfExpositor class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
