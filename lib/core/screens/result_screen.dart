import 'package:covidwb/configuration/app_configuration.dart';
import 'package:covidwb/controller/data_controller.dart';
import 'package:covidwb/core/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends GetWidget<DataController> {
  const ResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      initState: (_) {
        controller.getResult();
      },
      builder: (_controller) => Scaffold(
        // backgroundColor: Color(0xFFf8f8f8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: kToolbarHeight - 20,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            MenuWidget(
              title: controller.query.toUpperCase(),
            ),
            _controller.isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: controller.searchResult.length == 0
                        ? Center(
                            child: Text(
                              'No Results Found',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.symmetric(
                              vertical: AppConfig.screenHeight(context) * 0.01,
                            ),
                            itemCount: controller.searchResult.length,
                            separatorBuilder: (BuildContext context, _) =>
                                Divider(
                              color: Colors.transparent,
                              height: AppConfig.screenHeight(context) * 0.01,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppConfig.screenWidth(context) * 0.1,
                                ),
                                tileColor: Colors.white,
                                minLeadingWidth:
                                    AppConfig.screenWidth(context) * 0.01,
                                leading: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: AppConfig.kSecondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0,
                                  ),
                                ),
                                title: Text(
                                  controller.searchResult[index]['NAME'],
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0,
                                    letterSpacing:
                                        AppConfig.screenWidth(context) * 0.0001,
                                  ),
                                ),
                                subtitle: Text(
                                  '+91' +
                                      controller.searchResult[index]
                                              ['CONTACT_NO']
                                          .trim(),
                                  style: TextStyle(
                                    color: Color(0xff1d9a09),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0,
                                    letterSpacing:
                                        AppConfig.screenWidth(context) * 0.001,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
