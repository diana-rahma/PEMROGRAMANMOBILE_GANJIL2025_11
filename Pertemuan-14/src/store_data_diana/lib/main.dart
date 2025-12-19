import 'package:flutter/material.dart';
import 'package:store_data_diana/model/pizza.dart';
import 'package:store_data_diana/model/pizza_detail.dart';
import 'package:store_data_diana/model/httphelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Pizza>> pizzas;
  HttpHelper helper = HttpHelper();

  @override
  void initState() {
    super.initState();
    pizzas = helper.getPizzaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: FutureBuilder<List<Pizza>>(
        future: pizzas,
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Click + to add Pizza'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int position) {
              return Dismissible(
                key: Key(position.toString()),
                onDismissed: (direction) {
                  HttpHelper helper = HttpHelper();
                  int pizzaId = snapshot.data![position].id!;
                  setState(() {
                    snapshot.data!.removeAt(position);
                  });
                  helper.deletePizza(pizzaId);
                },
                child: ListTile(
                  title: Text(snapshot.data![position].pizzaName ?? ''),
                  subtitle: Text(snapshot.data![position].description ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailScreen(
                          pizza: snapshot.data![position],
                          isNew: false,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PizzaDetailScreen(pizza: Pizza(), isNew: true),
            ),
          );
        },
      ),
    );
  }
}
