import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qurani_tukufu/common/constants/routes.dart';
import 'package:qurani_tukufu/common/event/event_bus_mixin.dart';
import 'package:qurani_tukufu/common/utils/navigator_utils.dart';
import 'package:qurani_tukufu/configs/language_config.dart';
import 'package:qurani_tukufu/modules/auth/screens/forgot_password_screen.dart';
import 'package:qurani_tukufu/modules/auth/screens/signup_screen.dart';
import 'package:qurani_tukufu/modules/ayah/screens/ayah_detail_screen.dart';
import 'package:qurani_tukufu/modules/book/screens/book_screen.dart';
import 'package:qurani_tukufu/modules/book/screens/chapter_detail_screen.dart';
import 'package:qurani_tukufu/modules/book/screens/chapter_screen.dart';
import 'package:qurani_tukufu/modules/common/bloc/app_cubit.dart';
import 'package:qurani_tukufu/modules/common/screens/webview_screen.dart';
import 'package:qurani_tukufu/modules/home/screens/home_screen.dart';
import 'package:qurani_tukufu/modules/juzu/screens/juzu_detail_screen.dart';
import 'package:qurani_tukufu/modules/juzu/screens/juzu_screen.dart';
import 'package:qurani_tukufu/modules/language/screens/language_screen.dart';
import 'package:qurani_tukufu/modules/my_profile/screens/change_password_screen.dart';
import 'package:qurani_tukufu/modules/my_profile/screens/update_profile_screen.dart';

import '../common/theme/index.dart';
import '../di/injection.dart';
import '../generated/l10n.dart';
import '../modules/auth/screens/login_screen.dart';
import 'auth/bloc/auth_cubit.dart';
import 'ayah/screens/ayahs_screen.dart';
import 'ayah/screens/search_ayahs_screen.dart';
import 'common/screens/sync_screen.dart';
import 'contact_us_screen.dart';
import 'my_profile/screens/my_profile_screen.dart';
import 'my_profile/screens/my_profile_settings_screen.dart';

class App extends StatefulWidget with EventBusMixin {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          lazy: false,
          create: (_) => getIt<AuthCubit>()..init(),
        ),
        BlocProvider<AppCubit>(
          create: (_) => getIt<AppCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale(LanguageConfig.kDefaultLanguageCode),
        localizationsDelegates: const [
          S.delegate,
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        themeMode: ThemeMode.light,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        initialRoute: kMainRoute,
        navigatorKey: NavigatorUtils.instance.navigatorKey,
        routes: {
          kMainRoute: (context) => const HomeScreen(),
          kSyncRoute: (context) => const SyncScreen(),
          kLoginRoute: (context) => const LoginScreen(),
          kSignUpRoute: (context) => const SignUpScreen(),
          kForgotPasswordRoute: (context) => const ForgotPasswordScreen(),
          kWebViewRoute: (context) => const WebViewScreen(),
          kChangePasswordRoute: (context) => const ChangePasswordScreen(),
          kSettingsRoute: (context) => const SettingsScreen(),
          kEditProfileRoute: (context) => const EditProfileScreen(),
          kMyProfileRoute: (context) => const MyProfileScreen(),
          kLanguageRoute: (context) => const LanguageScreen(),
          kAyahsRoute: (context) => const AyahsScreen(),
          kAyahDetailRoute: (context) => const AyahDetailScreen(),
          kJuZuRoute: (context) => const JuzuScreen(),
          kBookRoute: (context) => const BookScreen(),
          kChapterRoute: (context) => const ChapterScreen(),
          kJuzuDetailRoute: (context) => const JuZuDetailScreen(),
          kSearchAyahsRoute: (context) => const SearchAyahsScreen(),
          kChapterDetailRoute: (context) => const ChapterDetailScreen(),
          kContactUsRoute: (context) => const ContactUsScreen(),
        },
      ),
    );
  }
}
