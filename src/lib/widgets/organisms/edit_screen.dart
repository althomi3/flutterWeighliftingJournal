import 'package:flutter/material.dart';
import 'layout.dart';
import '../molecules/form.dart';
import 'package:get/get.dart';
import '../../models/models.dart';
import '../../controllers/form_controller.dart';
import '../molecules/custom_card_small.dart';


class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formController = Get.find<FormController>();
    int editId = Get.parameters["id"] != null ? int.parse(Get.parameters["id"]!) : 0;
    
    
    final LiftingSet? updatedliftingset = formController.liftingsets.firstWhere((element) => element.id == editId.toString(), orElse: () => null); // gets entry with id from path

      if (updatedliftingset == null) {
        return Center(child: Text('Lifting Set not found.'));
      }

    return MainLayout(
      body: Center(
          //child: 
          child: Column(
            children: [
                Text('!Here goes your form to EDIT an entry! Current id ${editId}'),
                Text('EditScreen'),
                CardSmall(
                        editView: true, // triggers hiding the buttons on the card
                        title: Text('${updatedliftingset.exercise}') , 
                        paramLiftingset: Text('Set: ${updatedliftingset.liftingset}'), 
                        paramReps: Text('Reps: ${updatedliftingset.reps}'), 
                        paramWeight: Text('Weight (kg): ${updatedliftingset.weight}'), 
                        paramNotes: Text('Personal notes: ${updatedliftingset.notes}'),
                        onEdit: () => formController.updateLiftedSet(updatedliftingset),  // Navigate to edit screen
                        onDelete: () { 
                          formController.delete(updatedliftingset);  // Call delete function
                        },
                        buttonEditText: "No text needed as buttons are hidde, but param is required by widget",
                        buttonDeleteText: "No text needed as buttons are hidde, but param is required by widget",
                        ),
                   FormWidget(
                    isEditScreen: true,
                    liftingsetToEdit: updatedliftingset,
                    ),// takes lifting set that was identified via id from the dynamic path variable
            ],
      ),
    ),
    );
  }
}