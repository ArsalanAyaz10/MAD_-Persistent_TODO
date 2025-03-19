class Taskmodel {
  final int id;
  final String title;
  final String description;
  final bool status;

  List<Taskmodel> _tasks = [];

  List<Taskmodel> get tasks => _tasks;

  Taskmodel(
    this.id, {
    required this.title,
    required this.description,
    this.status = false,
  });

  void addTask(String title, String description, DateTime dateTime) {
    _tasks.add(
      Taskmodel(
        _tasks.length,
        title: title,
        description: description,
        status: false,
      ),
    );
  }

  void removeTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }
}
