import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_todo/provider/TaskProvider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Taskprovider testTask;

  setUp(() {
    testTask = Taskprovider();
  });

  test("The Task List should be empty at first", () {
    expect(testTask.tasks.length, 0);
  });

  test("Adding task should increase task.length", () {
    testTask.addTask("TEST_TASK", "Test Task for Unit Test", false);
    expect(testTask.tasks.length, 1);
    expect(testTask.tasks[0].title, "TEST_TASK");
    expect(testTask.tasks[0].description, "Test Task for Unit Test");
  });

  test("Removing Task should decremnt length", () {
    testTask.removeTask(id: 0);
    expect(testTask.tasks.length, 0);
  });
}
