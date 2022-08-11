
import 'package:flutter/material.dart';

class StudentDetailsPage extends StatelessWidget {
  final int index;
  static const String routeName = '/student_details_page';

  const StudentDetailsPage({
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('Student Details page'),
        ),

        body: ListView(
          children: <Widget>[
            Container(
                height: 300,
                child: Image.asset('images/student2.jpg', fit: BoxFit.cover,)
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sazzad',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.amberAccent,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Student', style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Text('Email : lous@gmail.com', style: TextStyle(color: Colors.grey,fontSize: 12),),
                  SizedBox(height: 5,),
                  Text('Phone Number : 000-111-222-333', style: TextStyle(color: Colors.grey.shade600,fontSize: 10),),
                  SizedBox(height: 10,),
                  Container(
                    width: 300,
                    height: 1,
                    color: Colors.grey.shade700.withOpacity(.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}