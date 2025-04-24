import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'add_elevated_button.dart';



class LiftingSet {
  final String id;
  final String exercise;
  final String liftingset;
  final String reps;
  final String weight;
  final String notes;

  LiftingSet(this.id, this.exercise, this.liftingset, this.reps, this.weight, this.notes);


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

class FormController{
  final storage = Hive.box("storage");

  RxList liftingsets;
  int counter = 0;

  FormController() : liftingsets = [].obs {
    if (storage.get('sets') == null) {
      storage.put('sets', []); // initializes set list with empty array
    }

    liftingsets.value = storage
        .get('sets')
        .map(
          (liftingset) => LiftingSet.fromJson(liftingset),
        )
        .toList();
    counter = storage.get('counter', defaultValue: 0); // gets counter from Hive for persistence between app starts
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
    storage.put('counter', counter);  // Save the updated counter
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
  int index = liftingsets.indexWhere((liftingSet) => liftingSet.id == updatedLiftingset.id);
  
  if (index != -1) {
    // If found, update the relevant fields
    liftingsets[index] = updatedLiftingset;
    liftingsets.refresh(); // Refresh the RxList
    _save(); // Save updated list to Hive
  }
}
  get size => liftingsets.length;
}


class FormWidget extends StatelessWidget {
  final  _formKey = GlobalKey<FormBuilderState>();
  final formController = Get.find<FormController>(); // initializes FormController
  bool isEditScreen; // sets bool var which is later used to control different content in the form depending on whether the user is in EditScreen or ViewScreen
  final LiftingSet? liftingsetToEdit; // initializes data set, used to retrieve specific data set in EditScreen vs list of entries in ViewScreen

  FormWidget({
    super.key, 
    required this.isEditScreen,
    required this.liftingsetToEdit,
    });

 _submit() {
  if (_formKey.currentState!.saveAndValidate()) {
    // Create a new LiftingSet with form values
    LiftingSet liftingset = LiftingSet(
      liftingsetToEdit?.id ?? formController.counter.toString(),
      _formKey.currentState!.value['exercise'] ?? "No exercise specified",
      _formKey.currentState!.value['set'] ?? "0",
      _formKey.currentState!.value['reps'] ?? "0",
      _formKey.currentState!.value['weight'] ?? "No weight specified",
      _formKey.currentState!.value['notes'] ?? "None for this set",
    );

    if (isEditScreen && liftingsetToEdit != null) {
      // Update the existing LiftingSet if we're on EditScreen
      formController.updateLiftedSet(liftingset);
       // Go back to the previous screen
    } else {
      // If not in EditScreen, add a new LiftingSet
      formController.add(liftingset);
    }

    _formKey.currentState?.reset(); // Reset the form after submission
    Get.back();
  }
}



  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderDropdown(
            name: "exercise", 
            items: const [
                  DropdownMenuItem(value: 'compound', child: Text('Compound')),
                  DropdownMenuItem(value: 'chest', child: Text('Chest')),
                  DropdownMenuItem(value: 'back', child: Text('Back')),
                  DropdownMenuItem(value: 'leg', child: Text('Leg')),
                ],
            hint: Text('Select your exercise'),
            decoration: InputDecoration(
              labelText: 'Exercise',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderDropdown(
            name: "set", 
            items: const [
                  DropdownMenuItem(value: "1", child: Text('1')),
                ],
            hint: Text('Select current set'),
            decoration: InputDecoration(
              labelText: 'Set',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderDropdown(
            name: "reps", 
            items: const [
                  DropdownMenuItem(value: "1", child: Text('1')),
                ],
            hint: Text('Select current set'),
            decoration: InputDecoration(
              labelText: 'Reps',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderTextField(
            name: 'weight',
            decoration: InputDecoration(
              labelText: 'Weight',
              hintText: 'Enter your weight in kg, e.g., 3',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderTextField(
            name: 'notes',
            decoration: InputDecoration(
              labelText: 'Personal notes',
              hintText: 'How was your set? Enter personal training notes.',
              border: OutlineInputBorder(),
            ),
          ),
          
          CustomElevatedButton(
            onSubmit: _submit, 
            content: isEditScreen ? Text('Update Set') : Text('Submit Set'),
          ),
          /*CustomElevatedButton(
            onPressed: _submit,
            child: Text('Submit Set'),
          )*/

        ],
      ),
    );
  }
}

