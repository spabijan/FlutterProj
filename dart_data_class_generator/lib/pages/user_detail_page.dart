import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/model/user.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            child:
                Text(user.id.toString(), style: const TextStyle(fontSize: 18)),
          ),
          title: Text(user.username),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('name: ${user.name}'),
                Text('email: ${user.email}'),
                Text('phone: ${user.phone}'),
                Text('website: ${user.website}'),
              ],
            ),
          ),
          Container(
            color: Colors.brown[50],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ShowAddress(address: user.address),
          ),
          Container(
            color: Colors.amber[50],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ShowCompany(company: user.company),
          )
        ],
      ),
    );
  }
}

class ShowAddress extends StatelessWidget {
  const ShowAddress({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('street ${address.street}'),
        Text('suite ${address.suite}'),
        Text('city: ${address.city}'),
        Text('zip code: ${address.zipcode}'),
        Row(
          children: [
            Text('latitude: ${address.geo.lat}'),
            Text('longitude: ${address.geo.lng}')
          ],
        )
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  const ShowCompany({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('name: ${company.name}'),
        Text('catch: ${company.catchPhrase}'),
        Text('bs ${company.bs}')
      ],
    );
  }
}
