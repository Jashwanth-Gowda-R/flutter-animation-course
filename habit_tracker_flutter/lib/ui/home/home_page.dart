import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TasksGridPage(
//       tasks: const [
//         TaskPreset(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
//         TaskPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
//         TaskPreset(name: 'Do Some Coding', iconName: AppAssets.html),
//         TaskPreset(name: 'Meditate', iconName: AppAssets.meditation),
//         TaskPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
//         TaskPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
//       ],
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataStore = HiveDataStore();
    return ValueListenableBuilder(
      valueListenable: dataStore.tasksListenable(),
      builder: (_, Box<Task> box, __) => TasksGridPage(
        tasks: box.values.toList(),
      ),
    );
  }
}
