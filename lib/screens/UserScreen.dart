import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:tracking_admin_panel/providers/placeProvider.dart';
import 'package:tracking_admin_panel/providers/userProvider.dart';
import 'package:tracking_admin_panel/routes/router.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final PlaceProvider placeProvider = Provider.of<PlaceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Users panel"),
        actions: [
          IconButton(
              onPressed: () async {
                await userProvider.getUsers();
                await placeProvider.getPlaces();
              },
              icon: const Icon(Icons.sync_outlined))
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          context.router.push(MainRoute());
                        },
                        title: const Text("Главная"),
                      ),
                      ListTile(
                        onTap: () {
                          context.router.push(UserRoute());
                        },
                        title: const Text("Сотрудники"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
              child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SfDataGrid(
            source:
                BalanceDataSource(balance: context.read<UserProvider>().users),
            columns: [
              GridColumn(
                  columnName: 'number',
                  width: 70,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '№',
                      ))),
              GridColumn(
                  columnName: 'name',
                  width: 200,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Имя',
                      ))),
              GridColumn(
                  columnName: 'surname',
                  width: 200,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Фамилия',
                      ))),
              GridColumn(
                  columnName: 'post',
                  width: 200,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Должность',
                      ))),
              GridColumn(
                  columnName: 'imei',
                  width: 150,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'IMEi',
                      ))),
            ]),
      ))),
    );
  }
}

class BalanceDataSource extends DataGridSource {
  BalanceDataSource({required List<Map<String, dynamic>> balance}) {
    _employees = balance
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'number', value: e['number']),
              // DataGridCell<String>(
              //     columnName: 'registrator', value: e.registrator),
              DataGridCell<String>(columnName: 'name', value: e['name']),
              DataGridCell<String>(columnName: 'surname', value: e['surname']),
              DataGridCell<String>(columnName: 'post', value: e['post']),
              DataGridCell<String>(columnName: 'imei', value: e['imei']),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        child: Text(summaryValue));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        decoration: BoxDecoration(),
        width: 50,
        alignment: (Alignment.center),
        padding: EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
