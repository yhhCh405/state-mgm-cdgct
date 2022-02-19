import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_mgmt_cdgct/Utils/extensions/context_ext.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String selectedGender = "female";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unFocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      context.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Almost there!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Complete the form below to create your Ready To Travel account."),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "*Mandatory",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: OverflowBox(
                          maxWidth: 100,
                          maxHeight: 100,
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              "assets/images/guitar.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text(
                            "First Name *",
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(label: Text("Last Name *")),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(label: Text("Email Address *")),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    suffixIconConstraints:
                                        BoxConstraints(maxWidth: 35),
                                    suffixIcon: Image.asset(
                                      "assets/images/dob.png",
                                    ),
                                    label: Text("Date of Birth *"),
                                    hintText: "DD/MM/YYY"),
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime(1990),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now());
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: CustomSlidingSegmentedControl<String>(
                                  fixedWidth: (context.width / 4) - 20,
                                  // initialValue: selectedGender,
                                  onValueChanged: (value) {
                                    if (mounted && value != null) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    }
                                  },
                                  radius: 100,

                                  thumbDecoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff2f739b)),
                                  ),

                                  children: {
                                    "female": Text(
                                      "Female",
                                      style: TextStyle(
                                        fontWeight: selectedGender == "female"
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                    "male": Text(
                                      "Male",
                                      style: TextStyle(
                                        fontWeight: selectedGender == "male"
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(label: Text("Nationality *")),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("Country of Residense *")),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(label: Text("Email Address *")),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("Mobile no. (Optional)")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Color(0xff05bbc9), Color(0xff2f739b)])),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text("Create my account now"),
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
