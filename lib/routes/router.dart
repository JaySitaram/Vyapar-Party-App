part of 'route_module.dart';

class Routes {
  final routes = [
    GetPage(
        name: LOGIN_ROUTE, page: () => LoginScreen(), binding: LoginBindings()),
    GetPage(
        name: SIGNUP_ROUTE,
        page: () => SignUpScreen(),
        binding: SignUpBindings()),
    GetPage(name: HOME_ROUTE, page: () => HomePage(), binding: HomeBindings()),
    GetPage(
        name: ADD_PRODUCT_ROUTE,
        page: () => ProductListPage(),
        binding: AddProductBindings()),
    GetPage(
        name: CREATE_PRODUCT_ROUTE,
        page: () => CreateProductPage(),
        binding: AddProductBindings()),
    GetPage(name: CREATE_PARTY_ROUTE, page: () => CreatePartyPage()),
    GetPage(
        name: REPORT_ROUTE,
        page: () => ReportPage(),
        binding: ReportBindings()),
    GetPage(
        name: CREATE_INCOME_ROUTE,
        page: () => CreateIncomePage(),
        binding: IncomeExpenseBinding()),
    GetPage(
        name: SALE_REPORT_ROUTE,
        page: () => SaleTransactionPage(),
        binding: ViewPartyBindings()),
    GetPage(
        name: TRANSACTION_ROUTE,
        page: () => TransactionPage(),
        arguments: Get.arguments,
        binding: PartyDetailsBinding()),
    GetPage(
        name: SALES_ROUTE,
        page: () => SalesPage(),
        binding: AddProductBindings()),
    GetPage(
        name: ADD_MANUAL_ROUTE,
         arguments: Get.arguments,
        page: () => AddManualProductPage(),
        binding: AddProductBindings()),
    GetPage(
        name: PARTY_DETAILS_ROUTE,
        page: () => PartyDetailsPage(),
        binding: PartyDetailsBinding()),
    GetPage(
        name: VIEW_PARTY_ROUTE,
        page: () => ViewPartyScreen(),
        binding: PartyDetailsBinding()),
    GetPage(
        name: INCOME_EXPENSE_ROUTE,
        page: () => IncomeExpensePage(),
        binding: IncomeExpenseBinding()),
    GetPage(
        name: PURCHASE_ROUTE,
        page: () => PurchaseBillPage(),
        binding: PurchaseBindings()),
  ];
}
