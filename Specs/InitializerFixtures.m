#import "InitializerFixtures.h"

@implementation Truck
objection_register(Truck)
objection_initializer(truck:, @"Chevy")

+ (id)truck: (NSString *)name {
    Truck *truck = [[self alloc] init];
    truck.name = name;
    return truck;    
}
@end

@implementation BadInitializer
objection_register(BadInitializer)
objection_initializer(initWithNonExistentInitializer)
@end

@implementation ViewController
objection_register(ViewController)
objection_requires(@"car")
objection_initializer(initWithNibName:bundle:, @"MyNib")

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super init])) {
        self.nibName = nibNameOrNil;
        self.bundle = nibBundleOrNil;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    if ((self = [super init])) {
        self.name = name;
    }
    return self;
}
@end

@implementation ConfigurableCar
objection_register(ConfigurableCar)
objection_requires(@"engine")
objection_initializer_sel(@selector(initWithModel:horsePower:andYear:))

@synthesize car = _car;
@synthesize engine = _engine;

@synthesize horsePower = _horsePower;
@synthesize model = _model;
@synthesize year = _year;

- (id)initWithModel:(NSString *)model horsePower:(NSNumber *)horsePower andYear:(NSNumber *)year {
    if ((self = [super init])) {
        self.model = model;
        self.horsePower = horsePower;
        self.year = year;
    }
    return self;
}

@end

@implementation FilterInitInitializer
objection_initializer(init)

@end

@implementation PrimitiveConfigurableCar

objection_register(PrimitiveConfigurableCar)
objection_requires(@"engine")
objection_initializer(initWithModel:size:andYear:automatic:error:)

@synthesize car = _car;
@synthesize engine = _engine;

@synthesize model = _model;
@synthesize size = _size;
@synthesize year = _year;
@synthesize automatic = _automatic;

- (id)initWithModel:(NSString *)model size:(CGSize)size andYear:(NSUInteger)year automatic:(BOOL)automatic error:(NSError * __autoreleasing *)error {
    if ((self = [super init])) {
        self.model = model;
        self.size = size;
        self.year = year;
        self.automatic = automatic;
        *error = [NSError errorWithDomain:@"foo" code:1337 userInfo:nil];
    }
    return self;
}

@end
