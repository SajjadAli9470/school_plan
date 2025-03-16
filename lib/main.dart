import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproduct/app_theme.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/bloc_state/UserState/user_bloc.dart';
import 'package:myproduct/modules/auth/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:get/get.dart';


void main()async{
  await GetStorage.init();

  try {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationCacheDirectory(),
      // encryptionCipher: HydratedAesCipher(key)
    );  } catch (e) {}
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeSwitchBloc(),
        ),
        
        
        BlocProvider(
          create: (context) => UserBloc(),
        ),
       
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UpgradeAlert(
          onUpdate: () {
            // closeAppUsingSystemPop();
            return true;
          },
          showIgnore: false,
          showLater: false,
          upgrader: Upgrader(),
          child:  const MyApp(),
        ),
      ),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return  ScreenUtilInit(
          designSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
                  // locale: Locale(GetStorage().read(localeLang) ?? 'en',
                  //     GetStorage().read(countryLang) ?? 'US'),
                  // fallbackLocale: Locale(GetStorage().read(localeLang) ?? 'en',
                  //     GetStorage().read(countryLang) ?? 'US'),
                  // translations: LanguageTranslation(),
             localizationsDelegates: const [
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
          Locale('en', 'US'), // English
        
    ],
                  title: "SiS",
                  debugShowCheckedModeBanner: false,
                home: const AuthLogin(),
                  theme: ThemeData(
                    textTheme: AppTheme.textTheme,
                    fontFamily: AppTheme.fontName,
                    colorScheme: ColorScheme.fromSwatch(
                        backgroundColor: Colors.white,
                        primarySwatch:
                            AppTheme.createMaterialColor(state.selected.primary_1)),
                    primarySwatch:
                        AppTheme.createMaterialColor(state.selected.primary_1),
                  ),
                );
          }
        );
      },
    );
  }
}
