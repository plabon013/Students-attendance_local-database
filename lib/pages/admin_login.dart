
import 'package:flutter/material.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routename='/adminlogin';

  @override
  State<LoginPage> createState() => _LoginPageState();
}
late  Size size;
bool isObsecure = true;
class _LoginPageState extends State<LoginPage> {
  final adminusernameController= TextEditingController();
  final passwordController= TextEditingController();
  final String adminname='user01';
  final String adpass='user01';
  bool isObscure=true;

  @override
  void dispose() {
    // TODO: implement dispose
    adminusernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Login As Admin'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 5,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * .2,
            child: Container(
              height: size.height * .5,
              width: size.width * .9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(.3),
                    spreadRadius: 10,
                    blurRadius: 15,
                    offset: Offset(0, 7),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.blueGrey.shade900,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 16.0),
                    child: TextField(
                      controller: adminusernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        prefixIcon: Icon(Icons.person),
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0.0,16.0, 20.0),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isObsecure,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 12,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                                isObsecure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                          )),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        // Navigator.pushNamed(context, AdminDashboard.routeName);
                        if(adminusernameController.text==adminname  && passwordController.text==adpass){
                          Navigator.pushNamed(context, AdminDashboard.routeName);
                        };

                      },
                      child: Text('Login'))
                ],
              ),
            ),
          ),

        ],

      ),
    );

  }
}
