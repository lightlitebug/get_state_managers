import '../controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final _fKey = GlobalKey<FormState>();
  final SignupController signupController = Get.put(SignupController());

  void _submit() {
    signupController.autovalidateMode.value = AutovalidateMode.always;
    if (_fKey.currentState.validate()) {
      _fKey.currentState.save();
      signupController.signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Obx(() {
          return Form(
            key: _fKey,
            autovalidateMode: signupController.autovalidateMode.value,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (val) {
                    signupController.email = val;
                  },
                  validator: (val) {
                    if (val.trim().isEmpty) {
                      return 'Email required';
                    }
                    if (!val.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ValueBuilder<bool>(
                  initialValue: true,
                  builder: (obscured, updateFn) => TextFormField(
                    obscureText: obscured,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      border: OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          updateFn(!obscured);
                        },
                        child: obscured
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    onChanged: (val) {
                      signupController.password = val;
                    },
                    onSaved: (val) {
                      signupController.password = val;
                    },
                    validator: (val) {
                      if (val.trim().isEmpty) {
                        return 'Password required';
                      }
                      if (val.trim().length < 6) {
                        return 'Password too short';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                ObxValue(
                  (obscured) {
                    return TextFormField(
                      obscureText: obscured.value,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        filled: true,
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscured.value = !obscured.value;
                          },
                          child: obscured.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      onSaved: (val) {
                        signupController.passwordConfirmation = val;
                      },
                      validator: (val) {
                        if (val != signupController.password) {
                          return 'Password not match';
                        }
                        return null;
                      },
                    );
                  },
                  true.obs,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submit,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Obx(
                      () => signupController.loading.value
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text(
                              'SIGN UP',
                              style: TextStyle(fontSize: 20.0),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
