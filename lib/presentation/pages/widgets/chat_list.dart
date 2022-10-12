import 'dart:math';

import 'package:firestore_clean_architecture/core/utils/finite_state.dart';
import 'package:firestore_clean_architecture/presentation/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    Color randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Consumer<ContactProvider>(builder: (context, notifier, _) {
      if (notifier.myState == MyState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (notifier.myState == MyState.hasData) {
        return ListView.builder(
          itemCount: notifier.contacts.length,
          itemBuilder: (context, index) {
            final data = notifier.contacts[index];

            return ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: randomColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    data.name[0],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: Text(
                data.name,
              ),
              subtitle: Text(
                data.phone.toString(),
              ),
            );
          },
        );
      } else if (notifier.myState == MyState.hasNoData) {
        return const Center(
          child: Text("Tidak ada data contact"),
        );
      } else {
        return const Center(
          child: Text("Gagal mendapatkan data/gagal connect ke server"),
        );
      }
    });
  }
}
