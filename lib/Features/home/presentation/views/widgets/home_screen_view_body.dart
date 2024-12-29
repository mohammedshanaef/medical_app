import 'package:flutter/material.dart';
import 'package:medical_app/Features/home/presentation/views/widgets/categories_widget.dart';
import 'package:medical_app/Features/home/presentation/views/widgets/recent_visit_widget.dart';
import 'package:medical_app/Features/home/presentation/views/widgets/reminder_widget.dart';
import 'package:medical_app/Features/home/presentation/views/widgets/search_widget.dart';
import 'package:medical_app/Features/home/presentation/views/widgets/section_title.dart';
import 'package:medical_app/core/utils/custom_bottom_navigation.dart';
import 'package:medical_app/core/utils/custom_drawer.dart';
import 'package:medical_app/Features/home/presentation/views/widgets/header_widget.dart';

class HomeScreenViewBody extends StatelessWidget {
  const HomeScreenViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              HeaderWidget(userName: "Ghalia"),
              SizedBox(height: 16),
              SearchWidget(),
              SizedBox(height: 24),
              SectionTitle(title: "What Are You Looking For ?"),
              SizedBox(height: 16),
              CategoriesWidget(),
              SizedBox(height: 24),
              SectionTitle(title: "Don't Forget"),
              SizedBox(height: 16),
              ReminderWidget(),
              SizedBox(height: 24),
              SectionTitle(title: "My Recent Visit"),
              SizedBox(height: 16),
              RecentVisitWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
