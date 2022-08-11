import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/provider/add_batch_provider.dart';
import 'package:student_attendance/provider/student_regi_provider.dart';
class StudentsListPage extends StatefulWidget {
  static const String routename='/student_list_page';
  const StudentsListPage({Key? key}) : super(key: key);

  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  late AddStudentProvider stprovider;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    stprovider=Provider.of<AddStudentProvider>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body:  Consumer<AddStudentProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.studentlist.length,
          itemBuilder: (context, index) {
            final students = provider.studentlist[index];
            return Dismissible(
              key: ValueKey(students.id),
              direction: DismissDirection.endToStart,
              confirmDismiss: _showConfirmationDialog,
              onDismissed: (direction) {
                provider.deleteStudent(students.id!);
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
                title: Text(students.name),
                subtitle: Text(students.course!),
                trailing: Text(students.batch!)
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
          title: const Text('Delete Contact'),
          content: const Text('Are you sure to delete this contact?'),
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
