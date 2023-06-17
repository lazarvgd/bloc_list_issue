import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/home_screen/bloc/home_screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
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
              loaded: (coins) {
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
      ),
    );
  }
}