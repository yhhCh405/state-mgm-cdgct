import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:state_mgmt_cdgct/Utils/extensions/context_ext.dart';
import 'package:state_mgmt_cdgct/Views/sign_up_mixin.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with SignUpMixin {
  double infoContHeight = 110;
  final TextEditingController _dobCtrl = TextEditingController();
  final GlobalKey _infoBoxKey = GlobalKey();

  void calHeaderHeight() {
    RenderBox rb = _infoBoxKey.currentContext!.findRenderObject() as RenderBox;
    infoContHeight = rb.size.height;
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      calHeaderHeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unFocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
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
                      Form(
                        key: fkey,
                        child: Container(
                          margin: EdgeInsets.only(top: infoContHeight),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "First Name *",
                                  ),
                                ),
                                validator: validateFirstName,
                                onSaved: saveFirstName,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Last Name *"),
                                ),
                                validator: validateLastName,
                                onSaved: saveLastName,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Email Address *"),
                                ),
                                validator: validateEmail,
                                onSaved: saveEmail,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _dobCtrl,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          suffixIconConstraints:
                                              const BoxConstraints(
                                                  maxWidth: 35),
                                          suffixIcon: Image.asset(
                                            "assets/images/dob.png",
                                          ),
                                          label: const Text("Date of Birth *"),
                                          hintText: "DD/MM/YYY"),
                                      onTap: () async {
                                        DateTime? picketDt =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime(1990),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now());
                                        if (picketDt != null) {
                                          _dobCtrl.text =
                                              "${picketDt.day.toString().padLeft(2, "0")}/${picketDt.month.toString().padLeft(2, "0")}/${picketDt.year.toString().padLeft(2, "0")}";
                                        }
                                      },
                                      validator: validateDOB,
                                      onSaved: saveDOB,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child:
                                          CustomSlidingSegmentedControl<String>(
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
                                          border: Border.all(
                                              color: const Color(0xff2f739b)),
                                        ),

                                        children: {
                                          "female": Text(
                                            "Female",
                                            style: TextStyle(
                                              fontWeight:
                                                  selectedGender == "female"
                                                      ? FontWeight.bold
                                                      : null,
                                            ),
                                          ),
                                          "male": Text(
                                            "Male",
                                            style: TextStyle(
                                              fontWeight:
                                                  selectedGender == "male"
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
                                decoration: const InputDecoration(
                                    label: Text("Nationality *")),
                                validator: validateNationality,
                                onSaved: saveNationality,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text("Country of Residense *")),
                                validator: validateCOR,
                                onSaved: saveCOR,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text("Email Address *")),
                                validator: validateEmail,
                                onSaved: saveEmail,
                              ),
                              InternationalPhoneNumberInput(
                                  selectorConfig: const SelectorConfig(
                                      showFlags: false,
                                      setSelectorButtonAsPrefixIcon: true,
                                      selectorType:
                                          PhoneInputSelectorType.BOTTOM_SHEET),
                                  validator: validateMobile,
                                  autoValidateMode: AutovalidateMode.always,
                                  inputDecoration: const InputDecoration(
                                      label: Text("Mobile no. (Optional)")),
                                  onInputChanged: onPhoneInputChanged),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        key: _infoBoxKey,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Almost there!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                          "Complete the form below to create your Ready To Travel account."),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "*Mandatory",
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: infoContHeight,
                                  width: 80,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: 80,
                                      height: 85,
                                      child: OverflowBox(
                                        alignment: Alignment.topCenter,
                                        minWidth: 80,
                                        minHeight: 150,
                                        maxWidth: 80,
                                        maxHeight: 150,
                                        child: Image.asset(
                                          "assets/images/guitar.png",
                                          width: 150,
                                          height: 150,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                        onPressed: onSubmit,
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Text("Create my account now"),
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
