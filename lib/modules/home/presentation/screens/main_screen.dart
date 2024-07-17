import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/paths/svgs_paths.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/generated/locale_keys.g.dart';
import 'package:big_bite/modules/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:big_bite/modules/home/presentation/screens/home_screen.dart';
import 'package:big_bite/modules/menu/presentation/blocs/category_menu_bloc.dart';
import 'package:big_bite/modules/menu/presentation/screens/category_menu_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(const FetchNewsEvent()),
        ),
        BlocProvider(
          create: (context) => sl<CategoryMenuBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? null
            : AppBar(
                title: Text(_appBarTitles[_selectedIndex]),
              ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.navigationIconBarColor,
          selectedItemColor: AppColors.primary,
          elevation: 0.1,
          type: BottomNavigationBarType.fixed,
          items: _items,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  /* ----------------------------- title in appBar ---------------------------- */
  static final List<String> _appBarTitles = [
    LocaleKeys.home.tr(),
    LocaleKeys.menu.tr(),
    LocaleKeys.offers.tr(),
    LocaleKeys.profile.tr(),
  ];
/* --------------------------------- Screens -------------------------------- */
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryMenuScreen(),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
    ),
  ];
  /* ------------------------- BottomNavigationBarItem ------------------------ */
  static final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        SvgsPaths.homeActive,
      ),
      icon: SvgPicture.asset(
        SvgsPaths.home,
      ),
      label: LocaleKeys.home.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        SvgsPaths.menuActive,
      ),
      icon: SvgPicture.asset(
        SvgsPaths.menu,
      ),
      label: LocaleKeys.menu.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        SvgsPaths.offersActive,
      ),
      icon: SvgPicture.asset(
        SvgsPaths.offer,
      ),
      label: LocaleKeys.offers.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        SvgsPaths.profileActive,
      ),
      icon: SvgPicture.asset(
        SvgsPaths.profile,
      ),
      label: LocaleKeys.profile.tr(),
    ),
  ];
}
