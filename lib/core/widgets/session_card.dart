import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/string.dart';
import '../constants/text.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.sessions});

  final List<Map<String, String>> sessions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          constraints: BoxConstraints(minHeight: 71.h),
          decoration: BoxDecoration(
            color: AppColors.lightprimery,
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(color: AppColors.darkprimery, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    session["date"]!,
                    style: AppTextStyles.body2.copyWith(fontSize: 18.sp),
                  ),
                  session["status"] == "active"
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              183,
                              246,
                              115,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            side: BorderSide(
                              color: AppColors.primery,
                              width: 1.w,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            AppStrings.enter,
                            style: AppTextStyles.body1,
                          ),
                        )
                      : session["status"] == "pending"
                      ? Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  251,
                                  137,
                                  122,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide(
                                  color: AppColors.primery,
                                  width: 1.w,
                                ),
                              ),
                              child: Text(
                                AppStrings.cancel,
                                style: AppTextStyles.body1,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text("قادمة", style: AppTextStyles.body1),
                          ],
                        )
                      : Text("مكتملة", style: AppTextStyles.headline2),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(session["title"]!, style: AppTextStyles.headline1),
                  Text(
                    session["sheikhname"]!,
                    style: AppTextStyles.headline2.copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
