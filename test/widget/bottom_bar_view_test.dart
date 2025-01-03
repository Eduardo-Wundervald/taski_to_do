import 'package:flutter_test/flutter_test.dart';
import 'package:taski_to_do/main.dart';
import 'package:taski_to_do/src/presentation/view/task/create_task_view.dart';
import 'package:taski_to_do/src/presentation/view/task/done_task_view.dart';
import 'package:taski_to_do/src/presentation/view/task/search_task_view.dart';
import 'package:taski_to_do/src/presentation/view/task/todo_task_view.dart';

void main() {
  group('Bottom Navigation Bar Tests', () {
    testWidgets('should load first screen - Todo Task',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      expect(find.byType(TodoTask), findsOneWidget);
      expect(find.byType(CreateTask), findsNothing);
      expect(find.byType(SearchTask), findsNothing);
      expect(find.byType(DoneTask), findsNothing);
    });

    testWidgets('should navigate to Create Task page',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      // Tap on the Create tab
      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();

      // Verify if the navigation occurred to the Create Task page
      expect(find.byType(TodoTask), findsNothing);
      expect(find.byType(CreateTask), findsOneWidget);
      expect(find.byType(SearchTask), findsNothing);
      expect(find.byType(DoneTask), findsNothing);
    });

    testWidgets('should navigate to Search Task page',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      // Tap on the "Delete" tab
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Verify if the navigation occurred to the Delete Task page
      expect(find.byType(TodoTask), findsNothing);
      expect(find.byType(CreateTask), findsNothing);
      expect(find.byType(SearchTask), findsOneWidget);
      expect(find.byType(DoneTask), findsNothing);
    });

    testWidgets('should navigate to Done Task page',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const MyApp());

      // Tap on the "Delete" tab
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      // Verify if the navigation occurred to the Delete Task page
      expect(find.byType(TodoTask), findsNothing);
      expect(find.byType(CreateTask), findsNothing);
      expect(find.byType(SearchTask), findsNothing);
      expect(find.byType(DoneTask), findsOneWidget);
    });
  });
}
