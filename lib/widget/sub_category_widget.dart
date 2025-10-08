import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/component/sub_category_card.dart';
import 'package:mappls_flutter_demo/model/sub_category_model.dart';
import 'package:mappls_flutter_demo/utils/Utils.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key});


  @override
  Widget build(BuildContext context) {

    final int categoryType = ModalRoute.of(context)!.settings.arguments as int;
    List<SubCategoryModel> subCategoryList = Utils.getSubCategoryList(categoryType);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // remove shadow to show separator
        backgroundColor: MapplsColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          Utils.getTitle(categoryType),
          style: TextStyle(color: MapplsColor.primaryTextColor, fontSize: 20.0),
        ),
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
        child: ListView(
          children: List.generate(subCategoryList.length, (index) {
            return SubCategoryCard(subCategory: subCategoryList[index], onTap: (subCategory) => {
              Navigator.pushNamed(context, subCategory.route)
            });
          }),
        ),
      ),
    );
  }
}
