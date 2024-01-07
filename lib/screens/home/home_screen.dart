import 'package:courier_connect/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    final index = ref.watch(bottomNavBarIndexProvider);

    final List<MenuButtonIconItem> menuButtonIconItems = [
      MenuButtonIconItem(
        icon: Icons.lunch_dining_outlined,
        onPressed: () {},
      ),
      MenuButtonIconItem(
        icon: Icons.local_mall_outlined,
        onPressed: () {},
      ),
      MenuButtonIconItem(
        icon: Icons.maps_home_work_outlined,
        onPressed: () {},
      ),
      MenuButtonIconItem(
        icon: Icons.coffee_outlined,
        onPressed: () {},
      ),
      MenuButtonIconItem(
        icon: Icons.donut_small_outlined,
        onPressed: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const CupertinoIconThemeData(size: 30, color: Colors.white),
        leading: const Icon(CupertinoIcons.back),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell_solid),
          )
        ],
      ),
      backgroundColor: colors.onPrimaryContainer,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SvgPicture.asset(
              width: 150,
              'assets/svg/Messenger-pana.svg',
              fit: BoxFit.contain,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name \nSurname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 0.9,
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'name@gmail.com',
              style: TextStyle(
                height: 0.8,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 1.0,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: colors.background,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.drag_handle,
                                color: colors.primary, size: 30.0),
                          ), // El ícono que desees

                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.05, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly, // Centra los hijos del Row
                              children: menuButtonIconItems
                                  .map((item) => Center(
                                        child: Material(
                                          elevation: 8.0,
                                          color: colors.background,
                                          shadowColor: colors.primary,
                                          shape: const CircleBorder(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                5.0), // Ajusta el padding para aumentar el tamaño del botón
                                            child: IconButton(
                                              iconSize:
                                                  28, // Aumenta el tamaño del ícono
                                              onPressed: item.onPressed,
                                              icon: Icon(
                                                item.icon,
                                                color: colors.primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: size.height * 0.001),
                          SizedBox(
                            height: 50, // Ajusta según tus necesidades
                            width: 200, // Ajusta según tus necesidades
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text(
                                'Iniciar Sesión',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            ref.read(bottomNavBarIndexProvider.notifier).state = value;
            context.go('/mapItems');
          },
          iconSize: 32,
          currentIndex: index,
          showSelectedLabels: false,
          selectedItemColor: colors.primary,
          unselectedItemColor: colors.inversePrimary,
          items: const [
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(CupertinoIcons.search)),
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(Icons.location_on_outlined)),
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(CupertinoIcons.square_grid_2x2)),
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(CupertinoIcons.gear)),
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(Icons.person_outline)),
          ]),
    );
  }
}

class MenuButtonIconItem {
  final IconData icon;
  final void Function()? onPressed;

  MenuButtonIconItem({required this.icon, required this.onPressed});
}
