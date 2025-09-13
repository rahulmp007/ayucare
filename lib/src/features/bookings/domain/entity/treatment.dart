class Treatment {
  final int? id;
  final int treatmentId;
  final String treatmentName;
  final String male;
  final String female;

  Treatment({
    required this.id,
    required this.treatmentId,
    required this.treatmentName,
    required this.male,
    required this.female,
  });

  @override
  String toString() {
    return 'Treatment(id: $id, treatmentId: $treatmentId, treatmentName: $treatmentName, male: $male, female: $female)';
  }
}
