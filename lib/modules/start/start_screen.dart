import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/paths/images_paths.dart';
import 'package:big_bite/generated/locale_keys.g.dart';
import 'package:big_bite/modules/auth/presentation/routes/login_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300.h,
            ),
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset(
                ImagesPaths.logo,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Text(
              LocaleKeys.theEasiestWayToOrder.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              LocaleKeys.noLinesNoWaiting.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                height: 50.h,
                label: LocaleKeys.letsGo.tr(),
                onTap: () => context.go(LoginRoute.name),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
