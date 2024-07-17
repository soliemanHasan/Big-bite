import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/core_component/show_snack_bar.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/paths/svgs_paths.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/modules/auth/presentation/blocs/verify/verify_bloc.dart';
import 'package:big_bite/modules/auth/presentation/blocs/verify/verify_state.dart';
import 'package:big_bite/modules/home/presentation/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

class VerifyScreen extends StatelessWidget {
  final String number;
  VerifyScreen({super.key, required this.number});
  String verifyCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => sl<VerifyBloc>(),
        child: BlocConsumer<VerifyBloc, VerifyState>(
            listener: _verifyListener,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Center(
                      child: SvgPicture.asset(SvgsPaths.sendOtp),
                    ),
                    Text(
                      "Check your messeges",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          "we send otp to this number $number",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    Text(
                      "enter code ",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    OtpTextField(
                      numberOfFields: 6,

                      focusedBorderColor: AppColors.primary,

                      showFieldAsBox: false,
                      borderWidth: 4.0,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here if necessary
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        verifyCode = verificationCode;
                      },
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppButton(
                        isLoading: state is VerifyLoadingState,
                        height: 50.h,
                        label: "submit",
                        onTap: () => _submitTapped(context, state),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          context
                              .read<VerifyBloc>()
                              .add(ResendCodeButtonTapedEvent(number));
                        },
                        child: Text("resend code")),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void _submitTapped(BuildContext context, VerifyState state) {
    context
        .read<VerifyBloc>()
        .add(VerifyButtonTapedEvent(number: number, otp: verifyCode));
  }

  void _verifyListener(BuildContext context, VerifyState state) {
    if (state is VerifyErrorState) {
      return showSnackBar(context, state.message);
    } else if (state is VerifySuccessState) {
      showSnackBar(context, "success");
      context.go(MainRoute.name);
    } else if (state is ResendCodeErrorState) {
      return showSnackBar(context, state.message);
    } else if (state is ResendCodeSuccessState) {
      showSnackBar(context, "sended successfully");
    }
  }
}
