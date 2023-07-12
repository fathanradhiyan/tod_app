part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum Type { Truth, Dare }

class _HomePageState extends State<HomePage> {
  late List<Question> questionList = [];
  late List<Question> qTruthList = [];
  late List<Question> qDareList = [];
  TextEditingController? _questionController;
  String? selectedCategory;
  bool isTruth = true;
  final _random = new Random();

  onTapCategory(Type typeInput) {
    if (typeInput == Type.Truth) {
      isTruth = true;
    } else {
      isTruth = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _questionController = TextEditingController();

    refreshList(qTruthList: qTruthList, qDareList: qDareList);
    super.initState();
  }

  // Future refreshList() async {
  //   qTruthList.clear();
  //   qDareList.clear();
  //
  //   questionList = await QuestionDatabase.instance.readAllItems();
  //
  //   for(int i = 0; i < questionList.length; i++){
  //     if(questionList[i].isTruth == 0){
  //       qTruthList.add(questionList[i]);
  //     }else qDareList.add(questionList[i]);
  //   }
  //
  //   setState(() {
  //
  //   });
  // }

  List listCategory = [
    "Truth",
    "Dare",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darcula,
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            SizedBox(height: size.height * 0.3, child: LottieBuilder.asset('assets/json/spider.json')),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pick Your Poison',
                  style: mainStyle.copyWith(
                      fontSize: 24,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    menuWidget(size,
                        onClick: () {
                          var element = qTruthList[_random.nextInt(qTruthList.length)];
                          customPopup(context,
                              // color: (_noFieldEmpty)? Colors.blueGrey : Colors.grey,
                              title: Text(
                                'Tell Me the Truth!',
                                textAlign: TextAlign.center,
                                style: mainStyle.copyWith(
                                  color: Colors.amber,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Container(
                                decoration: BoxDecoration(
                                  color: darcula,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(8),
                                height: size.height * 0.15,
                                child: Text(element.question!.capitalizeFirst!, style: mainStyle.copyWith(color: Colors.amber),),
                              )
                            );
                        },
                        title: 'Truth',
                        image: 'assets/json/truth_eye.json',
                        color: Colors.green),
                    menuWidget(size,
                        onClick: () {
                          var element = qDareList[_random.nextInt(qDareList.length)];
                          customPopup(context,
                              // color: (_noFieldEmpty)? Colors.blueGrey : Colors.grey,
                              title: Text(
                                'I Dare You...',
                                textAlign: TextAlign.center,
                                style: mainStyle.copyWith(
                                  color: Colors.amber,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Container(
                                decoration: BoxDecoration(
                                  color: darcula,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(8),
                                height: size.height * 0.15,
                                child: Text(element.question!.capitalizeFirst!, style: mainStyle.copyWith(color: Colors.amber),),
                              ));
                        },
                        title: 'Dare',
                        image: 'assets/json/caution_dare.json',
                        color: Colors.redAccent),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => Get.to(() => QuestionListPage(qTruthList: qTruthList, qDareList: qDareList,)),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // minimumSize: Size.zero,
                    // fixedSize: const Size(80, 30),
                    backgroundColor: Colors.amber,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.menu, color: darcula,),
                      SizedBox(width: 8,),
                      Text(
                        'Show Questions',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold, color: darcula),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customPopup(context,
              // color: (_noFieldEmpty)? Colors.blueGrey : Colors.grey,
              title: Text(
                'Add Question',
                textAlign: TextAlign.center,
                style: mainStyle.copyWith(
                  color: Colors.amber,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SizedBox(
                height: size.height * 0.25,
                child: Column(
                  children: [
                    Text(
                      'Category',
                      style: mainStyle.copyWith(color: Colors.amber),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    onTapCategory(Type.Truth);
                                    print('$isTruth');
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color:
                                          isTruth ? Colors.amber : Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      'Truth',
                                      style: TextStyle(
                                          fontSize: isTruth ? 16 : 14,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              isTruth ? Colors.white : darcula),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    onTapCategory(Type.Dare);
                                    print('$isTruth');
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: !isTruth
                                          ? Colors.amber
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      'Dare',
                                      style: TextStyle(
                                          fontSize: !isTruth ? 16 : 14,
                                          fontWeight: FontWeight.w700,
                                          color: !isTruth
                                              ? Colors.white
                                              : darcula),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    textBox(
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
                  ],
                ),
              ), onCancel: () {
            Get.back();
            setState(() {
              _questionController!.clear();
            });
          }, onOk: () async{
            await QuestionDatabase.instance.create(Question(
                question: _questionController!.text,
                isTruth: isTruth? 0 : 1));
            setState(() {
              _questionController!.clear();
              isTruth = true;
              refreshList(qTruthList: qTruthList, qDareList: qDareList);
            });
            Get.back();
          });
        },
        tooltip: 'Add List',
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
        backgroundColor: darcula,
        shape: CircleBorder(),
      ),
    );
  }

  Future<void> customPopup(BuildContext context,
      {VoidCallback? onOk,
      VoidCallback? onCancel,
      String? labelCancel,
      Widget? title,
      Color? color,
      String? buttonText,
      Widget? content}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          title: title ?? const SizedBox(),
          content: content ?? const SizedBox(),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          buttonPadding: const EdgeInsets.all(24),
          actions: <Widget>[
            onCancel!=null ? ElevatedButton(
              onPressed: onCancel,
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // padding: EdgeInsets.all(4),
                // minimumSize: Size.zero,
                // fixedSize: const Size(80, 30),
                backgroundColor: Colors.transparent,
                side: const BorderSide(width: 1, color: Colors.amber),
              ),
              child: Text(
                'Cancel',
                style: mainStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.amber),
              ),
            ): SizedBox(),
            onOk != null? ElevatedButton(
              onPressed: onOk,
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // minimumSize: Size.zero,
                // fixedSize: const Size(80, 30),
                backgroundColor: color ?? Colors.amber,
              ),
              child: Text(
                'Add',
                style: mainStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2, color: darcula),
              ),
            ) : SizedBox(),
          ],
        );
      },
    );
  }
}


