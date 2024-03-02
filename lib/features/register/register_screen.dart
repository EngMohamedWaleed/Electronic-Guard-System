import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/widgets/button.dart';
import '../../core/widgets/square.dart';
import '../../core/widgets/text_field.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';



class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  // sign user in method
  void signUserUp(context) {

   if(confirmPasswordController.text !=passwordController.text){
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
       backgroundColor: Colors.red.shade900,
       content: Text("Invalid Confirm Password"),
     ));
   }else{
     if(_formKey.currentState!.validate()){
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ,));

     }
   }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:_formKey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  MyTextField(

                    controller: phoneController,
                    hintText: 'Phone',
                    obscureText: false,keyboardType: TextInputType.phone,
                    inputFormatters:  <TextInputFormatter>[
                  // for below version 2 use this
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly

            ],
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
 MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),




                  const SizedBox(height: 10),

                  // forgot password?


                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: () {
                      signUserUp(context);
                    },
                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // google button
                      SquareTile(imagePath: 'assets/images/google.png'),

                      SizedBox(width: 25),

                      // apple button
                      SquareTile(imagePath: 'assets/images/apple.png')
                    ],
                  ),

                  const SizedBox(height: 50),
                  InkWell
                    (
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage() ,));
                    },
                    child:

                       Container(
                         width: MediaQuery.of(context).size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'have an account?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Login now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
