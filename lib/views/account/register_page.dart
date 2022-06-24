import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountdaki_flutter/config.dart';
import 'package:mountdaki_flutter/models/account/register_request_model.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          child: Form(
            child: _registerUi(context),
            key: globalFormKey,
          ),
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUi(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: 20,
              bottom: 30,
            ),
            child: Text(
              'Daftar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'name',
              'Nama',
              (onValidatedVal) {
                if (onValidatedVal.isEmpty && onValidatedVal == null) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
              (onSavedVal) {
                name = onSavedVal;
              },
              prefixIcon: const Icon(Icons.person),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              borderFocusColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'email',
              'Email',
              (onValidatedVal) {
                if (onValidatedVal.isEmpty && onValidatedVal == null) {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
              (onSavedVal) {
                email = onSavedVal;
              },
              prefixIcon: const Icon(Icons.email),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              borderFocusColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'password',
              'Password',
              (onValidatedVal) {
                if (onValidatedVal.isEmpty && onValidatedVal == null) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
              (onSavedVal) {
                password = onSavedVal;
              },
              prefixIcon: const Icon(Icons.key),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              borderFocusColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              'Daftar',
              () {
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(
                    name: name!,
                    email: email!,
                    password: password!,
                  );

                  ApiService.register(model).then((response) {
                    setState(() {
                      isApiCallProcess = false;
                    });

                    if (response.data != null) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        'Pendaftaran berhasil, silahkan login!',
                        'OK',
                        () {
                          Navigator.pushNamed(context, '/');
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        response.message,
                        'OK',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  });
                }
              },
              btnColor: Colors.blueAccent,
              borderColor: Colors.white,
              txtColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Sudah punya akun? '),
                  TextSpan(
                    text: 'masuk disini',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/login');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
