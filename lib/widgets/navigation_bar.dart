import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../cubit/navigation_cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  
  final ItemScrollController itemScrollController;
  final int currentIndex;

  const CustomNavigationBar({
    super.key, 
    required this.itemScrollController, 
    required this.currentIndex, 
    required ItemScrollController,
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 40,
              ),
              const SizedBox(width: 16),
              _buildNavItem(context, 'Section 1', 0),
              _buildNavItem(context, 'Section 2', 1),
              _buildNavItem(context, 'Section 3', 2),
              _buildNavItem(context, 'Section 4', 3),
              _buildNavItem(context, 'Section 5', 4),
              _buildNavItem(context, 'Section 6', 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, int index) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            BlocProvider.of<NavigationCubit>(context).navigateToSection1();
            itemScrollController.scrollTo(index: 0, duration: const Duration(milliseconds: 500));
            break;
          case 1:
            BlocProvider.of<NavigationCubit>(context).navigateToSection2();
            itemScrollController.scrollTo(index: 1, duration: const Duration(milliseconds: 500));
            break;
          case 2:
            BlocProvider.of<NavigationCubit>(context).navigateToSection3();
            itemScrollController.scrollTo(index: 2, duration: const Duration(milliseconds: 500));
            break;
          case 3:
            BlocProvider.of<NavigationCubit>(context).navigateToSection4();
            itemScrollController.scrollTo(index: 3, duration: const Duration(milliseconds: 500));
            break;
          case 4:
            BlocProvider.of<NavigationCubit>(context).navigateToSection5();
            itemScrollController.scrollTo(index: 4, duration: const Duration(milliseconds: 500));
            break;
          case 5:
            BlocProvider.of<NavigationCubit>(context).navigateToSection6();
            itemScrollController.scrollTo(index: 5, duration: const Duration(milliseconds: 500));
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
