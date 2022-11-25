import 'package:dad_jokes/components/components.dart';
import 'package:dad_jokes/constants/colors.dart';
import 'package:dad_jokes/cubit/main_cubit.dart';
import 'package:dad_jokes/cubit/main_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = MainCubit.get(context);
        return Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: Column(
                children: [
                  const Text(
                    'Choose A Color To App',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        colors.length,
                        (index) => GestureDetector(
                              onTap: () {
                                c.changeAppColor(index);
                              },
                              child: BuildColorPalletItem(
                                color: colors[index],
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text('Dad Jokes'),
            backgroundColor: mainColor,
            actions: [
              IconButton(
                onPressed: () {
                  MainCubit.get(context).getRandomJoke();
                },
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RefreshIndicator(
              onRefresh: () {
                return MainCubit.get(context).getRandomJoke();
              },
              child: Center(
                child: c.jokes.isEmpty
                    ? const CircularProgressIndicator()
                    : ListView.separated(
                        itemCount: c.jokes.length,
                        itemBuilder: (context, index) => BuildJokeItem(
                          model: c.jokes[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
