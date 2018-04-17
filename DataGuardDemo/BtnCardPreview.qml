import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0


Rectangle
{
    id: btn_card_area

    property string btnCardIconSource: ""
    property string btnCardTitle: "New Card"
    property string btnCardMininumber: "**** ____"

    width: 332
    height: 82

    color: parent.color

    Rectangle {
        id: btn_card_field
        width: parent.width - 10
        height: parent.height - 10

        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        anchors.fill: btn_card_field
        horizontalOffset: 0
        verticalOffset: 0

        cached: false
        radius: 50.0
        samples: 99

        color: "#dedede"
        smooth: true
        source: btn_card_field
    }

    Image {
        id: btn_card_icon

        source: btn_card_area.btnCardIconSource

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 25 // Sets all margins at once
        smooth: true
    }

    Text {
        id: btn_card_title

        text: btn_card_area.btnCardTitle

        x: 90
        y: 15
        smooth: true
        font
        {
            family: 'Segoe WP SemiLight';
            pixelSize: 16;
            italic: false;
            bold: true
        }
    }

    Text {
        id: btn_card_mininumber

        text: btn_card_area.btnCardMininumber

        x: 90
        y: 47
        smooth: true
        font
        {
            family: 'Segoe WP SemiLight';
            pixelSize: 16;
            italic: false;
            bold: true
        }
    }

    Image
    {
        id: btn_card_trash
        source: "/pics/images/Button-card-pic-trash.png"

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 25 // Sets all margins at once
        smooth: true
    }
}

