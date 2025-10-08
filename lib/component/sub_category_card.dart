import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/model/sub_category_model.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';

class SubCategoryCard extends StatelessWidget {
  final SubCategoryModel subCategory;

  final Function(SubCategoryModel) onTap;

  const SubCategoryCard({
    Key? key,
    required this.subCategory,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () => {onTap(subCategory)},
        child: Container(
          decoration: BoxDecoration(
            color: MapplsColor.secondaryColor,
            border: Border.all(color: MapplsColor.secondaryColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // or center, if needed
              children: [
                Image.asset(subCategory.icon, fit: BoxFit.fitWidth),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
                  child: Text(
                    subCategory.name,
                    style: TextStyle(
                      color: MapplsColor.primaryTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                  child: Text(
                    subCategory.description,
                    style: TextStyle(
                      color: MapplsColor.secondaryTextColor,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
