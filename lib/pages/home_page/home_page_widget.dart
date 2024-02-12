import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Scores',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.8,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowDataTable<dynamic>(
                controller: _model.paginatedDataTableController,
                data: paginatedDataTableRecordList,
                columnsBuilder: (onSortChanged) => [
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'Edit Header 1',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'Edit Header 2',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'Edit Header 3',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                ],
                dataRowBuilder: (Item, paginatedDataTableIndex, selected,
                        onSelectChanged) =>
                    DataRow(
                  color: MaterialStateProperty.all(
                    paginatedDataTableIndex % 2 == 0
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  cells: [
                    Text(
                      'Edit Column 1',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      'Edit Column 2',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      'Edit Column 3',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ].map((c) => DataCell(c)).toList(),
                ),
                paginated: true,
                selectable: false,
                hidePaginator: false,
                showFirstLastButtons: false,
                headingRowHeight: 56.0,
                dataRowHeight: 48.0,
                columnSpacing: 20.0,
                headingRowColor: FlutterFlowTheme.of(context).primary,
                borderRadius: BorderRadius.circular(8.0),
                addHorizontalDivider: true,
                horizontalDividerColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                horizontalDividerThickness: 1.0,
                addVerticalDivider: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
