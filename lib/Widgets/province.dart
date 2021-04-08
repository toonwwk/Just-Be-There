import 'package:flutter/material.dart';

import '../helper.dart';

class ListItem{
  int value;
  String name;
  ListItem(this.value, this.name);
}

class province extends StatefulWidget {
  final Color _color;

  province(this._color);
  @override
  provinceState createState() => provinceState();
}

class provinceState extends State<province> {

  List<ListItem> dropdownItems = [
    ListItem(0,"Select interested province"),
    ListItem(1,"Amnat Charoen"),
    ListItem(2,"Ang Thong"),
    ListItem(3,"Ayutthaya"),
    ListItem(4,"Bangkok"),
    ListItem(5,"Bueng Kan"),
    ListItem(6,"Buriram"),
    ListItem(7,"Chachoengsao"),
    ListItem(8,"Chai Nut"),
    ListItem(9,"Chaiyaphum"),
    ListItem(10,"Chanthaburi"),
    ListItem(11,"Chiang Mai"),
    ListItem(12,"Chaing Rai"),
    ListItem(13,"Chonburi"),
    ListItem(14,"Chumphon"),
    ListItem(15,"Kalasin"),
    ListItem(16,"Kamphaeng Phet"),
    ListItem(17,"Kanchanaburi"),
    ListItem(18,"Khonkaen"),
    ListItem(19,"Krabi"),
    ListItem(20,"Lampang"),
    ListItem(21,"Lamphun"),
    ListItem(22,"Loei"),
    ListItem(23,"Lopburi"),
    ListItem(24,"Mae Hong Son"),
    ListItem(25,"Maha Sarakham"),
    ListItem(26,"Mukdahan"),
    ListItem(27,"Nakhon Nayok"),
    ListItem(28,"Nakhon Pathom"),
    ListItem(29,"Nakhon Phanom"),
    ListItem(30,"Nakhon Ratchasima"),
    ListItem(31,"Nakhon Sawan"),
    ListItem(32,"Nakhon Si Thammarat"),
    ListItem(33,"Nan"),
    ListItem(34,"Narathiwat"),
    ListItem(35,"Nong Bua Lamphu"),
    ListItem(36,"Nong Khai"),
    ListItem(37,"Nonthaburi"),
    ListItem(38,"Pahum Thani"),
    ListItem(39,"Pattani"),
    ListItem(40,"Phang Nga"),
    ListItem(41,"Phatthalung"),
    ListItem(42,"Phayao"),
    ListItem(43,"Phetchabun"),
    ListItem(44,"Phetchaburi"),
    ListItem(45,"Phichit"),
    ListItem(46,"Phitsanulok"),
    ListItem(47,"Phrae"),
    ListItem(48,"Phuket"),
    ListItem(49,"Prachin Buri"),
    ListItem(50,"Prachuap Khiri Khan"),
    ListItem(51,"Ranong"),
    ListItem(52,"Ratchaburi"),
    ListItem(53,"Rayong"),
    ListItem(54,"Roi Et"),
    ListItem(55,"Sa Kaeo"),
    ListItem(56,"Sakon Nakhon"),
    ListItem(57,"Samut Prakan"),
    ListItem(58,"Samut Sakhon"),
    ListItem(59,"Samut Songkhram"),
    ListItem(60,"Saraburi"),
    ListItem(61,"Satun"),
    ListItem(62,"Sing Buri"),
    ListItem(63,"Sisaket"),
    ListItem(64,"Songkhla"),
    ListItem(65,"Sukhothai"),
    ListItem(66,"Suphan Buri"),
    ListItem(67,"Surat Thani"),
    ListItem(68,"Surin"),
    ListItem(69,"Tak"),
    ListItem(70,"Trang"),
    ListItem(71,"Trat"),
    ListItem(72,"Ubon Ratchathani"),
    ListItem(73,"Udon Thani"),
    ListItem(74,"Uthai Thani"),
    ListItem(75,"Uttaradit"),
    ListItem(76,"Yala"),
    ListItem(77,"Yasothon"),


  ];

  List<DropdownMenuItem<ListItem>> dropdownMenuItems;
  ListItem selectedItem;

  void initState() {
    super.initState();
    dropdownMenuItems = buildDropDownMenuItems(dropdownItems);
    selectedItem = dropdownMenuItems[0].value;

  }
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();

    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text("    " + listItem.name),

          value: listItem,
        ),
      );
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 40,
      height: 40,
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
               color: appColor.green,
          ),

        ),

        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            iconDisabledColor: appColor.darkGray,
            iconEnabledColor: appColor.darkGray,
            style: appTextStyle.regular15Green,
            value: selectedItem,
            items: dropdownMenuItems,
            onChanged: (value){
              setState(() {
                selectedItem = value;
              });
            },
          )
        )
      )
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}
