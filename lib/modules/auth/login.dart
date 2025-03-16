import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/modules/home/dashboard.dart';
import 'package:myproduct/widgets/components/MyTextField.dart';
import 'package:myproduct/widgets/components/myButton.dart';
import 'package:myproduct/widgets/components/myText.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  bool isObsecured = true;
  String? errorMessage = '';
  String email = "";
  String password = "";
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerpassword = TextEditingController();

  var isEmpty = false;
  final _formKey = GlobalKey<FormState>();

  GetNotifiedOfError(String error, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  @override
  void initState() {
    super.initState();
  }

  var onFocus = true;
  double height = 250.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/logo.png"),
                //     fit: BoxFit.cover),
                color: state.selected.primary_1,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? 30
                                    : 10),
                            // height: MediaQuery.of(context).viewInsets.bottom == 0
                            //     ? size.height * 0.30
                            //     : size.height * 0.15,
                            child: Center(
                                child: Image(
                              height: size.height * 0.2,
                              image: const AssetImage(
                                'assets/png/white-logo.png',
                              ),
                            )),
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "Hi Parents",
                                    tcolor: state.selected.white,
                                    fw: FontWeight.w500,
                                    tsize: 30,
                                  ),
                                  5.verticalSpace,
                                  MyText(
                                    text: "Sign in to continue",
                                    tcolor: state.selected.white,
                                    fw: FontWeight.w200,
                                    tsize: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    MyTextField(
                                        labelText: "Enrollment ID",
                                        hintText: '',
                                        controller: _controllerEmail,
                                        funcOnChangeAction: (v) {},
                                        funcOnIsObsecured: () {}),
                                    // _textField(
                                    //     'Email', _controllerEmail, false),
                                    20.verticalSpace,
                                    MyTextField(
                                        ispassword: true,
                                        isObsecured: isObsecured,
                                        suffix: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isObsecured = !isObsecured;
                                              });
                                            },
                                            child: Icon(
                                              isObsecured
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility,
                                              color: state.selected.grey,
                                            )),
                                        labelText: "Password",
                                        hintText: '',
                                        controller: _controllerpassword,
                                        funcOnChangeAction: (v) {},
                                        funcOnIsObsecured: () {}),

                                    50.verticalSpace,
                                    MyButton(
                                        fixedPosition: true,
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: state.selected.white,
                                        ),
                                        bgcolor: state.selected.primary_1,
                                        disable: false,
                                        isLoading: false,
                                        text: "SIGN IN",
                                        ontap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const MyDashboard();
                                          }));
                                        }),
                                    10.verticalSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MyText(text: "Forgot Password?")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
