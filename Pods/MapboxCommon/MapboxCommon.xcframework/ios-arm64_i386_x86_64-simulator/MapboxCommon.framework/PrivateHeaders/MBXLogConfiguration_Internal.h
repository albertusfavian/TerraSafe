// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxCommon/MBXLoggingLevel_Internal.h>

@protocol MBXLogWriterBackend;

NS_SWIFT_NAME(LogConfiguration)
__attribute__((visibility ("default")))
@interface MBXLogConfiguration : NSObject

- (nonnull instancetype)init;

- (void)registerLogWriterBackendForLogWriter:(nonnull id<MBXLogWriterBackend>)logWriter;
- (nonnull id<MBXLogWriterBackend>)getLogWriterBackend __attribute((ns_returns_retained));
- (void)setFilterLevelForLevel:(MBXLoggingLevel)level;
- (MBXLoggingLevel)getFilterLevel;
+ (nonnull MBXLogConfiguration *)getInstance __attribute((ns_returns_retained));

@end
