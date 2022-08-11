import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int index;

  static const String _description ='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
      'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
      'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
      'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
      'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
      'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
      'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
      'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
      'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
      'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
      'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
      'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
      'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
      'vitae.\n'
      '\n'
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
      'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
      'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
      'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
      'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
      'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
      'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
      'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
      'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
      'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
      'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
      'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
      'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
      'vitae';


  const DetailsPage({
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('Details page'),
        ),

        body: ListView(
          children: <Widget>[
            Container(
                height: 300,
                child: Image.asset('images/teacher2.jpg', fit: BoxFit.cover,)
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mrs Lous',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.amberAccent,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Asst Professor', style: TextStyle(color: Colors.white,fontSize: 15),),
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
                  SizedBox(height: 10,),
                  Text(_description, style: TextStyle(color: Colors.blueGrey, fontSize: 8,),textAlign: TextAlign.justify,)
                ],
              ),
            ),
          ],
        ),
      );
}