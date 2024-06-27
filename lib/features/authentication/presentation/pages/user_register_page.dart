import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/authentication/presentation/bloc/auth_bloc.dart';

@RoutePage()
class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  final TextStyle _textFieldTextStyle = Fonts.alata(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ColorPallete.blackColor,
  );

  @override
  void dispose() {
    super.dispose();
    _phoneNumberTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPallete.whiteColor,
      appBar: AppBar(
        title: Text(
          'Awk-wardly',
          style: Fonts.alata(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: ColorPallete.blackColor,
          ),
        ),
        backgroundColor: ColorPallete.whiteColor,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Center(
              child: Image.asset(
                'assets/images/register_user.png',
                height: 220,
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Text(
              "Register",
              style: Fonts.alata(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: ColorPallete.blackColor,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                // textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                cursorColor: ColorPallete.blackColor,
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return "Invalid Phone Number!";
                  }
                  return null;
                },
                style: _textFieldTextStyle,
                controller: _phoneNumberTextEditingController,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                            moveAlongWithKeyboard: true,
                            context: context,
                            // ** Here you can add countryList theme
                            countryListTheme: CountryListThemeData(
                              //Here you can set the height of the bottom sheet
                              bottomSheetHeight:
                                  MediaQuery.sizeOf(context).height / 2,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Text(
                          '${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}'),
                    ),
                  ),
                  suffixIcon: const Icon(Icons.phone),
                  enabled: true,
                  counterText: "",
                  errorStyle: Fonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: ColorPallete.redColor,
                  ),
                  hintText: "Phone Number",
                  hintStyle: _textFieldTextStyle,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPallete.blackColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            SizedBox(
              width: double.infinity,
              // child:
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       print(
              //           '+91${_phoneNumberTextEditingController.text.toString()}');
              //       context.read<AuthBloc>().add(
              //             OnGetOtpButtonClickedEvent(
              //                 phoneNumber:
              //                     '+${selectedCountry.phoneCode}${_phoneNumberTextEditingController.text.trim()}',
              //                 context: context),
              //           );
              //     }
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: ColorPallete.blueColor,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(16),
              //       ),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //     child: Text(
              //       "Get OTP",
              //       style: Fonts.alata(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: ColorPallete.whiteColor,
              //       ),
              //     ),
              //   ),
              // ),
              child:
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                switch (state) {
                  case LoadingAuthState():
                    // return ElevatedButton(
                    //   onPressed: null,
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: ColorPallete.blueColor,
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(16),
                    //       ),
                    //     ),
                    //   ),
                    // child:
                    // )
                    return const CircularProgressIndicator();

                  case ErrorAuthenticatingUser():
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(
                              '+91${_phoneNumberTextEditingController.text.toString()}');
                          context.read<AuthBloc>().add(
                                OnGetOtpButtonClickedEvent(
                                    phoneNumber:
                                        '+${selectedCountry.phoneCode}${_phoneNumberTextEditingController.text.trim()}',
                                    context: context),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.blueColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Get OTP",
                          style: Fonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorPallete.whiteColor,
                          ),
                        ),
                      ),
                    );

                  default:
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(
                              '+91${_phoneNumberTextEditingController.text.toString()}');
                          context.read<AuthBloc>().add(
                                OnGetOtpButtonClickedEvent(
                                    phoneNumber:
                                        '+${selectedCountry.phoneCode}${_phoneNumberTextEditingController.text.trim()}',
                                    context: context),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.blueColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Get OTP",
                          style: Fonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorPallete.whiteColor,
                          ),
                        ),
                      ),
                    );
                }
              }),
            ),
            const Expanded(flex: 10, child: SizedBox()),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Already a user? Login",
            //     style: Fonts.alata(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w300,
            //         color: ColorPallete.orangeColor),
            //   ),
            // ),
            // const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
