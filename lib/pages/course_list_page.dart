import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/add_course_provider.dart';
class CourseListPage extends StatefulWidget {
  static const String routename='/courseslistpage';
  const CourseListPage({Key? key}) : super(key: key);

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Consumer<AddCourseProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.courselist2.length,
          itemBuilder: (context, index) {
            final courses = provider.courselist2[index];
            return Dismissible(
              key: ValueKey(courses.id),
              direction: DismissDirection.endToStart,
              confirmDismiss: _showConfirmationDialog,
              onDismissed: (direction) {
                provider.deleteCourse(courses.id!, courses.name);
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
                  title: Text(courses.name),
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
