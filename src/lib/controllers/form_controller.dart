import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/models.dart';
import '../controllers/dashboard_controller.dart';

class FormController {
  final dashboardCardController =
      Get.find<
        DashboardCardController
      >(); // initializes DashboardController which contains function to calculate statistics
  final storage = Hive.box("storage");

  RxList liftingsets;
  int counter = 0;

  FormController() : liftingsets = [].obs {
    if (storage.get('sets') == null) {
      storage.put('sets', []); // initializes set list with empty array
    }

    liftingsets.value =
        storage
            .get('sets')
            .map((liftingset) => LiftingSet.fromJson(liftingset))
            .toList();
    counter = storage.get(
      'counter',
      defaultValue: 0,
    ); // gets counter from Hive for persistence between app starts

    // Auto calculate volume on app start
    dashboardCardController.calculateVolume(liftingsets);
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'compound');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'chest');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'leg');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'back');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'arms');
  }

  void _save() {
    storage.put(
      'sets',
      liftingsets.map((liftingset) => liftingset.toJson()).toList(),
    );
  }

  // counter allows to generate an entry id which is added on each form submit
  void _incrementCounter() {
    counter++;
    storage.put('counter', counter); // Save the updated counter
  }

  void add(LiftingSet liftingset) {
    liftingsets.add(liftingset);
    _incrementCounter();
    _save();
  }

  void delete(LiftingSet liftingset) {
    liftingsets.remove(liftingset);
    liftingsets.refresh();
    _save();
  }

  void updateLiftedSet(LiftingSet updatedLiftingset) {
    // Find the LiftingSet in the list by matching the id
    int index = liftingsets.indexWhere(
      (liftingSet) => liftingSet.id == updatedLiftingset.id,
    );

    if (index != -1) {
      // If found, update the relevant fields
      liftingsets[index] = updatedLiftingset;
      liftingsets.refresh(); // Refresh the RxList
      _save(); // Save updated list to Hive
    }
  }

  get size => liftingsets.length;
}
