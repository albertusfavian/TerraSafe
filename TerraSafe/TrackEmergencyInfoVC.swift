//
//  TrackEmergencyInfoVC.swift
//  TerraSafe
//
//  Created by Rony Fhebrian on 09/06/21.
//

import UIKit
import MapboxMaps
import Turf
import DrawerView

class TrackEmergencyInfoVC: UIViewController {
    internal var mapView: MapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAndCenterMap()
        
        // Set GeoJSON
        mapView.mapboxMap.onNext(.mapLoaded) { _ in
            self.addTerrain()
            self.setUpGeoJSON()
        }
        
        initDrawerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideTabBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        showTabBar()
    }
    
    func initDrawerView() {
        let drawerView = DrawerView()
        drawerView.attachTo(view: self.view)
        drawerView.backgroundColor = .white
        drawerView.backgroundEffect = .none
        drawerView.snapPositions = [.collapsed, .partiallyOpen, .open, .closed]
        drawerView.insetAdjustmentBehavior = .automatic
        drawerView.clipsToBounds = true
        drawerView.alpha = 1
        
        let drawerVc: DrawerVC = self.storyboard!.instantiateViewController(identifier: "DrawerVC") as! DrawerVC
        drawerVc.view.frame = drawerView.frame
        drawerVc.view.backgroundColor = .none
        
        drawerView.addSubview(drawerVc.view)
    }
    
    func initAndCenterMap() {
        let accessToken = "sk.eyJ1Ijoicm9ueWZoZWJyaWFuIiwiYSI6ImNrcGZpb3lrMDIxbHIycGxsdnV3aWgyMmMifQ.rOTrlXaNZnmayRKptNjlcA"
        ResourceOptionsManager.default.resourceOptions.accessToken = accessToken
        let centerCoordinate = CLLocationCoordinate2D(latitude: -7.3193251, longitude: 107.726672)
        
        let camera = CameraOptions(center: centerCoordinate,
                                   zoom: 13.1,
                                   bearing: 80,
                                   pitch: 80)
        
        let options = MapInitOptions(
            cameraOptions: camera,
            styleURI: StyleURI(rawValue: "mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y")!)
        
        mapView = MapView(frame: view.bounds, mapInitOptions: options)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.ornaments.options.scaleBar.visibility = .visible
        view.addSubview(mapView)
    }
    
    func hideTabBar() {
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    func showTabBar() {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    
    internal func decodeGeoJSON(from fileName: String) throws -> FeatureCollection? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            preconditionFailure("File not found")
        }
        
        let filePath = URL(fileURLWithPath: path)
        
        var featureCollection: FeatureCollection?
        
        do {
            let data = try Data(contentsOf: filePath)
            featureCollection = try GeoJSON.parse(FeatureCollection.self, from: data)
        } catch {
            print(error)
        }
        
        return featureCollection
    }
    
    func setUpGeoJSON() {
        guard let featureCollection = try? decodeGeoJSON(from: "g1t1") else { return }
        
        let geoJSONDataIdentifier = "g1t1"
        
        // Create GeoJSON data source
        var geoJSONSource = GeoJSONSource()
        geoJSONSource.data = .featureCollection(featureCollection)
        
        var circleLayer = CircleLayer(id: "circle-layer")
        circleLayer.filter = Exp(.eq) {
            "$type"
            "Point"
        }
        
        for f in featureCollection.features {
            if (f.geometry.type.rawValue == "Point") {
                guard let property = f.properties else { return }
                if let value = f.geometry.value {
                    print(value)
                    
//                    let point = Point.where(latitude: value.latitude, longitude: value.longitude)
                }
                
//                print(property)
                
//                self.mapView.annotations.makePointAnnotationManager()
//                var p = PointAnnotation(point: .init(.init(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)))
            }
        }
        
        circleLayer.source = geoJSONDataIdentifier
        circleLayer.circleColor = .constant(ColorRepresentable(color: UIColor.yellow))
        circleLayer.circleOpacity = .constant(0.6)
        circleLayer.circleRadius = .constant(8.0)
        
        var lineLayer = LineLayer(id: "line-layer")
        lineLayer.filter = Exp(.eq) {
            "$type"
            "LineString"
        }
        lineLayer.source = geoJSONDataIdentifier
        lineLayer.lineColor = .constant(ColorRepresentable(color: UIColor.red))
        lineLayer.lineWidth = .constant(2)
        
        // Add the source and style layers to the map style.
        try! mapView.mapboxMap.style.addSource(geoJSONSource, id: geoJSONDataIdentifier)
        try! mapView.mapboxMap.style.addLayer(lineLayer)
        try! mapView.mapboxMap.style.addLayer(circleLayer)
    }
    
    func addTerrain() {
        var demSource = RasterDemSource()
        demSource.url = "mapbox://mapbox.mapbox-terrain-dem-v1"
        demSource.tileSize = 512
        demSource.maxzoom = 14.0
        try! mapView.mapboxMap.style.addSource(demSource, id: "mapbox-dem")

        var terrain = Terrain(sourceId: "mapbox-dem")
        terrain.exaggeration = .constant(1.5)

        try! mapView.mapboxMap.style.setTerrain(terrain)

        var skyLayer = SkyLayer(id: "sky-layer")
        skyLayer.skyType = .constant(.atmosphere)
        skyLayer.skyAtmosphereSun = .constant([0.0, 0.0])
        skyLayer.skyAtmosphereSunIntensity = .constant(15.0)

        try! mapView.mapboxMap.style.addLayer(skyLayer)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
