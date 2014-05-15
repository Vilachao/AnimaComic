/*
	ANArrayOfExpositor.h
	The interface definition of properties and methods for the ANArrayOfExpositor object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ANArrayOfExpositorws;

@interface ANArrayOfExpositor : SoapObject
{
	NSMutableArray* _expositors;
	
}
		
	@property (retain, nonatomic) NSMutableArray* expositors;

	+ (ANArrayOfExpositor*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
