import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/controllers/auth/signin_controller.dart';
import 'package:my_demo/core/constants/app_color.dart';
import 'package:my_demo/view/screens/auth/widgets/check_email_dialog.dart';
import 'package:my_demo/view/screens/auth/widgets/custom_auth_card.dart';
import 'package:my_demo/view/screens/auth/widgets/my_dialog.dart';
import 'package:my_demo/view/screens/auth/widgets/social_auth.dart';
import 'package:my_demo/get_pages.dart';
import '../../../core/constants/constants.dart';
import '../../../core/localization/localization.dart';
import '../../../core/shared/app_id.dart';
import '../../../core/shared/big_button.dart';
import '../../../core/shared/the_input_field.dart';
import 'widgets/dont_have_account.dart';
import 'widgets/or_row.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInControllerImp signInControllerImp = Get.put(SignInControllerImp());

    ///
    GlobalKey<FormState> signinKey = new GlobalKey<FormState>();

    //
    Key signinEmailKey = new Key('');
    Key signinPasswordKey = new Key('');
    return CustomAuthCard(
      authFealds: Form(
        key: signinKey,
        child: Column(
          children: [
            AppId(),
            const SizedBox(
              height: 20,
            ),
            TheInputField(
              // email input field
              theValidator: (text) {
                text = signInControllerImp.signinEmailTextController.text;
                if (text.length < 6) {
                  return AppLocal.emailIsTooShourt.tr + '\n';
                }
                if (text.length > 50) {
                  return AppLocal.emailIsTooLong.tr + '\n';
                }
                return null;
              },
              theKey: signinEmailKey,
              theTextEditingController:
                  signInControllerImp.signinEmailTextController,
              theInputType: TextInputType.text,
              theHient: AppLocal.email.tr,
              theLeadingIcon: Icons.email_outlined,
              isPassword: false,
            ),
            emptySpace,
            TheInputField(
              // password input field
              theValidator: (text) {
                text = signInControllerImp.signinPasswordTextController.text;

                if (text.length < 6) {
                  return AppLocal.passwordIsTooShourt.tr + '\n';
                }
                if (text.length > 25) {
                  return AppLocal.passwordIsTooLong.tr + '\n';
                }
                return null;
              },
              theKey: signinPasswordKey,
              theTextEditingController:
                  signInControllerImp.signinPasswordTextController,
              theInputType: TextInputType.text,
              theHient: AppLocal.password.tr,
              theLeadingIcon: Icons.password_outlined,
              isPassword: true,
            ),
            emptySpace,
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: BigggButton(
                // signin button
                onTaped: () async {
                  bool test = signinKey.currentState!.validate();

                  if (test) {
                    // authController.signIn();
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email:
                            signInControllerImp.signinEmailTextController.text,
                        password: signInControllerImp
                            .signinPasswordTextController.text,
                      );
                      // print(credential);

                      if (credential.user!.emailVerified == false) {
                        // await FirebaseAuth.instance.setLanguageCode(
                        //   locallizationsController.emailVerLang(),
                        // );
                        // await credential.user!.sendEmailVerification();
                        // User? user = FirebaseAuth.instance.currentUser;
                        // await user!.sendEmailVerification();

                        checkYourEmailDialog();
                        print('email not vervied ============');
                      } else {
                        Get.offAllNamed(
                          AppRoute.homePage,
                        );

                        print('email is vervied ============');
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');

                        myDialog(
                          context,
                          'error ',
                          Icons.email,
                          'no user found for that email',
                          'dismiss',
                          'confirm',
                          () {},
                          () {},
                        );
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }
                },
                theButtonTitle: AppLocal.signIn.tr,
                theLeadingIcon: Icons.login_rounded,
              ),

              // child: MaterialButton(
              //     child: Text('tab me'),
              //     onPressed: () {
              //       () => Get.to(MyHomePage());
              //     }),
            ),
            emptySpace,
            OrRow(),
            emptySpace,
            SocialAuthRow(),
            emptySpace,
            DontHaveAccount(
              doYouHaveAccoun: AppLocal.dontHaveAccountYet.tr,
              signOrLogin: AppLocal.signUpNow.tr,
              theFunc: () {
                signInControllerImp.goToSignUp();
              },
            ),
            Center(
              child: GestureDetector(
                  onTap: () {
                    signInControllerImp.signIn();
                  },
                  child: Text(
                    'signIn for debuging',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColor.kPrimaryColor,
                        ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
