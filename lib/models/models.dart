class LiftingSet {
  final String id;
  final String exercise;
  final String liftingset;
  final String reps;
  final String weight;
  final String notes;

  LiftingSet(
    this.id,
    this.exercise,
    this.liftingset,
    this.reps,
    this.weight,
    this.notes,
  );

  // helps with debugging and understanding structure of liftingset
  // just set print(liftingset) somewhere else in code where you want to inspect the instance of LiftingSet you created
  // example: [LiftingSet(id: 21, reps: 0, weight: No weight specified, exercise: No exercise specified), LiftingSet(id: 23, reps: 0,
  @override // overrides the default toString method
  String toString() {
    return 'LiftingSet(id: $id, reps: $reps, weight: $weight, exercise: $exercise)';
  }

  Map toJson() => {
    'id': id,
    'exercise': exercise,
    'set': liftingset,
    'reps': reps,
    'weight': weight,
    'notes': notes,
  };

  /*factory Set.fromJson(Map json) {
    return Set(json['exercise'], json['set'], json['reps'], json['weight'], json['notes']);
  }*/

  // this helps parsing the data in the expected format. when running the app in the browser,
  // the code snippet above is sufficient as the data is serialized and parsed differently in the browser
  // in the local mac runtime, there were issues with how the OS unpacked the JSON data
  factory LiftingSet.fromJson(Map json) {
    return LiftingSet(
      json['id']?.toString() ?? '',
      json['exercise']?.toString() ?? '',
      json['set']?.toString() ?? '',
      json['reps']?.toString() ?? '',
      json['weight']?.toString() ?? '',
      json['notes']?.toString() ?? '',
    );
  }
}
