import 'package:flutter/material.dart';
import 'package:to_do/Screens/display_todo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool issignup = false;
  bool issignin = true;
  Color signupcolor = Colors.blue;
  Color signincolor = Colors.deepPurple;
  void switchSignUp() {
    issignin = false;
    issignup = true;
    signupcolor = Colors.deepPurple;
    signincolor = Colors.blue;
  }

  void switchSignIn() {
    issignin = true;
    issignup = false;
    signincolor = Colors.deepPurple;
    signupcolor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    Widget? screentype;
    if (issignup) {
      screentype = const SignUp();
    } else if (issignin) {
      screentype = const SignIn();
    }

    return Scaffold(
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor:Theme.of(context).appBarTheme.backgroundColor
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  // const BorderRadius.only(
                  // //     bottomLeft: Radius.circular(40),
                  // //     bottomRight: Radius.circular(40)
                  // ),
                  child: Image.asset(
                      'assets/images/undraw_secure_login_pdn4.png')),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSignIn();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => signincolor)
                              //shape: MaterialStateProperty.all(const CircleBorder(side: BorderSide.none,eccentricity: 0.7))
                              ),
                          child:  Text('Sign in',
                              style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              switchSignUp();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => signupcolor)

                              //shape: MaterialStateProperty.all(const CircleBorder(side: BorderSide.none,eccentricity: 0.7))
                              ),
                          child:  Text('Sign Up',style: Theme.of(context).textTheme.titleMedium,),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    screentype!,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

void switchScreen(BuildContext context)
{
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const ToDoDisplay()));
}

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  

  @override
  Widget build(BuildContext context) {


    
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            decoration:  InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 300),
              hintText: "Email",hintStyle:  Theme.of(context).textTheme.titleMedium,
              prefixIcon: const Icon(Icons.person_2_outlined),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            obscureText: true,
            decoration:  InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 300),
              suffixIcon: const Icon(Icons.remove_red_eye_outlined,),
              hintText: "Password",
              hintStyle:  Theme.of(context).textTheme.titleMedium,
              prefixIcon: const Icon(Icons.lock_clock_outlined),
              border: InputBorder.none,
            ),
          ),
        ),
        TextButton.icon(
            onPressed: () {
              switchScreen(context);
            },
            icon: const Icon(
              Icons.login_sharp,
              color: Colors.deepPurple,
            ),
            label: const Text(
              'Login',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Passward?',
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration:  InputDecoration(
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 120,
                    ),
                    hintText: 'First Name',
                    hintStyle:  Theme.of(context).textTheme.titleMedium,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12)
                    //  prefixIcon: Icon(Icons.lock_clock_outlined),
                    ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration:  InputDecoration(
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 120,
                    ),
                    hintText: 'Last Name',
                    hintStyle:  Theme.of(context).textTheme.titleMedium,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12)
                    //  prefixIcon: Icon(Icons.lock_clock_outlined),
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration:  InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 300),
              hintText: "Mobile No",
              hintStyle:  Theme.of(context).textTheme.titleMedium,
              prefixIcon: const Icon(Icons.person_2_outlined),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            decoration:  InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 300),
              hintText: "Email",
              hintStyle:  Theme.of(context).textTheme.titleMedium,
              prefixIcon: const Icon(Icons.email_outlined),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            decoration:  InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 300),
              suffixIcon: const Icon(Icons.remove_red_eye_outlined),
              hintText: "Password",
              hintStyle:  Theme.of(context).textTheme.titleMedium,
              prefixIcon: const Icon(Icons.lock_clock_outlined),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
          onPressed: () {
            switchScreen(context);
          },
          icon: const Icon(Icons.account_box_rounded),
          label:  Text('Register',style: Theme.of(context).textTheme.bodyMedium,),
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.deepPurple)),
        )
      ],
    );
  }
}
