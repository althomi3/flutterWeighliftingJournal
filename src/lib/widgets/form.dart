import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';



class LiftingSet {

  final String exercise;
  final String liftingset;
  final String reps;
  final String weight;
  final String notes;

  LiftingSet(this.exercise, this.liftingset, this.reps, this.weight, this.notes);


  Map toJson() => {
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
  }

  void _save() {
    storage.put(
      'sets',
      liftingsets.map((liftingset) => liftingset.toJson()).toList(),
    );
  }

  void add(LiftingSet liftingset) {
    liftingsets.add(liftingset);
    _save();
  }

  get size => liftingsets.length;


}


class FormWidget extends StatelessWidget {
  final  _formKey = GlobalKey<FormBuilderState>();
  final taskController = Get.find<FormController>(); // initializes FormController
  


  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      LiftingSet liftingset = LiftingSet(
        _formKey.currentState!.value['exercise'] ?? "No exercise specified",
        _formKey.currentState!.value['set'] ?? "0",
        _formKey.currentState!.value['reps'] ?? "0",
         _formKey.currentState!.value['weight'] ?? "No weight specified",
        _formKey.currentState!.value['notes'] ?? "None for this set",
      );

      taskController.add(liftingset);
      _formKey.currentState?.reset(); // resets form after submission
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
          
          FloatingActionButton(
            onPressed: _submit,
            child: Text('Submit Set'),
          )

        ],
      ),
    );
  }
}

