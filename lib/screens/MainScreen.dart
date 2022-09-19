import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:tracking_admin_panel/providers/placeProvider.dart';
import 'package:tracking_admin_panel/providers/userProvider.dart';
import 'package:tracking_admin_panel/routes/router.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final PlaceProvider placeProvider = Provider.of<PlaceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tracking panel"),
        actions: [
          IconButton(
              onPressed: () async {
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
            allowSorting: true,
            columnWidthMode: ColumnWidthMode.fitByCellValue,
            allowColumnsResizing: true,
            onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
              return true;
            },
            source: BalanceDataSource(
                balance: context.read<PlaceProvider>().places),
            columns: [
              GridColumn(
                  columnName: 'number',
                  width: 50,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '№',
                      ))),
              GridColumn(
                  columnName: 'user',
                  width: MediaQuery.of(context).size.width / 4,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'ID',
                      ))),
              GridColumn(
                  columnName: 'name',
                  width: MediaQuery.of(context).size.width / 4,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Имя',
                      ))),
              GridColumn(
                  columnName: 'date',
                  width: MediaQuery.of(context).size.width / 4,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Дата',
                      ))),
              GridColumn(
                  columnName: 'status',
                  width: MediaQuery.of(context).size.width / 4,
                  autoFitPadding: const EdgeInsets.all(0),
                  label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Статус',
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
              DataGridCell<String>(columnName: 'user', value: e['user']),
              DataGridCell<String>(columnName: 'name', value: e['name']),
              DataGridCell<String>(columnName: 'date', value: e['date']),
              DataGridCell<bool>(columnName: 'status', value: e['status']),
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
      return dataGridCell.columnName == 'status'
          ? Center(
              child: Container(
                child: dataGridCell.value == true
                    ? Text(
                        "Работает",
                        style: TextStyle(color: Colors.greenAccent),
                      )
                    : Text(
                        "Неработает",
                        style: TextStyle(color: Colors.redAccent),
                      ),
              ),
            )
          : Container(
              decoration: BoxDecoration(),
              width: 50,
              alignment: (Alignment.center),
              padding: EdgeInsets.all(16.0),
              child: Text(dataGridCell.value.toString()),
            );
    }).toList());
  }
}
