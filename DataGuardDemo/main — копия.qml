import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: root
    visible: true
    width: 1000
    height: 800
    title: qsTr("Data Guard")


    header:ToolBar {
        height: 150

        Button {
            text: "Data Guard v.1.0.0.0"
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page {
            Label {
                text: qsTr("Safe Erase")
                anchors.centerIn: parent
            }
        }

        Page {
            Label {
                text: qsTr("Lock Folder")
                anchors.centerIn: parent
            }
        }

        Page {
            Label {
                text: qsTr("Encrypt File")
                anchors.centerIn: parent
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Bank Cards")
        }
        TabButton {
            text: qsTr("Safe Erase")
        }
        TabButton {
            text: qsTr("Lock Folder")
        }
        TabButton {
            text: qsTr("Encrypt File")
        }
    }
}
