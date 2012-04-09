#import <Foundation/Foundation.h>

@interface Possession : NSObject

@property (nonatomic, strong, readwrite)NSString *possessionName;
@property (nonatomic, strong, readwrite)NSString *serialNumber;
@property (nonatomic, readwrite)int valueInDollars;
@property (nonatomic, strong, readonly)NSDate *dateCreated;
@property (nonatomic, strong, readwrite)NSString *imageKey;

+ (id)randomPossession;
- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;
- (id)initWithPossessionName:(NSString *)name;

@end
