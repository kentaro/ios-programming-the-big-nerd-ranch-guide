#import "Possession.h"

@implementation Possession

@synthesize possessionName, serialNumber, valueInDollars, dateCreated;

+ (id)randomPossession
{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", 
                                                             @"Rusty",
                                                             @"Shiny", nil];
    
    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects: @"Bear",
                                                         @"Spork", 
                                                         @"Mac", nil];
    
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number
    // from 0 to 2 inclusive
    int adjectiveIndex = rand() % [randomAdjectiveList count];
    int nounIndex = rand() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                [randomAdjectiveList objectAtIndex:adjectiveIndex],
                [randomNounList objectAtIndex:nounIndex]];

    int randomValue = rand() % 100;

    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    
    Possession *newPossession = 
    [[self alloc] initWithPossessionName:randomName 
                          valueInDollars:randomValue 
                            serialNumber:randomSerialNumber];

    return newPossession;
}

- (id)initWithPossessionName:(NSString *)name 
              valueInDollars:(int)value 
                serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self) {
        
        // Give the instance variables initial values
        possessionName = name;
        serialNumber   = sNumber;
        valueInDollars = value;
        dateCreated    = [[NSDate alloc] init];
    }
    
    // Return the address of the newly initialized object
    return self;
}

- (id)initWithPossessionName:(NSString *)name
{
    return [self initWithPossessionName:name
                         valueInDollars:0
                           serialNumber:@""];
}

- (id)init
{
    return [self initWithPossessionName:@"Possession" 
                         valueInDollars:0
                           serialNumber:@""];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (%@): Worth $%d, Recorded on %@",
                            possessionName,
                            serialNumber,
                            valueInDollars,
                            dateCreated];
}

@end
