class DatabaseClass {
  final String assembly;
  final String region;

  DatabaseClass({required this.assembly, required this.region});

  // Convert a Region object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'assembly': assembly,
      'region': region,
    };
  }

  // Convert a Map object into a Region object
  factory DatabaseClass.fromMap(Map<String, dynamic> map) {
    return DatabaseClass(
      assembly: map['assembly'],
      region: map['region'],
    );
  }

  // Convert the object to a string
  @override
  String toString() {
    return 'MyObject{assembly: $assembly, region: $region}';
  }
}