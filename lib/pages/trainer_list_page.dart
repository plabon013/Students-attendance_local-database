import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/provider/teacherregi_provider.dart';
class TrainerListPage extends StatefulWidget {
  static const String routename='trainer_list_page';
  const TrainerListPage({Key? key}) : super(key: key);

  @override
  State<TrainerListPage> createState() => _TrainerListPageState();
}

class _TrainerListPageState extends State<TrainerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainers'),
      ),
      body: Consumer<AddTeacherProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.teacherlist.length,
          itemBuilder: (context, index) {
            final teachers = provider.teacherlist[index];
            return Dismissible(
              key: ValueKey(teachers.id),
              direction: DismissDirection.endToStart,
              confirmDismiss: _showConfirmationDialog,
              onDismissed: (direction) {
                provider.deleteTrainer(teachers.id!);
              },
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                  onTap: () {},
                  title: Text(teachers.name!),
                  subtitle: Text(teachers.course!),
                  trailing: Text(teachers.batch!)
              ),
            );
          },
        ),
      ),
    );
  }
  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Remove Teacher'),
          content: const Text('Are you sure to delete this Teacher?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('YES'),
            ),
          ],
        ));
  }
}
