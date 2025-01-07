import 'package:flutter/material.dart';

class ViewTask extends StatefulWidget {
  final String title;
  final String description;
  final bool isDone;
  final ValueChanged<bool?> onTaskDone;
  final VoidCallback? onDelete;

  const ViewTask({
    super.key,
    required this.title,
    required this.description,
    required this.isDone,
    required this.onTaskDone,
    this.onDelete,
  });

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 247, 249, 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    value: widget.isDone,
                    onChanged: widget.onTaskDone,
                    activeColor: const Color.fromRGBO(198, 207, 220, 1),
                    checkColor: Colors.white,
                    side: const BorderSide(
                      color: Color.fromRGBO(198, 207, 220, 1),
                      width: 2,
                    ),
                    title: Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.isDone
                            ? const Color.fromRGBO(141, 156, 184, 1)
                            : const Color.fromRGBO(63, 61, 86, 1),
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                IconButton(
                  onPressed: widget.isDone
                      ? widget.onDelete
                      : () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                  icon: Icon(
                    widget.isDone ? Icons.delete : Icons.more_horiz,
                    color: widget.isDone
                        ? Colors.red
                        : const Color.fromRGBO(141, 156, 184, 1),
                  ),
                ),
              ],
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(left: 65, bottom: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      color: Color.fromRGBO(141, 156, 184, 1),
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
