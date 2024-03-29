import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progect_management_app/create_new_project/create_new_project.dart';
import 'package:progect_management_app/home/cubit/bottom_nav_cubit.dart';
import 'package:progect_management_app/home/view/tabs/home_tab.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/utils/navigation_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: IndexedStack(
          index: context.watch<BottomNavCubit>().state.index,
          children: [
            const HomeTab(),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Center(child: const Text('Schedule')),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Center(child: const Text('Task')),
            ),
            Container(),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Center(child: const Text('Settings')),
            )
          ]),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return BottomNavigationBar(
              onTap: (index) {
                if (index == 2) {
                  context.navigate(page: const CreateNewProjectPage());
                  return;
                }
                context.read<BottomNavCubit>().onIndexChanged = index;
              },
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              showUnselectedLabels: true,
              currentIndex: state.index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: l10n.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.calendarDays),
                  label: l10n.schedule,
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: kBlueColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.add),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.task_sharp), label: l10n.task),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: l10n.settings)
              ]);
        },
      ),
    );
  }
}
