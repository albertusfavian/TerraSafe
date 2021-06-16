import Foundation
#if canImport(MapboxMapsFoundation)
import MapboxMapsFoundation
#endif
import CoreLocation

/// A struct to configure a `LocationManager`
public struct LocationOptions: Equatable {

    /// Specifies the minimum distance (measured in meters) a device must move horizontally
    /// before a location update is generated.

    /// The default value of this property is `kCLDistanceFilterNone`.
    public var distanceFilter: CLLocationDistance = kCLDistanceFilterNone

    /// Specifies the accuracy of the location data.
    /// The default value is `kCLLocationAccuracyBest`.
    public var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest

    /// Sets the type of user activity associated with the location updates.
    /// The default value is `other`.
    public var activityType: CLActivityType = .other

    /// Sets the type of puck that should be used
    public var puckType: PuckType?

    public init() {}

}
