import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/ui/widgets/course_page.dart';
import 'package:playground_app/mvos/ui/widgets/loginPage_form.dart';
import 'package:provider/provider.dart';
import 'package:wamf_playground/wamf_playground.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Playground(title: "This is Playground", toys: [
        ToyBox(
          issue: '#32',
          title: 'Login Form',
          toys: [
            Toy(
              title: 'Login Form success',
              issue: '#32',
              builder: (context) => Provider<LoginA>.value(
                child: LoginForm(),
                value: LoginA(
                    login: ({String email, String password,bool rememberMe}) async =>
                        print('email: $email password: $password')),
              ),
            ),
            Toy(
              title: 'Login Form error',
              issue: '#32',
              builder: (context) => Provider<LoginA>.value(
                child: LoginForm(),
                value: LoginA(
                    login: ({String email, String password,bool rememberMe}) async =>
                        throw ('login failed')),
              ),
            )
          ],
        ),
        ToyBox(
          issue: "#51",
          title: "Course page",
          toys: <Toy>[
            Toy(
              title: 'Course Tile',
              issue: '#51',
              builder: (context) {
                var courseO = CourseO(
                  courseID: '1',
                  name: 'Dart Introduction 1',
                  color: Colors.blue,
                  description: 'Basic steps into programming',
                );
                return Provider<ActiveCourseO>.value(
                  value: ActiveCourseO(activeCourse: courseO),
                  child: Consumer<CourseO>(
                    builder: (context, value, child) {
                      return CoursePage();
                    },
                  ),
                );
              },
            )
          ],
        )
      ]),
    );
  }
}
