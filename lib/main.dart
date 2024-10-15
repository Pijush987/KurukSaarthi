import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Localization support
import 'package:kuruk_saarthi/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_bloc.dart';
import 'package:kuruk_saarthi/bloc/login_bloc/login_bloc.dart';
import 'package:kuruk_saarthi/bloc/notification_bloc/notification_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/bloc/region_select_bloc/region_select_bloc.dart';
import 'package:kuruk_saarthi/configs/components/internet_exception_widget.dart';
import 'package:kuruk_saarthi/repository/login_api/login_api_repository.dart';
import 'package:kuruk_saarthi/repository/login_api/login_http_api_repository.dart';
import 'package:kuruk_saarthi/repository/login_api/login_mock_api_repository.dart';
import 'package:kuruk_saarthi/repository/notification_api/notification_api_repository.dart';
import 'package:kuruk_saarthi/repository/notification_api/notification_http_api_repository.dart';
import 'package:kuruk_saarthi/repository/region_select_api/region_select_api_repository.dart';
import 'package:kuruk_saarthi/repository/region_select_api/region_select_mock_api_repository.dart';
import 'package:kuruk_saarthi/repository/survey_api/survey_api_repository.dart';
import 'package:kuruk_saarthi/repository/survey_api/survey_http_api_repository.dart';
import 'package:kuruk_saarthi/repository/voter_list_api/voter_api_repository.dart';
import 'package:kuruk_saarthi/repository/voter_list_api/voter_http_api_repository.dart';
import 'package:kuruk_saarthi/services/pushNotification/local_notification_services.dart';
import 'package:kuruk_saarthi/test_pubspec/animated_button.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'bloc/home_bloc/home_bloc.dart';
import 'bloc/surveys_bloc/surveys_bloc.dart';
import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';
import 'configs/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'services/pushNotification/storage_services.dart';
GetIt getIt = GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  servicesLocator();
  LocalNotificationServices().requestPermission();
  // StorageServices().requestStoragePermission();
  // StorageServices().loadFileFromSdCard();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late HomeBloc _homeBloc ;
  late DashboardBloc _dashboardBloc ;
  late LoginBloc _loginBloc ;
  late PinChangeBloc _pinChangeBloc ;
  late RegionSelectBloc _regionSelectBloc ;
  late SurveysBloc _surveysBloc ;
  late ListsBloc _listsBloc ;
  late NotificationBloc _notificationBloc ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = HomeBloc(voterListApiRepository: getIt());
    _dashboardBloc = DashboardBloc();
    _loginBloc = LoginBloc(loginApiRepository: getIt());
    _pinChangeBloc = PinChangeBloc(loginApiRepository: getIt());
    _regionSelectBloc = RegionSelectBloc(regionSelectApiRepository: getIt());
    _surveysBloc = SurveysBloc(surveyApiRepository: getIt());
    _listsBloc = ListsBloc();
    _notificationBloc = NotificationBloc(notificationApiRepository: getIt());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _homeBloc.close();
    _dashboardBloc.close();
    _loginBloc.close();
    _pinChangeBloc.close();
    _regionSelectBloc.close();
    _surveysBloc.close();
    _listsBloc.close();
    _notificationBloc.close();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => _homeBloc),
        BlocProvider<SurveysBloc>(create: (context) => _surveysBloc),
        BlocProvider<LoginBloc>(create: (context) => _loginBloc),
        BlocProvider<PinChangeBloc>(create: (context) => _pinChangeBloc),
        BlocProvider<RegionSelectBloc>(create: (context) => _regionSelectBloc),
        BlocProvider<DashboardBloc>(create: (context) => _dashboardBloc),
        BlocProvider<ListsBloc>(create: (context) => _listsBloc),
        BlocProvider<NotificationBloc>(create: (context) => _notificationBloc),
        BlocProvider<NotificationBloc>(create: (context) => _notificationBloc),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:Constant.appTittle,
          themeMode: ThemeMode.light, // Setting theme mode to dark
          theme: lightTheme, // Setting light theme
          darkTheme: darkTheme, // Setting dark theme
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: const Locale('en'),
          supportedLocales: const [
            Locale('en'), // English locale
            Locale('mr'), // Spanish locale
          ],
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        )
    );
  }
}

// Function for initializing service locator
void servicesLocator() {
  getIt.registerLazySingleton<LoginApiRepository>(() => LoginHttpApiRepository());
  getIt.registerLazySingleton<RegionSelectApiRepository>(() => RegionSelectMockApiRepository());
  getIt.registerLazySingleton<VoterListApiRepository>(() => VoterHttpApiRepository());
  getIt.registerLazySingleton<SurveyApiRepository>(() => SurveyHttpApiRepository());
  getIt.registerLazySingleton<NotificationApiRepository>(() => NotificationHttpApiRepository());
}