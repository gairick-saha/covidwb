import 'package:covidwb/configuration/app_configuration.dart';
import 'package:covidwb/controller/data_controller.dart';
import 'package:covidwb/core/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController _controller = Get.put(DataController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: kToolbarHeight - 10,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppConfig.screenHeight(context) * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: AppConfig.screenHeight(context) * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'CHECK YOUR LOCATION',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConfig.screenWidth(context) * 0.15,
                        vertical: AppConfig.screenHeight(context) * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                        color: Colors.white,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          _controller.query = value;
                          _controller.readInput("query", value);
                        },
                        focusNode: _controller.searchFocus,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.bottom,
                        cursorWidth: 1,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: 'ENTER YOUR LOCATION',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.7),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MenuWidget(
              title: 'WHAT YOU NEED NOW',
            ),
            Divider(
              color: Colors.transparent,
            ),
            Container(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      _controller.search();
                    },
                    color: AppConfig.kSecondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    minWidth: AppConfig.screenWidth(context) * 0.8,
                    height: AppConfig.screenHeight(context) * 0.05,
                    child: Text(
                      'SEARCH',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Image.asset(
                    'assets/images/guidelines.png',
                    scale: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
