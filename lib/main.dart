import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vyapar_party_app/bindings/bindings.dart';
import 'package:vyapar_party_app/model/party_model.dart';
import 'package:vyapar_party_app/model/product_model.dart';
import 'package:vyapar_party_app/routes/route_module.dart';
import 'package:vyapar_party_app/services/firebase_auth.dart';
import 'package:vyapar_party_app/services/hive_service.dart';
import 'package:vyapar_party_app/services/shared_pref.dart';
import 'package:vyapar_party_app/utils/utils.dart';

import 'model/create_income_model.dart';

List<CameraDescription> cameras = [];


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  cameras = await availableCameras();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
  await Firebase.initializeApp();
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter(ProductModelAdapter());
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter(CreateIncomeModelAdapter());
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter(PartyModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          initialBinding: NetworkBindings(),
          smartManagement: SmartManagement.onlyBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: AppColors.darkColor),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            Locale('es'),
            Locale('el'),
            Locale('et'),
            Locale('nb'),
            Locale('nn'),
            Locale('pl'),
            Locale('pt'),
            Locale('ru'),
            Locale('hi'),
            Locale('ne'),
            Locale('uk'),
            Locale('hr'),
            Locale('tr'),
            Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
            Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
          ],
          themeMode: ThemeMode.system,
          // darkTheme: ThemeData.dark(),
          getPages: Routes().routes,
          initialRoute: LOGIN_ROUTE,
        );
      },
    );
  }
}