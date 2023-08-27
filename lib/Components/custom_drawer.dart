import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              padding: EdgeInsets.all(0.0),
              child: Container(
                  child: Center(
                      child: Text(
                "Welcome to Bill Split Calculator App",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.020),
              )))),

          ///ListTile
          Card(
            child: ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text("Simple Calculator"),
              subtitle: Text("This Feature is Coming soon"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text("BMI Calculator"),
              subtitle: Text("This Feature is Coming soon"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text("About Us"),
              subtitle: Text("This Feature is Coming soon"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text("Feedback"),
              subtitle: Text("This Feature is Coming soon"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text("License agreement"),
              subtitle: Text("This Feature is Coming soon"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),

          Container(
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 1,
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "App Version 1.0.0+1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 1,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
