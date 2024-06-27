import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/authentication/presentation/bloc/auth_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.verificationId, this.otpCode});

  final String verificationId;
  final String? otpCode;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                          onPressed: () {
                            print(otpCode);
                            if (otpCode != null) {
                              context.read<AuthBloc>().add(
                                    OnVerifyOtpButtonClickedEvent(
                                        verificationId: verificationId,
                                        otp: otpCode!,
                                        context: context),
                                  );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Enter 6-digit number'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.blueColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            'Verify Otp',
                            style: Fonts.alata(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: ColorPallete.whiteColor,
                            ),
                          ),
                        );
  }
}
