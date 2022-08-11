import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_attendance/model/add_batch_model.dart';
import 'package:student_attendance/model/give_attendence_model.dart';
import 'package:student_attendance/model/teacher_regi-model.dart';

import '../model/add_course_model.dart';
import '../model/student_regi_model.dart';


class DBHelper{
  static const String createTableCourse='''create table $tableCourse(
  $tableCourseColid integer primary key autoincrement,
  $tableCourseColName text
  )''';

  static const String createTableBatch='''create table $tableBatch(
  $tableBatchColId integer primary key autoincrement,
  $tableBatchColName text,
  $tableBatchColCourse txt
  )''';

  static const String createTableTeacher='''create table $tableteacher(
  $tableteacherColId integer primary key autoincrement,
  $tableteacherColName text,
  $tableteacherColPass text,
  $tableteacherColEmail text,
  $tableteacherColGender text,
  $tableteacherColImage text,
  $tableteacherColCourse text,
  $tableteacherColBatch text
  )''';

  static const String createTableStudent='''create table $tablestudent(
  $tablestudentColId integer primary key autoincrement,
  $tablestudentColName text,
  $tablestudentColEmail text,
  $tablestudentColGender text,
  $tablestudentColImage text,
  $tablestudentColCourse text,
  $tablestudentColBatch text
  )''';

  static const String createTableAttendence='''create table $tableAttendence(
  $tableAttendenceColId integer primary key autoincrement,
  $tableAttendenceColSIDs text,
  $tableAttendenceColDate text,
  $tableAttendenceColStatus text,
  $tableAttendenceColBatch text,
  $tableAttendenceColCourse text,
  $tableAttendenceColTeacher text
  )''';

  static Future<Database> open() async{
    final rootPath =await getDatabasesPath();
    final dbPath =join(rootPath,'course.db');
    return openDatabase(dbPath, version: 1, onCreate: (db,version) async{
      await db.execute(createTableCourse);
      await db.execute(createTableTeacher);
      await db.execute(createTableStudent);
      await db.execute(createTableAttendence);
      await db.execute(createTableBatch);
    });
  }

  static Future<int> insertcourse(AddCourseModel addCourseModel) async{
    final db = await open();
    return db.insert(tableCourse, addCourseModel.toMap());
  }

  static Future<int> insertbatch(AddBatchModel addBatchModel) async{
    final db = await open();
    return db.insert(tableBatch, addBatchModel.toMap());
  }

  static Future<int> addattendence(AttendenceModel attendenceModel) async{
    final db = await open();
    return db.insert(tableAttendence, attendenceModel.toMap());
  }

  static Future<int> registerTeacher(AddTeacherModel addTeacherModel) async{
    final db = await open();
    return db.insert(tableteacher, addTeacherModel.toMap());
  }

  static Future<int> registerStudent(AddStudentModel addStudentModel) async{
    final db = await open();
    return db.insert(tablestudent, addStudentModel.toMap());
  }




  static Future<List<AddStudentModel>> getallStudent() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tablestudent);
    return List.generate(mapList.length, (index) => AddStudentModel.fromMap(mapList[index]));
  }

  static Future<List<AddCourseModel>> getAllCourse() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableCourse);
    return List.generate(mapList.length, (index) => AddCourseModel.fromMap(mapList[index]));
  }

  static Future<List<AddBatchModel>> getAllbatch() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableBatch);
    return List.generate(mapList.length, (index) => AddBatchModel.fromMap(mapList[index]));
  }

  static Future<List<AddTeacherModel>> getAllTeacher() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableteacher);
    return List.generate(mapList.length, (index) => AddTeacherModel.fromMap(mapList[index]));
  }

  static Future<List<AttendenceModel>> getAllattendence() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableAttendence);
    return List.generate(mapList.length, (index) => AttendenceModel.fromMap(mapList[index]));
  }

  static Future<int> updateAttendence(int? id, String value) async {
    final db = await open();
    return db.update(tableAttendence, {tableAttendenceColSIDs: value}, where: '$tableAttendenceColId = ?', whereArgs: [id]);

  }


  static Future<int> deletestudent(int id) async {
    final db = await open();
    return db.delete(tablestudent, where: '$tablestudentColId = ?', whereArgs: [id]);
  }

  static Future<int> deletetrainer(int id) async {
    final db = await open();
    return db.delete(tableteacher, where: '$tableteacherColId = ?', whereArgs: [id]);
  }

  static Future<int> deletecourse(int id) async {
    final db = await open();
    return db.delete(tableCourse, where: '$tableCourseColid = ?', whereArgs: [id]);
  }
  static Future<int> deletebatch(String course) async {
    final db = await open();
    return db.delete(tableBatch, where: '$tableBatchColCourse = ?', whereArgs: [course]);
  }
}