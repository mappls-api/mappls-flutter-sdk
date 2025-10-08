import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/model/category_model.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_flutter_demo/utils/utils.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});



  Widget getHomeWidget(CategoryModel categoryModel, BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MapplsColor.secondaryColor,
              border: Border.all(color: MapplsColor.secondaryColor),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(20.0),
              child: Image.asset(categoryModel.icon),
            ),
          ),
          SizedBox(height: 4,),
          Text(
            categoryModel.name,
            style: TextStyle(
              color: MapplsColor.primaryTextColor,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      onTap: () => {
        Navigator.pushNamed(context, '/sub_category', arguments: categoryModel.type)
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // remove shadow to show separator
        backgroundColor: MapplsColor.primaryColor,
        title: Image.asset('assets/mappls_sdk_logo.png'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // height of the line
          child: Container(
            color: Color(0x723C445B), // color of the line
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(Utils.mapplsHomeList.length, (index) {
            return getHomeWidget(Utils.mapplsHomeList[index], context);
          }),
        ),
      ),
    );
  }
}
