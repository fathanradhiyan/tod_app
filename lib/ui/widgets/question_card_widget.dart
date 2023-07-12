part of 'widgets.dart';

class QuestionCardWidget extends StatefulWidget {
  final Question item;
  final bool isDelete;
  final bool isEdit;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const QuestionCardWidget({Key? key, required this.item, required this.isDelete, required this.onDelete, required this.isEdit, required this.onEdit}) : super(key: key);

  @override
  _QuestionCardWidgetState createState() => _QuestionCardWidgetState();
}

class _QuestionCardWidgetState extends State<QuestionCardWidget> {
  late List<Question> qTruthList = [];
  late List<Question> qDareList = [];
  // TextEditingController? _questionController;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _questionController = TextEditingController();
  //
  //   // refreshList(qTruthList: qTruthList, qDareList: qDareList);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(5),
            color: darcula,
            // border: Border.all(width: 1, color: Colors.blueGrey)
          ),
          child: Text(
            '${widget.item.question}',
            style: mainStyle.copyWith(color: Colors.amber),
          ),
        ),
        widget.isDelete? Positioned(
            top: -4,
            right: 0,
            child: IconButton(
              onPressed: widget.onDelete,
              icon: Icon(Icons.remove_circle_rounded),
              color: Colors.red,
            )) : SizedBox(),
        widget.isEdit? Positioned(
            bottom: -4,
            right: 0,
            child: IconButton(
              onPressed: widget.onEdit,
              icon: Icon(Icons.edit_note),
              color: Colors.amber,
            )) : SizedBox(),
      ],
    );
  }
}

