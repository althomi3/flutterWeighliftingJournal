import 'package:get/get.dart';


// DEFINITION
//This controller handles logic for calculating statistics
// Contains two methods
//    Method 1: calculates overall training volume across all exercises
//    Method 2: calculates training volume for each muscle group


class DashboardCardController {
  //define your function to calculate the volume here

  RxDouble volume = 0.0.obs;
  //RxDouble volumeChest = 0.0.obs;
  // compared to test example for one exercise type above, the RxMap holds a map of multiple volumes each per exercise type
  RxMap<String, RxDouble> volumeByExerciseType = <String, RxDouble>{
  'chest': 0.0.obs,
  'back': 0.0.obs,
  'legs': 0.0.obs,
  'compound': 0.0.obs,
  }.obs;



  double calculateVolume (RxList liftingsets) {
    //CALCULATE VOLUME
    // formula: volume = reps * volume

    // iterates over each element (form entry) in liftingsets and exracts reps variable
    // parses reps to int from String
    final repsList = liftingsets.map((e) => int.tryParse(e.reps) ?? 0).toList(); 
    //print('All reps: $repsList'); // reps: [0, 0, 0, 0, 0, 1]
    ////print(liftingsets);
    //reps++; // for quick testing if method works in case there is something wrong with getting reps from DB

    // Calculate Reps average
    int sumReps = repsList.reduce((a, b) => a + b);
    //print('Sum Reps: $sumReps');
    double avgReps = sumReps/repsList.length;
    //print('Avg reps: $avgReps');

    final weightList = liftingsets.map((e) => int.tryParse(e.weight) ?? 0).toList(); 
    int sumWeight = weightList.reduce((a, b) => a + b);
    double avgeWeight = sumWeight/weightList.length;
    volume.value = avgReps * avgeWeight;
    return volume.value;
  }


  double calculateVolumeForExercise(RxList liftingsets, String exerciseType) {

    // -- i -- for automatic calculation of volume, the method is called in formcontroler and in submit method of form itself
    // --> remember to update on changes

    //filters liftingsets by exercise name that is passed as param
    final filteredLiftingList = liftingsets.where((e) => e.exercise.toLowerCase() == exerciseType.toLowerCase()).toList();

    if (filteredLiftingList.isEmpty) {
      volumeByExerciseType[exerciseType] = 0.0.obs; // If no sets found for the exercise, set volume to 0
      return 0.0;
    }

    // conduct static calulcations for volume
    final repsList = filteredLiftingList.map((e) => int.tryParse(e.reps) ?? 0).toList();
    final weightList = filteredLiftingList.map((e) => int.tryParse(e.weight) ?? 0).toList();

    int sumReps = repsList.reduce((a, b) => a + b);
    double avgReps = sumReps / repsList.length;
    int sumWeight = weightList.reduce((a, b) => a + b);
    double avgWeight = sumWeight / weightList.length;
    double volumeForExercise = avgReps * avgWeight;

     // Store the volume for the exercise in the reactive map
    volumeByExerciseType[exerciseType] = volumeForExercise.obs;
    return volumeForExercise;
  }
}

  
