import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:social_connect_app/core/routes/app_router.gr.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:social_connect_app/features/authentication/presentation/widgets/verify_otp_button.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage(
      {super.key, required this.phoneNumber, required this.verificationId});

  final String phoneNumber, verificationId;

  @override
  State<OtpPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OtpPage> {
  final TextEditingController pinController = TextEditingController();
  String? otpCode;

  final TextStyle _textStyle = Fonts.alata(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    color: ColorPallete.blackColor,
  );

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorPallete.whiteColor,
        title: Text(
          "OTP Verification",
          style: Fonts.alata(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: ColorPallete.blackColor,
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          switch (state) {
            case SuccessAuthenticatingUser():
              print("came to success State");
              print(state.user.uid);
              if (state.navigateToHome) {
                context.router.replaceAll([const HomeRoute()]);
              } else {
                context.router.replaceAll(
                  [
                    UserInformationRoute(
                        phoneNumber: widget.phoneNumber, uid: state.user.uid),
                  ],
                );
              }
              break;
            case ErrorAuthenticatingUser():
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Invalid Otp!"),
                ),
              );
            default:
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Text(
                textAlign: TextAlign.center,
                'We have sent a verification code to ${widget.phoneNumber}',
                style: _textStyle,
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Fonts.alata(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorPallete.blackColor),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2,
                      color: ColorPallete.blackColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onCompleted: (value) {
                  print('Completed $value');
                  setState(() {
                    otpCode = value;
                  });
                },
              ),
              const Expanded(flex: 1, child: SizedBox()),
              // Row(
              //   children: [
              //     Text(
              //       "Didn't recieve otp? ",
              //       style: _textStyle,
              //     ),
              //   ],
              // ),
              // const Expanded(flex: 1, child: SizedBox()),
              
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    switch (state) {
                      case LoadingAuthState():
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: ColorPallete.blueColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: const CircularProgressIndicator(),
                        );
                      case SuccessAuthenticatingUser():
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: ColorPallete.blueColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: const CircularProgressIndicator(),
                        );
                      case ErrorAuthenticatingUser():
                        return CustomButton(
                            otpCode: otpCode,
                            verificationId: widget.verificationId);
                      default:
                        return CustomButton(
                            otpCode: otpCode,
                            verificationId: widget.verificationId);
                    }
                  },
                ),
              ),

              const Expanded(flex: 20, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
