import 'package:flutter/material.dart';
import 'package:righter/services/auth.dart';
import 'package:righter/services/database/database.dart';

class Profile extends StatefulWidget {
  final String username;
  final String uid;
  Profile({this.username, this.uid});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String imageLocation = 'assets/images/default.jpg';
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _currentName;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void _showEditingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Edit username',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(fillColor: Colors.grey),
                        initialValue: widget.username,
                        validator: (value) =>
                            value.isEmpty ? 'Username cannot be empty' : null,
                        onChanged: (value) =>
                            setState(() => _currentName = value),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        child: Text('Update',
                            style: Theme.of(context).textTheme.subtitle1),
                        color: Theme.of(context).accentColor,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: widget.uid)
                                .updateUsername(
                                    _currentName ?? widget.username);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ));
          });
    }

    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage(imageLocation),
                radius: 50.0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  onTap: () {
                    print('Delete or change dp ');
                  },
                  //child: ,
                  //behavior: HitTestBehavior.opaque,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'NAME',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  FlatButton.icon(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    label: Text(''),
                    onPressed: () => _showEditingPanel(),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                widget.username,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 30.0),
              Text(
                'CURRENT NINJA LEVEL',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '8',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 30.0),
              Text(
                'LEAGUE',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Gold',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 30.0),
              Text(
                'BEST STREAK',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '30 days',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'brucelee@1inch.punch',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ButtonTheme(
                  minWidth: width,
                  height: 55,
                  child: OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () async {
                      await _authService.signOut();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(width: width * 0.01),
                        Text('Sign out',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
