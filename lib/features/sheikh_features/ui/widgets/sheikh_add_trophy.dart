// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutqin/core/constants/text.dart';
import '../../../../core/constants/colors.dart';

class SheikhAddTrophy extends StatefulWidget {
  final List<Map<String, String>> intialTrophies;
  final  VoidCallback? onPressed;

  const SheikhAddTrophy({super.key, required this.intialTrophies, this.onPressed});

  @override
  State<SheikhAddTrophy> createState() => _SheikhAddTrophyState();
}

class _SheikhAddTrophyState extends State<SheikhAddTrophy> {
  late List<Map<String, String>> trophies;
  final GlobalKey _addKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    trophies = List.from(widget.intialTrophies);
  }

  Future<void> _showTrophyMenu(BuildContext context) async {
    final available = [
      {"title": "حفظ اول ثلاث اجزاء"},
      {"title": "حفظ ثاني ثلاث اجزاء"},
      {"title": "حفظ ثالث ثلاث اجزاء"},
      {"title": "حفظ رابع ثلاث اجزاء"},
      {"title": "حفظ اول ثلاث اجزاء"},
      {"title": "حفظ ثاني ثلاث اجزاء"},
      {"title": "حفظ ثالث ثلاث اجزاء"},
      {"title": "حفظ رابع ثلاث اجزاء"},
    ];

    final RenderBox button =
        _addKey.currentContext!.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final buttonBottom = button.localToGlobal(
      button.size.bottomLeft(Offset.zero),
      ancestor: overlay,
    );

    final position = RelativeRect.fromLTRB(
      buttonBottom.dx,
      buttonBottom.dy,
      button
          .localToGlobal(button.size.topRight(Offset.zero), ancestor: overlay)
          .dx,
      button
          .localToGlobal(button.size.topRight(Offset.zero), ancestor: overlay)
          .dy,
    );
    final result = await showMenu<Map<String, String>>(
      color: AppColors.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 8,
      context: context,
      position: position,
      items: available.map((trophy) {
        return PopupMenuItem<Map<String, String>>(
          value: trophy,
          child: Row(
            children: [
              Icon(FontAwesomeIcons.trophy, color: AppColors.primery, size: 18),
              const SizedBox(width: 8),
              Text(trophy["title"]!, style: AppTextStyles.body2),
            ],
          ),
        );
      }).toList(),
    );

    if (result != null) {
      final exisits = trophies.any(
        (trophy) => trophy["title"] == result["title"],
      );
      if (exisits) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'هذه الجائزة مضافة بالفعل',
              style: AppTextStyles.body2.copyWith(color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 215, 125, 119),
          ),
        );
        return;
      }
      setState(() {
        trophies.add(result);
        widget.onPressed!();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(color: AppColors.primery, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(155, 209, 200, 178).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: trophies.length + 1, // +1 for Add button
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  key: _addKey,
                  onTap: () => _showTrophyMenu(context),
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 32),
                  ),
                ),
              );
            }

            final trophy = trophies[index - 1]; // shift because of button
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 1.w,
                    color: AppColors.secondary,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.trophy,
                        color: AppColors.primery,
                        size: 55.h,
                      ),
                      SizedBox(
                        width: 110.w,
                        child: Text(
                          trophy["title"]!,
                          style: AppTextStyles.body2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100.h,
                    width: 1.w,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
