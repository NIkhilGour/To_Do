import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class WelocmeScreen extends StatelessWidget {
  const WelocmeScreen({super.key});

  void toLoginScreen(BuildContext context)
  {
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const LoginScreen()));
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 29, 12, 57),
            Color.fromARGB(255, 51, 27, 92),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                child: Image.asset(
                  'assets/images/hey.png',
                )),
            // const SizedBox(
            //   height: 10,
            // ),
            Image.asset(
              'assets/images/welcome.png',
              color: Colors.white,
              height: 250,
              width: 250,
            ),

            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              style:  const ButtonStyle(
                
                backgroundColor:MaterialStatePropertyAll(Colors.pink)
              ),
                onPressed: ()
                {
                      toLoginScreen(context);
                } ,
                icon: const Icon(
                  Icons.handshake,
                  color: Colors.white,
                  size: 30,
                ),
                label:  Text(
                  'Connect',
                  style: 
                    Theme.of(context).textTheme.bodyMedium,
                  
                ))
          ],
        ),
      ),
    );
  }
}
