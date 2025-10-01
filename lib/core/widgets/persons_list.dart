import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/widgets/person_card.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';

import '../constants/colors.dart';
import '../constants/text.dart'; // Assuming AppTextStyles is here

class PersonsList extends StatelessWidget {
  const PersonsList({
    super.key,
    required this.persons,
    required this.onPressed,
    this.height,
    this.student = true,
  });

  final List<ProfileModel> persons;
  final Function(String tutorId) onPressed;
  final double? height;
  final bool student;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = height ?? MediaQuery.of(context).size.height;

    return Container(
      height: containerHeight,
      padding: const EdgeInsets.all(15),
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

      child: (!student && persons.isEmpty)
          ? Center(
              child: Text("لا يوجد طلاب بعد", style: AppTextStyles.headline2),
            )
          : ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                final person = persons[index];
                return PersonCard(
                  onPressed: onPressed,
                  person: person,
                  student: student,
                );
              },
            ),
    );
  }
}
