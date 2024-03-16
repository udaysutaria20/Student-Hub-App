import 'package:flutter/material.dart';

import '../Home_Page/home_page.dart';

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 152, 237),
        title: const Text(
          'OTP Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 40,
                    height: 40,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < 5) {
                            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                          } else {
                            // Implement action when last OTP box is filled
                          }
                        } else {
                          if (index > 0) {
                            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                          } else {
                            // Implement action when first OTP box is empty
                          }
                        }
                      },
                      focusNode: _focusNodes[index],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Redirect to home page after successful login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Corrected line
                  );
                },
                child: Text('signup',style: TextStyle(color: Colors.blue),),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TextButton(
                  //   onPressed: () {
                  //     // Redirect to sign-up page
                  //   },
                  //   // child: Text(
                  //   //   'New user? Sign up',
                  //   //   style: TextStyle(
                  //   //     color: Colors.red,
                  //   //   ),
                  //   // ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
