//
//  MapCell.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import UIKit
import MapKit

class MapCell: UITableViewCell, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    private var artworks: [Artwork] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let initialLocation = CLLocation(latitude: 30.916045, longitude: 75.802193)
        let ldhCenter = CLLocation(latitude: 30.916045, longitude: 75.802193)
        let region = MKCoordinateRegion(
          center: ldhCenter.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 60000)
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        artworks.append(Artwork(
          title: "Kali Mata Mandir",
          locationName: "Rishi Nagar",
          discipline: "Ludhiana",
          coordinate: CLLocationCoordinate2D(latitude: 30.916045, longitude: 75.802193)))
        artworks.append(Artwork(
          title: "PAU",
          locationName: "Punjab Agriculture University",
          discipline: "Ludhiana",
          coordinate: CLLocationCoordinate2D(latitude: 30.917052, longitude: 75.794910)))
        artworks.append(Artwork(
          title: "D Block",
          locationName: "Hambra",
          discipline: "Ludhiana",
          coordinate: CLLocationCoordinate2D(latitude: 30.915984, longitude: 75.812656)))

        mapView.addAnnotations(artworks)
        
        
        let sourceLocation = CLLocationCoordinate2D(latitude: 30.916045, longitude: 75.802193)
        let destinationLocation = CLLocationCoordinate2D(latitude: 30.917052, longitude: 75.794910)
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        direction.calculate { (response, error) in
            guard let directionResponse = response else {
                if let error = error {
                    debugPrint("we have error getting direction \(error.localizedDescription)")
                }
                return
            }
            
            let route = directionResponse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            
        }
        
        self.mapView.delegate = self
        
        mapView.centerToLocation(initialLocation)
        
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.green
        renderer.lineWidth = 2.0
        return renderer
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}


class Artwork: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return locationName
  }
}
