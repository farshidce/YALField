// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseValidator.h"
#import "YALBaseErrorsProvider.h"

@implementation YALBaseValidator

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        self.shouldReturnError = YES;
    }
    return self;
}

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"Must override method (%@) in subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

#pragma mark - Private

- (__unsafe_unretained Class<YALErrorsProvider>)errorsProvider {
    Class<YALErrorsProvider> errorsProvider;
    Class probableErrorsProvider = NSClassFromString(self.errorsProviderClassName);
    
    if (self.errorsProviderClassName &&
        probableErrorsProvider &&
        [probableErrorsProvider conformsToProtocol:@protocol(YALErrorsProvider)])
    {
        errorsProvider = probableErrorsProvider;
    } else {
        errorsProvider = [YALBaseErrorsProvider class];
    }
    
    return errorsProvider;
}

- (NSError *)error {
    NSError *error;
    
    if (self.shouldReturnError) {
        error = [[self errorsProvider] errorForValidator:self];
    }
    
    return error;
}

@end
