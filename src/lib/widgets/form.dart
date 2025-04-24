import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';



class Set {

  final String exercise;
  final String set;
  final String reps;
  final String weight;
  final String notes;

  Set(this.exercise, this.set, this.reps, this.weight, this.notes);


  Map toJson() => {
        'exercise': exercise,
        'set': set,
        'reps': reps,
        'weight': weight,
        'notes': notes,
      };

  factory Set.fromJson(Map json) {
    return Set(json['exercise'], json['set'], json['reps'], json['weight'], json['notes']);
  }
}

class FormController{
  final storage = Hive.box("storage");

  RxList sets;

  FormController() : sets = [].obs {
    if (storage.get('sets') == null) {
      storage.put('sets', []); // initializes set list with empty array
    }

    sets.value = storage
        .get('sets')
        .map(
          (set) => Set.fromJson(set),
        )
        .toList();
  }

  void _save() {
    storage.put(
      'sets',
      sets.map((set) => set.toJson()).toList(),
    );
  }

  void add(Set set) {
    sets.add(set);
    _save();
  }

  get size => sets.length;


}


class FormWidget extends StatelessWidget {
  final  _formKey = GlobalKey<FormBuilderState>();
  final taskController = Get.find<FormController>(); // initializes FormController
  


  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      Set set = Set(
        _formKey.currentState!.value['exercise'] ?? "No exercise specified",
        _formKey.currentState!.value['set'] ?? "0",
        _formKey.currentState!.value['reps'] ?? "0",
         _formKey.currentState!.value['weight'] ?? "No weight specified",
        _formKey.currentState!.value['notes'] ?? "None for this set",
      );

      taskController.add(set);
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

class FormListWidget extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => formController.size == 0
          ? Text('No sets')
          : Column(
              children: formController.sets
                  .map(
                    (set) => Text(set.exercise),
                  )
                  .toList(),
            ),
    );
  }
}