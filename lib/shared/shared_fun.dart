part of 'shared.dart';

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

Future refreshList(
    {required List<Question> qTruthList, required List<Question> qDareList}) async {
  qTruthList.clear();
  qDareList.clear();
  Future.delayed(Duration(seconds: 5));
  List<Question> questionList = await QuestionDatabase.instance.readAllItems();

  for (int i = 0; i < questionList.length; i++) {
    if (questionList[i].isTruth == 0) {
      qTruthList.add(questionList[i]);
    } else
      qDareList.add(questionList[i]);
  }


}