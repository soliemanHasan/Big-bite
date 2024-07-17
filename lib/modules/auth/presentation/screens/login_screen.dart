import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/show_snack_bar.dart';
import 'package:big_bite/generated/locale_keys.g.dart';
import 'package:big_bite/modules/auth/presentation/routes/register_route.dart';
import 'package:big_bite/modules/home/presentation/routes/main_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/utils/base_state.dart';
import '../../domain/entities/user_entity.dart';
import '../blocs/login/login_bloc.dart';
import '../components/auth_text_form_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneNumberController =
      TextEditingController(text: "1234567890");
  final TextEditingController passwordController =
      TextEditingController(text: "123456789");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // provided a bloc
    return BlocProvider(
        create: (context) => sl<LoginBloc>(),
        // listen to bloc state changes
        child: BlocListener<LoginBloc, BaseState<UserEntity>>(
          listener: _loginListener,
          // build screen by bloc builder
          child: Scaffold(
            appBar: AppBar(),
            body: BlocBuilder<LoginBloc, BaseState<UserEntity>>(
              builder: (context, state) {
                ///
                /// ... your screen
                return Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      children: [
                        // Header
                        Text(
                          LocaleKeys.welcomeBack.tr(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          LocaleKeys.enterYouDataToContinue.tr(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),

                        // phone number
                        SizedBox(height: 50.h),
                        /* ------------------------- phone number textfield ------------------------- */
                        AuthTextFormField(
                          controller: phoneNumberController,
                          hint: LocaleKeys.enterYourPhoneNumber.tr(),
                          validator: AppValidator.phoneValidator,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        /* --------------------------- password TextField --------------------------- */
                        AuthTextFormField(
                          controller: passwordController,
                          hint: LocaleKeys.enterPassword.tr(),
                          validator: AppValidator.passwordValidator,
                          keyboardType: TextInputType.visiblePassword,
                          isPass: true,
                        ),
                        SizedBox(height: 326.h),

                        // button
                        /* -------------------------------- login button ------------------------------- */
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppButton(
                            isLoading: state.isLoading,
                            height: 50.h,
                            label: LocaleKeys.login.tr(),
                            onTap: () => _loginPressed(context, state),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        /* ----------------------- navigate to register screen ---------------------- */
                        Row(
                          children: [
                            Text(
                              LocaleKeys.doNotHaveAnAccount.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.pushNamed(RegisterRoute.name),
                              child: Text(
                                LocaleKeys.register.tr(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),

                        // loading
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }

  /* --------------------------- login pressed logic -------------------------- */
  void _loginPressed(BuildContext context, BaseState<UserEntity> state) {
    if (!AppValidator().checkValidateFormsKeys(forms: [formKey])) return;

    context.read<LoginBloc>().add(
          LoginButtonTappedEvent(
            password: passwordController.text,
            phoneNumber: phoneNumberController.text,
          ),
        );
  }

  /* -------------------------------- listener -------------------------------- */
  void _loginListener(BuildContext context, BaseState<UserEntity> state) {
    if (state.isError) showSnackBar(context, state.errorMessage);

    if (state.isSuccess) {
      context.go(MainRoute.name);
      showSnackBar(context, LocaleKeys.loginDone.tr());
    }
  }
}
