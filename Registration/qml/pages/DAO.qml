import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0

Item {
    property var db;

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("patients2", "1.0");
        createPatientsTable();
    }
    function createPatientsTable() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS patients (
                id INTEGER PRIMARY KEY AUTOINCREMENT,"
                + "surname TEXT NOT NULL, name TEXT NOT NULL, patronymic_name TEXT, birthDate INTEGER NOT NULL,"
                + "gender TEXT NOT NULL, hegiht INTEGER NOT NULL, weight INTEGER NOT NULL, token TEXT NOT NULL);");
        });
    }
    function getPatients(callback) {
        db.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM patients;");
            callback(result.rows);
        });
    }

    function insertPatient(surname, name, patronymic_name, birthDate, gender, hegiht, weight, token) {
        db.transaction(function(tx) {
           tx.executeSql("INSERT INTO patients (surname, name, patronymic_name, birthDate, gender, hegiht, weight, token) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", [surname, name, patronymic_name, birthDate, gender, hegiht, weight, token]);
        });
    }
    function deletePatient(id) {
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM patients WHERE id = ?;", [id]);
        });

    }

}
