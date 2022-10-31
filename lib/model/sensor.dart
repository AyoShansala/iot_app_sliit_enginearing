class Sensor {
  Sensor({
    required this.humidity,
  });

  Sensor.fromJson(Map<String, Object?> json)
      : this(
          humidity: json['humidity']! as double,
        );

  final double humidity;

  Map<String, Object?> toJson() {
    return {
      'humidity': humidity,
    };
  }
}
