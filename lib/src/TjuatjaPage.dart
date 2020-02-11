import 'package:flutter/material.dart';

class CollectPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1,
      child: GestureDetector(
        onTap: () {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          Navigator.of(context)
              .pushReplacementNamed('signup/choose_credentials');
        },
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('Collect Personal Info Page'),
              OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('tjuatja/choose_credentials');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseCredentialsPage extends StatelessWidget {
  const ChooseCredentialsPage({
    this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChooseCredentialsPage'),
      ),
      body: Center(
        child: new IconButton(
          icon: new Icon(Icons.arrow_right),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: onSignupComplete,
    //   child: DefaultTextStyle(
    //     style: Theme.of(context).textTheme.display1,
    //     child: Container(
    //       color: Colors.pinkAccent,
    //       alignment: Alignment.center,
    //       child: Text('Choose Credentials Page'),
    //     ),
    //   ),
    // );
  }
}

class TjuatjaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SignUpPage builds its own Navigator which ends up being a nested
    // Navigator in our app.
    return Navigator(
      initialRoute: 'tjuatja/personal_info',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'tjuatja/personal_info':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => CollectPersonalInfoPage();
            break;
          case 'tjuatja/choose_credentials':
            // Assume ChooseCredentialsPage collects new credentials and then
            // invokes 'onSignupComplete()'.
            builder = (BuildContext _) => ChooseCredentialsPage(
                  onSignupComplete: () {
                    // Referencing Navigator.of(context) from here refers to the
                    // top level Navigator because SignUpPage is above the
                    // nested Navigator that it created. Therefore, this pop()
                    // will pop the entire "sign up" journey and return to the
                    // "/" route, AKA HomePage.
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushNamed('login');
                  },
                );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
