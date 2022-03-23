
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpTitle;

  /// No description provided for @phTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phTitle;

  /// No description provided for @otpbtnTitle.
  ///
  /// In en, this message translates to:
  /// **'Fetch Otp'**
  String get otpbtnTitle;

  /// No description provided for @countryTitle.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryTitle;

  /// No description provided for @islogin.
  ///
  /// In en, this message translates to:
  /// **'isLogin'**
  String get islogin;

  /// No description provided for @signUpDes.
  ///
  /// In en, this message translates to:
  /// **'Setup your profile to enjoy our services'**
  String get signUpDes;

  /// No description provided for @businessName.
  ///
  /// In en, this message translates to:
  /// **'Business Name'**
  String get businessName;

  /// No description provided for @bType.
  ///
  /// In en, this message translates to:
  /// **'Type of Business'**
  String get bType;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @vericationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get vericationCode;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email ID'**
  String get email;

  /// No description provided for @pass.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get pass;

  /// No description provided for @confPass.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confPass;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get account;

  /// No description provided for @alAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account? Login'**
  String get alAccount;

  /// No description provided for @loginDes.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials to access your account'**
  String get loginDes;

  /// No description provided for @notAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get notAccount;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'Email is Empty'**
  String get emailError;

  /// No description provided for @passError.
  ///
  /// In en, this message translates to:
  /// **'Password is Empty'**
  String get passError;

  /// No description provided for @businessNameErorr.
  ///
  /// In en, this message translates to:
  /// **'Business Name is Empty'**
  String get businessNameErorr;

  /// No description provided for @btError.
  ///
  /// In en, this message translates to:
  /// **'Type of business is Empty'**
  String get btError;

  /// No description provided for @addError.
  ///
  /// In en, this message translates to:
  /// **'Address is Empty'**
  String get addError;

  /// No description provided for @phError.
  ///
  /// In en, this message translates to:
  /// **'Phone Number is Empty'**
  String get phError;

  /// No description provided for @confError.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is Empty'**
  String get confError;

  /// No description provided for @verCoError.
  ///
  /// In en, this message translates to:
  /// **'Verification Code is Empty'**
  String get verCoError;

  /// No description provided for @cr_invoice.
  ///
  /// In en, this message translates to:
  /// **'Create Invoice'**
  String get cr_invoice;

  /// No description provided for @productList.
  ///
  /// In en, this message translates to:
  /// **'Product List'**
  String get productList;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @productPriceTitle.
  ///
  /// In en, this message translates to:
  /// **'Product Price'**
  String get productPriceTitle;

  /// No description provided for @salePrice.
  ///
  /// In en, this message translates to:
  /// **'Sale Price'**
  String get salePrice;

  /// No description provided for @verifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyTitle;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameError.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameError;

  /// No description provided for @header.
  ///
  /// In en, this message translates to:
  /// **'Header'**
  String get header;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @headerError.
  ///
  /// In en, this message translates to:
  /// **'Header is required'**
  String get headerError;

  /// No description provided for @amountError.
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get amountError;

  /// No description provided for @descriptionError.
  ///
  /// In en, this message translates to:
  /// **'Description is required'**
  String get descriptionError;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @startDateError.
  ///
  /// In en, this message translates to:
  /// **'Start Date is required'**
  String get startDateError;

  /// No description provided for @endDateError.
  ///
  /// In en, this message translates to:
  /// **'End Date is required'**
  String get endDateError;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @barCode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barCode;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @saleVariant.
  ///
  /// In en, this message translates to:
  /// **'Sale Variant'**
  String get saleVariant;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get createNew;

  /// No description provided for @createProduct.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get createProduct;

  /// No description provided for @addImage.
  ///
  /// In en, this message translates to:
  /// **'Add Image'**
  String get addImage;

  /// No description provided for @nameVariant.
  ///
  /// In en, this message translates to:
  /// **'Name of the variant'**
  String get nameVariant;

  /// No description provided for @productNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Product Name'**
  String get productNameHint;

  /// No description provided for @forgotPass.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPass;

  /// No description provided for @purchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @createParty.
  ///
  /// In en, this message translates to:
  /// **'Create Party'**
  String get createParty;

  /// No description provided for @createIncome.
  ///
  /// In en, this message translates to:
  /// **'Create Income'**
  String get createIncome;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @createVariant.
  ///
  /// In en, this message translates to:
  /// **'Create Variant'**
  String get createVariant;

  /// No description provided for @swipeToProceed.
  ///
  /// In en, this message translates to:
  /// **'SWIPE TO CONTINUE'**
  String get swipeToProceed;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @addMan.
  ///
  /// In en, this message translates to:
  /// **'Add Manually'**
  String get addMan;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get scanBarcode;

  /// No description provided for @received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get received;

  /// No description provided for @given.
  ///
  /// In en, this message translates to:
  /// **'Given'**
  String get given;

  /// No description provided for @amountReceived.
  ///
  /// In en, this message translates to:
  /// **'Amount Received'**
  String get amountReceived;

  /// No description provided for @changeBalance.
  ///
  /// In en, this message translates to:
  /// **'Change Balance'**
  String get changeBalance;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @storeName.
  ///
  /// In en, this message translates to:
  /// **'Sharma City Mart'**
  String get storeName;

  /// No description provided for @party.
  ///
  /// In en, this message translates to:
  /// **'Party'**
  String get party;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @businessType.
  ///
  /// In en, this message translates to:
  /// **'Type Of Business'**
  String get businessType;

  /// No description provided for @productNameError.
  ///
  /// In en, this message translates to:
  /// **'Product Name is required'**
  String get productNameError;

  /// No description provided for @paymentMode.
  ///
  /// In en, this message translates to:
  /// **'Payment Mode'**
  String get paymentMode;

  /// No description provided for @sale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get sale;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
