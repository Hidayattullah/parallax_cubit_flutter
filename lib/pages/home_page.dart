import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parallax_cubit_flutter/cubit/navigation_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemPositionsListener.itemPositions.addListener(() {
        final positions = itemPositionsListener.itemPositions.value;
        if (positions.isNotEmpty) {
          final firstVisibleItemIndex = positions
              .where((ItemPosition position) => position.itemLeadingEdge >= 0)
              .reduce((ItemPosition min, ItemPosition position) => position.itemLeadingEdge < min.itemLeadingEdge ? position : min)
              .index;

          switch (firstVisibleItemIndex) {
            case 0:
              BlocProvider.of<NavigationCubit>(context).navigateToSection1();
              break;
            case 1:
              BlocProvider.of<NavigationCubit>(context).navigateToSection2();
              break;
            case 2:
              BlocProvider.of<NavigationCubit>(context).navigateToSection3();
              break;
            case 3:
              BlocProvider.of<NavigationCubit>(context).navigateToSection4();
              break;
            case 4:
              BlocProvider.of<NavigationCubit>(context).navigateToSection5();
              break;
            case 5:
              BlocProvider.of<NavigationCubit>(context).navigateToSection6();
              break;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height,
                color: _getContainerColor(index),
              );
            },
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                return CustomNavigationBar(
                  itemScrollController: itemScrollController,
                  currentIndex: state.index, ItemScrollController: null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getContainerColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.pink;
      default:
        return Colors.white;
    }
  }
}

extension NavigationStateExtension on NavigationState {
  int get index {
    switch (this) {
      case NavigationState.section1:
        return 0;
      case NavigationState.section2:
        return 1;
      case NavigationState.section3:
        return 2;
      case NavigationState.section4:
        return 3;
      case NavigationState.section5:
        return 4;
      case NavigationState.section6:
        return 5;
      default:
        return 0;
    }
  }
}