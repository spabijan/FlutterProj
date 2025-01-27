import 'package:dart_data_class_generator/pages/user_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/model/user.dart';
import 'package:dart_data_class_generator/repositories/fetch_users.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  String error = '';
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      setState(() => loading = true);
      users = await fetchUser();
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: loading
            ? const CircularProgressIndicator()
            : error.isEmpty
                ? ListUsers(
                    users: users,
                  )
                : buildError());
  }

  Widget buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: const TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: _fetchUsers,
                child: const Text(
                  'Retry',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}

class ListUsers extends StatelessWidget {
  const ListUsers({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        final user = users[index];
        return ListTile(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => UserDetailPage(user: user))),
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.name),
        );
      },
    );
  }
}
