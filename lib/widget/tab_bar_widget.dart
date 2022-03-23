part of 'widgets.dart';

class TabBarWidget extends StatelessWidget {
  TabController? controller;
  Function(dynamic)? onTap;
  List<Widget>? widgetList;
  String? tabTitle1;
  String? tabTitle2;
  TabBarWidget(
      {Key? key,
      this.controller,
      this.widgetList,
      this.tabTitle1,
      this.tabTitle2,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(tabTitle1!,
                    style: getStyles(20.0, FontWeight.bold, AppColors.black)),
              ),
              Tab(
                child: Text(tabTitle2!,
                    style: getStyles(20.0, FontWeight.bold, AppColors.black)),
              ),
            ],
            onTap: onTap!,
            controller: controller,
          ),
          Expanded(
              child: TabBarView(
            controller: controller,
            physics: ClampingScrollPhysics(),
            children: widgetList!,
          )),
        ],
      ),
    );
  }
}
