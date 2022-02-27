import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: '도로명으로 검색',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                prefixIconConstraints: const BoxConstraints(minWidth: 24)),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 48),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.compass,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                '현재위치로 찾기',
                style: Theme.of(context).textTheme.button,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.image),
                  title: Text('address $index'),
                  subtitle: Text('sub title $index'),
                  trailing: ExtendedImage.asset('assets/images/tomato.png'),
                );
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
