
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../custom_list/helper_function&list.dart';
import '../../provider/expence_provider.dart';
import '../../provider/multi_screen_provider.dart';


class MobileBillCostExpence extends StatefulWidget {
  const MobileBillCostExpence({Key? key}) : super(key: key);

  @override
  State<MobileBillCostExpence> createState() => _MobileBillCostExpenceState();
}

class _MobileBillCostExpenceState extends State<MobileBillCostExpence> {

  int total=0;
  String cat='';

  @override
  void didChangeDependencies() {
    Provider.of<MultiScreenProvider>(context,listen: false).getMobileBillCostExpence("Mobile Bill Cost");
    total=Provider.of<ExpenceProvider>(context,listen: true).getindivisualcost(cat);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor("#D0E0E8") ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.75,
              child: Consumer<MultiScreenProvider>(
                  builder:(context,provider,child)=>ListView.builder(
                    itemCount:provider.mobileBillCostExpenceList.length,
                    itemBuilder: (context, index) {

                      final expence = provider.mobileBillCostExpenceList[index];
                      cat=provider.mobileBillCostExpenceList[index].catagory;

                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 7),
                        child: ShowListTile(expence,context),
                      );
                    },

                  )
              ),
            ),
            Expanded(
              child: Container(
                color:HexColor("#D0E0E8"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[Text('Total Mobile Bill cost: \$''$total',
                    style: const TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
