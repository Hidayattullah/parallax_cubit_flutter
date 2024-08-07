import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationState { section1, section2, section3, section4, section5, section6 }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.section1);

  void navigateToSection1() => emit(NavigationState.section1);
  void navigateToSection2() => emit(NavigationState.section2);
  void navigateToSection3() => emit(NavigationState.section3);
  void navigateToSection4() => emit(NavigationState.section4);
  void navigateToSection5() => emit(NavigationState.section5);
  void navigateToSection6() => emit(NavigationState.section6);
}
