import 'dataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/basic_templates/app_text_styles.dart';


class CardWidget extends StatelessWidget {
  // Atributos
  final double borderRadius = 5;
  final double headerHeight = 85;
  final Color borderColor = AppColors.border;
  final Color headerColor = AppColors.darkBlue;
  final Color backColor = AppColors.white;
  final VoidCallback onTap;
  DataModel data;

  CardWidget({
    Key? key,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  // Métodos
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: headerHeight,
                decoration: BoxDecoration(
                  color: headerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, right: 2),
                  child: Column(
                    children: [
                      Text(data.id.toString(), style: AppTextStyles.bodybold18),
                      Text(data.nome, style: AppTextStyles.bodyWhite),

                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 8),
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          data.peso.toString(),
                          style: AppTextStyles.heading15,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: Row(
              //     children: [
              //       Flexible(
              //         child: Text(
              //           data.valores.toString(),
              //           style: AppTextStyles.body,
              //           overflow: TextOverflow.ellipsis,
              //           maxLines: 2,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
