import 'package:flutter/material.dart';
import 'package:playground_app/mvos/ui/widgets/my_custom_form.dart';
import 'package:playground_app/mvos/ui/widgets/playground.dart';



class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Playground(title: "This is Playground", toys: [
      ToyBox(
        issue: 'WAMF-1',
        title: 'Flat Button',
        issueUrl: 'www.wearemobilefirst.com',
        authorEmail: 'matej@wearemobilefirst.com',
        tags: ['atom'],
        toys: [
          Toy(
            title: 'Button Disabled',
            builder: (context) =>
                FlatButton(
                    onPressed: null, child: Text("Flat Button Disabled")),
          ),
          Toy(
              title: 'Button Enabled',
              builder: (context) =>
                  FlatButton(
                      onPressed: () {},
                      child: Text("Flat Button Enabled"))),
        ],
      ),
      ToyBox(
        tags: ['molecule'],
        issue: "WAMF-2",
        title: "Form Molecule",
        issueUrl: 'www.wearemobilefirst.com',
        authorEmail: 'matej@wearemobilefirst.com',
        toys: [
          Toy(
            builder: (context) => MyCustomForm(),
            title: "Default Style",
          )
        ],
      ),
      ToyBox(
        issue: "WAMF-3",
        title: "Grid View",
        tags: ['organism'],
        toys: [
          Toy(
            title: 'black cupertino',
            builder: (context) =>
                GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 items.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Typography.blackCupertino.headline,
                      ),
                    );
                  }),
                ),
          ),
          Toy(
            title: 'black mountain',
            builder: (context) =>
                GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 items.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Typography.blackMountainView.headline,
                      ),
                    );
                  }),
                ),
          ),
          Toy(
            title: 'englishLike',
            builder: (context) =>
                GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 items.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Typography.englishLike2018.headline,
                      ),
                    );
                  }),
                ),
          ),
        ],
      ),
      Toy(
        title: 'only Toy',
        tags: [
          'dev',
        ],
        builder: (context) =>
            Center(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.pink,
              ),
            ),
      )
    ]),
    );
  }
}



