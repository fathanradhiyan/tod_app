part of 'pages.dart';

class QuestionListPage extends StatefulWidget {
  final List<Question> qTruthList;
  final List<Question> qDareList;

  QuestionListPage(
      {Key? key, required this.qDareList, required this.qTruthList})
      : super(key: key);

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  bool _isDelete = false;
  bool _isEdit = false;
  TextEditingController? _questionController;

  @override
  void initState() {
    // TODO: implement initState
    _questionController = TextEditingController();

       refreshList(qTruthList: widget.qTruthList, qDareList: widget.qDareList).then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: darcula,
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.amber,
                )),
            backgroundColor: darcula,
            // elevation: 0,
            title: Text(
              'Question List',
              style: mainStyle.copyWith(color: Colors.amber, fontSize: 24),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelStyle: mainStyle.copyWith(
                  letterSpacing: 3, fontWeight: FontWeight.w500, fontSize: 16),
              indicatorColor: secondaryColor,
              labelColor: Colors.amber,
              unselectedLabelStyle: mainStyle.copyWith(letterSpacing: 3),
              tabs: [
                Tab(
                  child: Container(width: size.width, child: Text('Text', textAlign: TextAlign.center, style: mainStyle.copyWith(letterSpacing: 3, color: secondaryColor),))
                ),
                Tab(
                  text: 'Dare',
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    widget.qTruthList.isEmpty
                        ? Container(
                            child: Center(
                              child: Text('Empty List'),
                            ),
                          )
                        : ListView(
                            shrinkWrap: true,
                            children: List.generate(widget.qTruthList.length,
                                (index) {
                              return QuestionCardWidget(
                                item: widget.qTruthList[index],
                                isDelete: _isDelete,
                                isEdit: _isEdit,
                                onDelete: () async {
                                  await QuestionDatabase.instance.delete(
                                      widget.qTruthList[index].questionId!);
                                  refreshList(
                                      qTruthList: widget.qTruthList,
                                      qDareList: widget.qDareList);
                                  setState(() {

                                  });
                                },
                                onEdit: () {
                                  _questionController!.text = widget.qTruthList[index].question!;
                                  customPopup(context,
                                      // color: (_noFieldEmpty)? Colors.blueGrey : Colors.grey,
                                      title: Text(
                                        'Update Question',
                                        textAlign: TextAlign.center,
                                        style: mainStyle.copyWith(
                                          color: Colors.amber,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: size.height * 0.15,
                                        child: textBox(
                                          height: 56,
                                          title: "Question",
                                          isImportant: true,
                                          child: TextField(
                                              style: mainStyle.copyWith(fontSize: 14),
                                              keyboardType: TextInputType.text,
                                              controller: _questionController,
                                              maxLines: 1,
                                              maxLength: 225,
                                              decoration: InputDecoration(
                                                counterText: "",
                                                isDense: true,
                                                contentPadding: EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 8),
                                                border: InputBorder.none,
                                                hintStyle: mainStyle.copyWith(
                                                    color: Colors.grey[500], fontSize: 14),
                                                hintText: 'Input Question',
                                              )),
                                        ),
                                      ), onCancel: () {
                                        Get.back();
                                        setState(() {
                                          _questionController!.clear();
                                        });
                                      }, onOk: () async{
                                        await QuestionDatabase.instance.update(Question(
                                            questionId: widget.qTruthList[index].questionId,
                                            question: _questionController!.text,
                                            isTruth: widget.qTruthList[index].isTruth
                                        ));
                                        refreshList(qTruthList: widget.qTruthList, qDareList: widget.qDareList);
                                        setState(() {
                                          _questionController!.clear();
                                        });
                                        Get.back(result: true);
                                      }).then((value) {
                                    setState(() {

                                    });
                                  });
                                },
                              );
                            }),
                          ),
                    widget.qDareList.isEmpty
                        ? Container(
                            child: Center(
                              child: Text('Empty List'),
                            ),
                          )
                        : ListView(
                            shrinkWrap: true,
                            children:
                                List.generate(widget.qDareList.length, (index) {
                              return QuestionCardWidget(
                                item: widget.qDareList[index],
                                isDelete: _isDelete,
                                isEdit: _isEdit,
                                onDelete: () async {
                                  await QuestionDatabase.instance.delete(
                                      widget.qDareList[index].questionId!);
                                  refreshList(
                                      qTruthList: widget.qTruthList,
                                      qDareList: widget.qDareList);
                                  setState(() {});
                                },
                                onEdit: () {
                                  _questionController!.text = widget.qDareList[index].question!;
                                  customPopup(context,
                                      // color: (_noFieldEmpty)? Colors.blueGrey : Colors.grey,
                                      title: Text(
                                        'Update Question',
                                        textAlign: TextAlign.center,
                                        style: mainStyle.copyWith(
                                          color: Colors.amber,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: size.height * 0.15,
                                        child: textBox(
                                          height: 56,
                                          title: "Question",
                                          isImportant: true,
                                          child: TextField(
                                              style: mainStyle.copyWith(fontSize: 14),
                                              keyboardType: TextInputType.text,
                                              controller: _questionController,
                                              maxLines: 1,
                                              maxLength: 225,
                                              decoration: InputDecoration(
                                                counterText: "",
                                                isDense: true,
                                                contentPadding: EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 8),
                                                border: InputBorder.none,
                                                hintStyle: mainStyle.copyWith(
                                                    color: Colors.grey[500], fontSize: 14),
                                                hintText: 'Input Question',
                                              )),
                                        ),
                                      ), onCancel: () {
                                        Get.back();
                                        setState(() {
                                          _questionController!.clear();
                                        });
                                      }, onOk: () async{
                                        await QuestionDatabase.instance.update(Question(
                                            questionId: widget.qDareList[index].questionId,
                                            question: _questionController!.text,
                                            isTruth: widget.qDareList[index].isTruth
                                        ));
                                        refreshList(qTruthList: widget.qTruthList, qDareList: widget.qDareList);
                                        setState(() {
                                          _questionController!.clear();
                                        });
                                        Get.back(result: true);
                                      }).then((value) {
                                    setState(() {

                                    });
                                  });
                                },
                              );
                              ;
                            }),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEdit = !_isEdit;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          // minimumSize: Size.zero,
                          padding: EdgeInsets.all(12),
                          backgroundColor: _isEdit ? Colors.amber : darcula,
                          side: BorderSide(width: 1, color: Colors.amber),
                        ),
                        child: Text(
                          'Edit',
                          style: mainStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color: _isEdit ? darcula : Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isDelete = !_isDelete;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          // minimumSize: Size.zero,
                          padding: EdgeInsets.all(12),
                          backgroundColor:
                              _isDelete ? Colors.redAccent : darcula,
                          side: BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        child: Text(
                          'Delete',
                          style: mainStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color:
                                  _isDelete ? Colors.white : Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
