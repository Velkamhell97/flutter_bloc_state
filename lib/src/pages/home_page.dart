import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_state/src/bloc/user/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/detail'), 
            icon: const Icon(Icons.arrow_forward)
          ),
          IconButton(
            onPressed: () => context.read<UserBloc>().add(DeleteUser()),
            icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<UserBloc, UserState>(
          // buildWhen: (previous, current) =>  //Es como un tipo de selector,
          builder: (_, state) { //-El state es el initial state
            if(!state.existUser){
              return const Center(child: Text('There is not loaded user'));
            } 

            final user = state.user!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('General', style: Theme.of(context).textTheme.titleLarge),
                ListTile(title: Text('Name: ${user.name}')),
                ListTile(title: Text('Age: ${user.age ?? ''}')),

                const SizedBox(height: 10.0),

                Text('Professions', style: Theme.of(context).textTheme.titleLarge),
                for(String profession in user.professions) ListTile(title: Text(profession))
              ],
            ); 
          },
        )
      )
    );
  }
}