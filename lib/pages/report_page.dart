part of 'pages.dart';

class ReportPage extends GetWidget<ReportViewModel> {
  int? selectedIndex;

  DateTime? selectedDate = DateTime.now();
  DateTime? selectedDate1 = DateTime.now();
  String? currentDate = '';
  String? currentDate1 = '';
  BuildContext? currentContext;

  @override
  Widget build(BuildContext context) {
    currentContext = context;
    return GetBuilder<ReportViewModel>(
        init: ReportViewModel(),
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Text(
                            AppLocalizations.of(context)!.report,
                            style: getStyles(
                                22.0, FontWeight.bold, AppColors.black),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                child: CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  value: controller.currentIndex == index
                                      ? controller.checkValue
                                      : false,
                                  title: Text(controller.reportList[index],
                                      style: getStyles(18.0, FontWeight.normal,
                                          AppColors.grey)),
                                  onChanged: (value) {
                                    controller.setCheckValue(value!, index);
                                  },
                                ),
                              );
                            },
                            itemCount: controller.reportList.length,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          widgetMethod(AppLocalizations.of(context)!.startDate,
                              0, currentDate!, selectedDate),
                          SizedBox(
                            height: 1.h,
                          ),
                          widgetMethod(AppLocalizations.of(context)!.endDate, 1,
                              currentDate1!, selectedDate1),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: MaterialButton(
                              height: 7.h,
                              color: AppColors.darkColor,
                              onPressed: () async{

                                Invoice invoice = Invoice(
                                  info: InvoiceInfo(
                                    date: DateTime.now(),
                                    description: "User Data",
                                    dueDate: DateTime.now().add(Duration(days: 7)),
                                    number: '${DateTime.now().year}-9999',
                                  ),
                                  items: controller.productList,
                                );
                                final pdfFile =
                                    await PdfInvoiceApi.generate(invoice);

                                PdfApi.openFile(pdfFile);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.view,
                                style: getStyles(
                                    24.0, FontWeight.normal, AppColors.white),
                              ),
                            )),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: MaterialButton(
                                height: 7.h,
                                color: AppColors.darkColor,
                                onPressed: () {

                                  downloadFile(context);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.download,
                                  style: getStyles(
                                      24.0, FontWeight.normal, AppColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  downloadFile(BuildContext context) async {
    PermissionStatus permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();

      // startDownload(context, url, filename);
    } else {
      // startDownload(context, url, filename);
    }
  }

  startDownload(BuildContext context, String url, String filename) async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    String path = appDocDir.path + '/$filename.pdf';
    File file = File(path);
    if (!await file.exists()) {
      await file.create();
    } else {
      await file.delete();
      await file.create();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DownloadAlert(
        url: url,
        path: path,
      ),
    );
  }

  Widget widgetMethod(String s, int i, String t, DateTime? selectedDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s,
          style: getStyles(20.0, FontWeight.normal, AppColors.black),
        ),
        SizedBox(
          height: 4.w,
        ),
        GestureDetector(
            onTap: () {
              Get.find<ReportViewModel>()
                  .datePick(t, selectedDate, currentContext);
              // controller.datePick(t, selectedDate, currentContext);
            },
            child: Container(
              width: 100.w,
              height: 7.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(t.toString(),
                    style: getStyles(18.0, FontWeight.normal, AppColors.black)),
              ),
            )),
        SizedBox(
          height: 4.w,
        ),
      ],
    );
  }
}
