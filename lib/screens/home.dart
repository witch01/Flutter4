

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_counter.dart';
import '../cubit/cubit_settings.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Практика 4'),
        actions: [
          ElevatedButton(
          child: Text('Тема'),
          onPressed: (){
            context.read<SettingCubit>().toogleTheme();
          },
      ),
        ],
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          <Widget>[
          BlocBuilder<CounterCubit,CounterState>(
          builder: (context, state) {

            return Center(child:
              Text('${state.count}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35
               ),
              )
            );

          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(

                onPressed: ()
                {
                  if(context.read<SettingCubit>().state.theme == ThemeData.light())
                  {
                    context.read<CounterCubit>().increment();   
                  }
                  else
                  {
                    context.read<CounterCubit>().increment(2);
                  }
                }, 
                child: Text(
                  '+',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.lime),
                ),
              ),


             ),
             Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                onPressed: ()
                {
                  if(context.read<SettingCubit>().state.theme == ThemeData.light())
                  {
                    context.read<CounterCubit>().decrement();
                  }
                  else
                  {
                    context.read<CounterCubit>().decrement(2); 
                  }
                }, 
                child: Text(
                  '-',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                    ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow),
                  
                ),
              )

             )
            ]
          ),
      ]
      ),
      ),
    );
  }
}