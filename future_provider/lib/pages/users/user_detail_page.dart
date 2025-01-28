import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:future_provider/pages/users/users_providers.dart';

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Detail'),
        ),
        body: userDetail.when(
            data: (userDetail) => RefreshIndicator(
                  onRefresh: () =>
                      ref.refresh(userDetailProvider(userId).future),
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    children: [
                      const Divider(),
                      UserInfoRow(
                        icon: Icons.account_circle,
                        userData: userDetail.name,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      UserInfoRow(
                        icon: Icons.mail_rounded,
                        userData: userDetail.email,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      UserInfoRow(
                        icon: Icons.phone_enabled,
                        userData: userDetail.phone,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      UserInfoRow(
                        icon: Icons.web_rounded,
                        userData: userDetail.website,
                      ),
                    ],
                  ),
                ),
            error: (e, st) => Center(
                    child: Text(
                  e.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }
}

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
    required this.icon,
    required this.userData,
  });
  final IconData icon;
  final String userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        Text(
          userData,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
