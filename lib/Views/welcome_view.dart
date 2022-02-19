import 'package:flutter/material.dart';
import 'package:state_mgmt_cdgct/Utils/extensions/context_ext.dart';
import 'package:state_mgmt_cdgct/Views/sign_up_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final double fbImgWidth = 30;

  Widget _btn(
      {required String text,
      required VoidCallback onpresed,
      Widget? trailing,
      Color? color}) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xff05bbc9), Color(0xff2f739b)])),
        child: ElevatedButton(
            onPressed: onpresed,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => color ??= Colors.transparent),
                shape: MaterialStateProperty.resolveWith((states) =>
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.only(left: trailing != null ? fbImgWidth : 0),
                  child: Text(text),
                ),
                const Spacer(),
                trailing ??= Container(),
              ],
            )),
      ),
    );
  }

  Widget _contentsContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Ready to Travel",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Sign up with facebook for the most fulfilling trip planning experience with us!",
        ),
        const SizedBox(
          height: 20,
        ),
        _btn(
            text: "Log in with Facebook",
            trailing: Image.asset(
              "assets/images/facebook.png",
              width: fbImgWidth,
            ),
            color: const Color(0xff1663d6),
            onpresed: () {
              context.next(const SignUpView());
            }),
        const SizedBox(
          height: 10,
        ),
        _btn(
            text: "Log in with email address",
            color: const Color(0xff1663d6),
            onpresed: () {
              context.next(const SignUpView());
            }),
        const SizedBox(
          height: 10,
        ),
        _btn(
            text: "Create a new account",
            onpresed: () {
              context.next(const SignUpView());
            }),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/welcome.png"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/clouds.png",
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: _contentsContainer(),
            ),
          ),
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.clear),
          )),
        ],
      ),
    );
  }
}
