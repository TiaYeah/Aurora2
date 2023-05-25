import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {

    Rectangle {
        anchors.fill: parent
        z: -1
        gradient: Gradient {
            GradientStop {position: 0.0; color: "orange"}
            GradientStop {position: 1.0; color: "yellow"}
        }
    }
    DAO { id: dao }
    SilicaListView {
         width: parent.width;
         height: 800
         model: ListModel { id: patientsListModel }
         delegate: Rectangle {
             border.color: "black"
             border.width: 5
             height: 10 + label.height
             width: parent.width
             Label {
                 id: label
                 text: "Фамилия: " + surname + " Имя: " + name + " Отчество: " + patronymic_name + "\nДата рождения: " + birthDate + "\nПол: " + gender
                       + "\nРост: " + height + " Вес: " + weight
             }
         }
    }
    function selectPatients() {
           patientsListModel.clear();
           dao.getPatients(function(patients) {
               for (var i = 0; i < patients.length; i++) {
                   var patient = patients.item(i);
                   patientsListModel.append({id: patient.id, surname: patient.surname, name: patient.name, patronymic_name: patient.patronymic_name, birthDate: patient.birthDate,
                                            gender: patient.gender, height: patient.height, weight: patient.weight, token: patient.token});
               }
           });
       }
    Component.onCompleted: selectPatients()
}
