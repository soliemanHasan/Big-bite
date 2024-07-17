import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/core_component/show_snack_bar.dart';
import 'package:big_bite/core/enums/request_status.dart';
import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/generated/locale_keys.g.dart';
import 'package:big_bite/modules/auth/domain/entities/user_entity.dart';
import 'package:big_bite/modules/auth/presentation/routes/login_route.dart';
import 'package:big_bite/modules/auth/presentation/routes/verify_route.dart';
import 'package:big_bite/modules/auth/presentation/screens/verify_screen.dart';
import 'package:big_bite/modules/home/presentation/routes/main_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_validator.dart';
import '../blocs/register/register_bloc.dart';
import '../components/auth_text_form_fields.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneNumberController =
      TextEditingController(text: "0936064038");

  final TextEditingController passwordController =
      TextEditingController(text: "Ss.12345");

  final TextEditingController conformationPasswordController =
      TextEditingController(text: "Ss.12345");

  final TextEditingController nameController =
      TextEditingController(text: "hasan");

  final TextEditingController lastNameController =
      TextEditingController(text: "sarem");

  final TextEditingController addressController =
      TextEditingController(text: "almadamea");
  final TextEditingController otherAddressController =
      TextEditingController(text: "maze");

  final PageController pageController = PageController(initialPage: 0);

  final formKey = GlobalKey<FormState>();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // provided a bloc
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      // listen to bloc state changes
      child: BlocListener<RegisterBloc, BaseState<String>>(
        listener: _registerListener,
        // build screen by bloc builder
        child: BlocBuilder<RegisterBloc, BaseState<String>>(
          builder: (context, state) {
            ///
            /// ... your screen
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    if (currentPage == 0) {
                      context.pop();
                    } else {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.linear);
                      setState(() {
                        currentPage--;
                      });
                    }
                  },
                ),
              ),
              body: Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  children: [
                    SizedBox(
                      height: 400,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
/* ----------------------- first name and seconde name ---------------------- */
                          CustomPageView(
                              secondeAuthTextFormFiled: AuthTextFormField(
                                  controller: lastNameController,
                                  hint: LocaleKeys.enterLastName.tr(),
                                  validator: AppValidator.nameValidator,
                                  keyboardType: TextInputType.name),
                              authTextFormFiled: AuthTextFormField(
                                controller: nameController,
                                hint: LocaleKeys.enterFirstName.tr(),
                                validator: AppValidator.nameValidator,
                                keyboardType: TextInputType.name,
                              ),
                              label: "Enter your first name and last name"),
                          /* ---------------------------- phone and address --------------------------- */
                          CustomPageView(
                              secondeAuthTextFormFiled: AuthTextFormField(
                                controller: addressController,
                                hint: LocaleKeys.address.tr(),
                                validator: AppValidator.nameValidator,
                                keyboardType: TextInputType.phone,
                              ),
                              authTextFormFiled: AuthTextFormField(
                                controller: phoneNumberController,
                                hint: LocaleKeys.phoneNumber.tr(),
                                validator: AppValidator.phoneValidator,
                                keyboardType: TextInputType.phone,
                              ),
                              thirdAuthTextFormFiled: AuthTextFormField(
                                controller: otherAddressController,
                                hint: LocaleKeys.otherAddress.tr(),
                                validator: AppValidator.nameValidator,
                                keyboardType: TextInputType.streetAddress,
                              ),
                              label:
                                  "Enter your phone number and your address"),
                          /* ---------------------- password and conform password --------------------- */
                          CustomPageView(
                              secondeAuthTextFormFiled: Column(
                                children: [
                                  AuthTextFormField(
                                    controller: conformationPasswordController,
                                    hint: LocaleKeys.password.tr(),
                                    validator: (value) =>
                                        AppValidator.conformPasswordValidator(
                                            passwordController.text, value),
                                    keyboardType: TextInputType.name,
                                    isPass: true,
                                  ),
                                ],
                              ),
                              authTextFormFiled: AuthTextFormField(
                                controller: passwordController,
                                hint: LocaleKeys.password.tr(),
                                validator: AppValidator.passwordValidator,
                                keyboardType: TextInputType.name,
                                isPass: true,
                              ),
                              label: "Enter your password"),
                        ],
                      ),
                    ),
                    /* ------------------------ register and next button ------------------------ */
                    SizedBox(
                      height: 210.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppButton(
                        height: 50.h,
                        label: currentPage != 2
                            ? LocaleKeys.next.tr()
                            : LocaleKeys.register.tr(),
                        onTap: () {
                          if (currentPage != 2 &&
                              formKey.currentState!.validate()) {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 1),
                                curve: Curves.linear);
                            setState(() {
                              currentPage++;
                            });
                          } else {
                            _registerPressed(context, state);
                          }
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    /* ----------------------- navigate to register screen ---------------------- */
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.doNotHaveAnAccount.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          TextButton(
                            onPressed: () => context.pushNamed(LoginRoute.name),
                            child: Text(
                              LocaleKeys.login.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // loading
                    state.requestStatus == RequestStatus.loading
                        ? const LoadingComponent()
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _handlingNumber() {
    String phone = phoneNumberController.text.trim();
    String phone1 = phone.substring(1);
    return "+963$phone1";
  }

  void _registerPressed(BuildContext context, BaseState<String> state) {
    if (!(formKey.currentState!.validate()) || state.isLoading) return;
    context.read<RegisterBloc>().add(
          RegisterButtonTappedEvent(
              name: nameController.text,
              lastName: lastNameController.text,
              confirmPassword: conformationPasswordController.text,
              address: addressController.text,
              otherAddress: otherAddressController.text,
              password: passwordController.text,
              phoneNumber: _handlingNumber()),
        );
  }

  void _registerListener(BuildContext context, BaseState<String> state) {
    if (state.isError) showSnackBar(context, state.errorMessage);

    if (state.isSuccess) {
      context.pushNamed(VerifyRoute.name, pathParameters: {
        "number": _handlingNumber(),
      });
      showSnackBar(context, LocaleKeys.registerSuccessfully.tr());
    }
  }
}

class CustomPageView extends StatelessWidget {
  final String label;
  final Widget authTextFormFiled;
  final Widget? secondeAuthTextFormFiled;
  final Widget? thirdAuthTextFormFiled;

  const CustomPageView(
      {super.key,
      required this.authTextFormFiled,
      required this.label,
      this.thirdAuthTextFormFiled,
      this.secondeAuthTextFormFiled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20.h,
          ),
          authTextFormFiled,
          SizedBox(
            height: 20.h,
          ),
          secondeAuthTextFormFiled!,
          SizedBox(
            height: 20.h,
          ),
          thirdAuthTextFormFiled == null
              ? const SizedBox()
              : thirdAuthTextFormFiled!,
        ],
      ),
    );
  }
}
