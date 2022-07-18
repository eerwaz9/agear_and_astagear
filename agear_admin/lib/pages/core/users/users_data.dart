


import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';


import '../../function.dart';
import 'edit.dart';

List<UsersData> userList = null;
class UsersData {
     int use_id;
  String use_name;
  String use_pwd;
  String use_mobile;
  bool checkActive;
  String use_lastdatetime;
  String use_note;
  UsersData(
      {this.use_id,
      this.use_name,
      this.use_pwd,
      this.use_lastdatetime,
      this.use_mobile,
      this.checkActive,
      this.use_note});
  UsersData.fromJson(Map<String, dynamic> json) {
     use_id = json['use_id'];
    use_name = json['use_name'];
    use_mobile = json['use_mobile'];
    use_pwd = json['use_pwd'];
     checkActive = json['checkActive'];
     use_lastdatetime = json['use_lastdatetime'];
    use_note = json['use_note'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['use_id'] = this.use_id;
    data['use_name'] = this.use_name;
    data['use_mobile'] = this.use_mobile;
    data['use_pwd'] = this.use_pwd;
    data['checkActive'] = this.checkActive;
    data['use_lastdatetime'] = this.use_lastdatetime;
    data['use_note'] = this.use_note;
    return data;
  }
}

// class UsersData {
//   String use_id;
//   String use_name;
//   String use_pwd;
//   String use_mobile;
//   bool use_active;
//   String use_lastdate;
//   String use_note;
//   UsersData(
//       {this.use_id,
//       this.use_name,
//       this.use_pwd,
//       this.use_lastdate,
//       this.use_mobile,
//       this.use_active,
//       this.use_note});
// }

class SingleUser extends StatelessWidget {
  int use_index;
  UsersData users;
  SingleUser({this.use_index, this.users});
  @override
  Widget build(BuildContext context) {
    var providerUser = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              userList.removeAt(use_index);
              deleteData("use_id", users.use_id.toString(), "users/delete_user.php");
              providerUser.add_loading();
            },
            child: Container(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.cancel,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                users.use_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(users.use_mobile), Text(users.use_lastdatetime.toString())]),
              trailing: Container(
                width: 30.0,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new EditUsers(
                                      use_index: use_index,
                                      users: users,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: FaIcon(
                          FontAwesomeIcons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
