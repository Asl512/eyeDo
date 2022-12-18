import 'package:eye_do/data/models/exercise.dart';
import 'package:eye_do/data/repositories/exercise_repository.dart';

class MockExerciseRepository implements ExerciseRepository {
  @override
  List<Exercise> getListException() {
    return [
      Exercise(
        id: 1,
        timer: 5,
        image: 'res/exercise/one.gif',
        title: 'По правой диагонали',
      ),
      Exercise(
        id: 2,
        timer: 5,
        image: 'res/exercise/two.gif',
        title: 'По левой диагонали',
      ),
      Exercise(
        id: 2,
        timer: 5,
        image: 'res/exercise/three.gif',
        title: 'Вправо - влево',
      ),
      Exercise(
        id: 2,
        timer: 5,
        image: 'res/exercise/four.gif',
        title: 'Вверх - вниз',
      ),
    ];
  }
}
