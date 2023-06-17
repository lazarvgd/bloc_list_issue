import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/home_screen/bloc/home_screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<HomeScreenBloc>().add(
                          const HomeScreenEvent.refresh(),
                        );
                  },
                  child: const Icon(Icons.refresh),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    context.read<HomeScreenBloc>().add(
                          const HomeScreenEvent.fetch(),
                        );
                  },
                  child: const Icon(Icons.download),
                ),
              ],
            ),
            appBar: AppBar(),//sorry about last min editing
            body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                debugPrint('state: $state');
                return state.when(
                  initial: () {
                    return const Center(
                      child: Text('Welcome'),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (coins, _) {
                    return ListView.builder(
                      itemCount: coins.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                            title: Text('Item $index'),
                            trailing: IconButton(
                              icon: Icon(
                                coins[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed: () {
                                context.read<HomeScreenBloc>().add(
                                      HomeScreenEvent.addToFavorites(
                                        coin: coins[index],
                                      ),
                                    );
                              },
                            ));
                      },
                    );
                  },
                  error: () {
                    return const Center(
                      child: Text('Error'),
                    );
                  },
                );
              },
            ),
          );
        }
      ),
    );
  }
}
