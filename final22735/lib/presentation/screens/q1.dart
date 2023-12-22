import 'package:final22735/business%20logic/cubits/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final22735/data/model/data_model.dart';
import 'package:final22735/data/model/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Q1 extends StatefulWidget {
  const Q1({super.key});

  @override
  State<Q1> createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  @override
  void initState() {
    super.initState();
    context.read<DataCubit>().fetchData();
  }

  Future<List<DataModel>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('transactions').get();
    return querySnapshot.docs.map((doc) {
      return DataModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: const [Icon(Icons.more_horiz)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Day"),
                    Text(
                      "Date",
                    )
                  ],
                ),
                Text("money", style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Transaction"),
              ],
            ),
            FutureBuilder<List<DataModel>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final dataModel = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                                dataModel.transaction[0].imageUrl),
                            title: Text(dataModel.transaction[0].title),
                            subtitle: Text(dataModel.transaction[0].subtitle),
                            trailing: Text(
                                '\$${dataModel.transaction[0].amount.toString()}'),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
