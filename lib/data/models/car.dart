class Car {
  final String? model;
  final double? distance;
  final double? fuelCapacity;
  final double? pricePerHour;

  Car({this.model, this.distance, this.fuelCapacity, this.pricePerHour});

  factory Car.fromJson(Map<String, dynamic>? json) {
    return Car(
      model: json!['model'],
      distance: json['distance'],
      fuelCapacity: json['fuelCapacity'],
      pricePerHour: json['pricePerHour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': this.model,
      'distance': this.distance,
      'fuelCapacity': this.fuelCapacity,
      'pricePerHour': this.pricePerHour,
    };
  }
}
