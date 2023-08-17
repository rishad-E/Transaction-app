import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transaction_app/model/transactionmodel.dart';
import 'package:transaction_app/widgets/widgethome.dart';

class TransactionHome extends StatelessWidget {
  const TransactionHome({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    List<TransactionData> transaction =
        jsonData.map((json) => TransactionData.fromJson(json)).toList();
    final ValueNotifier<List<TransactionData>> transList =
        ValueNotifier<List<TransactionData>>(transaction);
    void searchTransactions(String query) {
      transList.value = transaction.where((element) {
        return element.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 247, 247, 247),
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.download,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 80.w,
                          child: TextField(
                            controller: searchcontroller,
                            onChanged: (key) {
                              searchTransactions(key);
                            },
                            cursorColor: Colors.grey,
                            cursorHeight: 20,
                            cursorWidth: 2,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                                hintText: 'Search vessel',
                                hintStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 153, 158, 162)),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 5, 7, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 227, 231, 235),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 5.h,
                            width: 11.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromARGB(255, 227, 231, 235)),
                            child: const Center(
                                child: Icon(
                              Icons.filter_alt,
                              color: Colors.grey,
                            )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 8,
              child: ValueListenableBuilder(
                valueListenable: transList,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return listtileTrans(
                          amount: value[index].amount,
                          color:
                              value[index].transactionType == "CONVERSION_BUY"
                                  ? Colors.green
                                  : Colors.black,
                          currency: value[index].currency,
                          icon: value[index].transactionType == "CONVERSION_BUY"
                              ? Icons.south_west_rounded
                              : Icons.north_east_rounded,
                          date: value[index].createdAt.toString(),
                          name: value[index].description);
                    },
                  );
                },
              ))
        ],
      )),
    );
  }
}
