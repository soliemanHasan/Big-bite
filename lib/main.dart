import 'package:big_bite/core/routes/app_routes.dart';
import 'package:big_bite/core/services/app_info_service.dart';
import 'package:big_bite/core/services/cache_storage_services.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/themes/app_theme.dart';
import 'package:big_bite/core/translations/app_local.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/utils/print_log.dart';
import 'generated/codegen_loader.g.dart';

Future<void> initVariables() async {
  ServicesLocator().init();
//  await ApisUrls().initBaseUrl();
  await AppInfoService().initInfo();
  await CacheStorageServices.init();
  await CacheStorageServices().initCacheLanguage();
  await EasyLocalization.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initVariables();

  // set up easy_localization lib
  runApp(
    EasyLocalization(
      supportedLocales: AppLocale().supportedLocales,
      fallbackLocale: AppLocale().english,
      path: 'resources/langs',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    printLog("update Material app");
    printLog("Current Language: ${AppLocale().currentLanguage(context)}");
    printLog("Cache Language: ${AppLocale().currencyCacheLanguage()}");
    // return Sizer Builder
    return BlocProvider(
      create: (context) => sl<BasketBloc>(),
      child: ScreenUtilInit(
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              theme: AppTheme().lightTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Base project v2',
              routerConfig: AppRoutes.router,
            );
          },
        ),
      ),
    );
  }
}
