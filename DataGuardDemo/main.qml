import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0


ApplicationWindow
{
    title: qsTr("Data Guard App")
    id: root
    width: 940
    height: 580

    Rectangle 
	{
        id: over_header
        color: "#0064b4"

        width: root.width
        height: 60
        visible: true

		Image
		{
			id: image_main_logo
			source: "/pics/images/DataGuardLogo.png"
	
			anchors.left: parent.left
			anchors.verticalCenter: parent.verticalCenter
			anchors.margins: 13 // Sets all margins at once
		}
	
		Text {
			id: label_main_logo
			text: "Data Guard"
			color: "white"
	
			font.bold: true
			font.family: 'Segoe WP SemiLight'
			font.pixelSize: 18
	
			anchors.left: image_main_logo.left
			anchors.verticalCenter: image_main_logo.verticalCenter
			anchors.margins: image_main_logo.anchors.margins + 20
		}
	
		Rectangle {
			id: vertical_delimiter
			color: "white"
			opacity: 0.3
			width: 1
			height: 20
	
			anchors.left: label_main_logo.left
			anchors.verticalCenter: label_main_logo.verticalCenter
			anchors.margins: label_main_logo.paintedWidth + 17
		}
	
		Text {
			id: label_soft_version
			text: "ver. 0.0.0.0.1"
			color: "white"
			//opacity: 0.3
	
			font.bold: true
			font.family: 'Segoe WP SemiLight'
			font.pixelSize: 12
	
			anchors.left: vertical_delimiter.left
			anchors.verticalCenter: vertical_delimiter.verticalCenter
			anchors.margins: 20
		}
	
	
		Image
		{
			id: image_language
			x: right_top_link.x - 40
			source: "/pics/images/Button-language-russ.png"
	
			anchors.verticalCenter: parent.verticalCenter
			anchors.margins: 25 // Sets all margins at once
	
		}
	
		Button {
			id: right_top_link
	
			anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter
			anchors.margins: 20 // Sets all margins at once
	
			contentItem: Text {
					id: right_top_link_text
					text: qsTr("www.dataguard.com")
					font.pixelSize: 14
					opacity: enabled ? 1.0 : 0.3
					color: "white"
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					elide: Text.ElideRight
				}
	
			background: Rectangle {
				implicitWidth: 100
				implicitHeight: 40
				opacity: 0
				//border.color: control.down ? "#17a81a" : "#21be2b"
				//border.width: 1
				//radius: 2
			}
	
			MouseArea {
				anchors.fill: parent //...to cover the whole image
				onClicked: Qt.openUrlExternally("https://ru.aliexpress.com") //...handling the clicked signal of the MouseArea
				onPressed: right_top_link_text.font.underline = true
				onReleased: right_top_link_text.font.underline = false
				cursorShape: Qt.PointingHandCursor
			}
		}
		
    } // over_header


    Rectangle {
        id: left_toolbar
        color: "#3278b4"

        width: 255
        height: root.height - over_header.height
        y: over_header.height
        visible: true
    }


    Rectangle {
        id: operations_toolbar
        color: "#fafafa"

        width:  root.width - left_toolbar.width
        height: root.height - over_header.height
        x: left_toolbar.width
        y: over_header.height

        visible: true


        Text {
            id: label_bank_cards
            text: "Bank cards"
            color: "black"
            x: 17
            y: 16

            font.family: 'Segoe WP SemiLight'
            font.pixelSize: 24
            font.italic: false
            font.bold: false
        }

        Text {
            id: label_bank_cards_info
            text: "In this section you can manipulate with your bank cards, add information about them, erase single"
                 +" card from card-list, or erase all cards from it. Add as much cards as you want."
            color: "#88898b"
            x: label_bank_cards.x
            y: label_bank_cards.y + label_bank_cards.font.pixelSize + 22

            width: 640 // max width that your text can reach before wrapping
            wrapMode: "WordWrap"
            font.family: 'Segoe WP SemiLight'
            font.pixelSize: 14
            font.italic: false
            font.bold: false
        }

        Rectangle {
            id: label_bank_cards_info_under_line
            color: "#ebebf0"
            width: root.width - left_toolbar.width - label_bank_cards_info.x - 25
            height: 2
            x: label_bank_cards_info.x
            y: label_bank_cards_info.y + label_bank_cards_info.font.pixelSize + 36
        }

        Rectangle {
            id: btn_card_add
            color: "transparent"
            height: 20
            width:  75
            x: label_bank_cards_info_under_line.x
            y: label_bank_cards_info_under_line.y + 16

            Text {
                id: label_btn_card_add
                text: "Add card"
                color: "black"
                x: parent.x

                font.family: 'Segoe WP SemiLight'
                font.pixelSize: 14
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            Image {
                id: btn_card_add_icon

                source: "/pics/images/Button-Add-pic-Plus.png"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                smooth: true
            }
        }


        Rectangle {
            id: btn_card_delete_all
            color: "transparent"
            height: 20
            width:  110
            x: label_bank_cards_info_under_line.x + label_bank_cards_info_under_line.width - width
            y: label_bank_cards_info_under_line.y + 16

            Text {
                id: label_btn_card_delete_all
                text: "Delete all cards"
                color: "black"
                x: parent.x

                font.family: 'Segoe WP SemiLight'
                font.pixelSize: 14
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            Image {
                id: btn_card_delete_all_icon

                source: "/pics/images/Button-card-pic-trash.png"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                smooth: true
            }
        }


        BtnCardPreview
        {
            id: btn_card_left_one

            x: 10
            y: 157

            btnCardIconSource: "/pics/images/Button-card-logo-mastercard.png"
            btnCardTitle: "My own card"
            btnCardMininumber: "**** 4548"
        }

        BtnCardPreview
        {
            id: btn_card_right_one

            x: 4 + btn_card_left_one.x + btn_card_left_one.width
            y: btn_card_left_one.y

            btnCardIconSource: "/pics/images/Button-card-logo-visa.png"
            btnCardTitle: "Work card"
            btnCardMininumber: "**** 1234"
        }

        BtnCardPreview
        {
            id: btn_card_left_two
            x: 10
            y: btn_card_left_one.y + btn_card_left_one.height + 4

            btnCardIconSource: "/pics/images/Button-card-logo-visa.png"
            btnCardTitle: "Super card"
            btnCardMininumber: "**** 9897"
        }

        BtnCardPreview
        {
            id: btn_card_right_two

            x: 4 + btn_card_left_two.x + btn_card_left_two.width
            y: btn_card_left_two.y

            btnCardIconSource: "/pics/images/Button-card-logo-mastercard.png"
            btnCardTitle: "Mega card"
            btnCardMininumber: "**** 3545"
        }

        BtnCardPreview
        {
            id: btn_card_left_three
            x: 10
            y: btn_card_left_two.y + btn_card_left_two.height + 4

            btnCardIconSource: "/pics/images/Button-card-logo-mastercard.png"
            btnCardTitle: "Ultra card"
            btnCardMininumber: "**** 0201"
        }

    }


	////////////////////
	// MY_EXPERIMENTS //
	////////////////////
	
    /*
    Text { // https://stackoverflow.com/questions/35799944/text-type-alignment
        text: 'ТЕСТОВЫЕ КАРТЫ ТУТ!'
        color: "black"
        font
        {
            family: 'AvantGarde-Medium';
            pixelSize: 50;
            italic: false;
            capitalization: Font.SmallCaps
        }
        x: root.width/2
        y: root.height/2
    }
    //*/



/*
    BtnCardPreview {

        Image{
            id: icon_card_visa
            source: "/pics/images/Button-card-logo-visa.png"
        }

        //anchors.centerIn: operations_toolbar // root

        anchors.horizontalCenter: 1operations_toolbar.horizontalCenter)
        anchors.verticalCenter: operations_toolbar.verticalCenter
    }

    BtnCardPreview {

        Image{
            id: icon_card_mastercard
            source: "/pics/images/Button-card-logo-mastercard.png"
        }

        anchors.horizontalCenter: operations_toolbar.horizontalCenter
        anchors.verticalCenter: operations_toolbar.verticalCenter
    }
//*/

/*
    Item {
        width: 300
        height: 300

        //Rectangle {
        //    anchors.fill: parent
        //}

        Image {
            id: butterfly
            source: "pics/images/butterfly.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false
        }

        DropShadow {
            anchors.fill: butterfly
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: butterfly
        }
    }
//*/

/*
    Rectangle {
        id: button_a

        property bool checked: false
        property alias text : buttonText.text
        Accessible.name: text
        Accessible.description: "This button does " + text
        Accessible.role: Accessible.Button
        Accessible.onPressAction: {
            button_a.clicked()
        }

        signal clicked

        width: 200 //buttonText.width + 20
        height: 50

        color: button_a.focus ? "red" : "blue"

        radius: 0
        antialiasing: true

        Text {
            id: buttonText
            text: parent.description
            anchors.centerIn: parent
            font.pixelSize: parent.height * .5
            style: Text.Sunken
            color: "red"
            styleColor: "blue"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: parent.clicked()
        }

        Keys.onSpacePressed: clicked()
    }
*/

/*
    Rectangle {
        id: button_a

        property bool checked: false
        property alias text : buttonText.text
        Accessible.name: text
        Accessible.description: "This button does " + text
        Accessible.role: Accessible.Button
        Accessible.onPressAction: {
            button_a.clicked()
        }

        signal clicked

        width: 200 //buttonText.width + 20
        height: 50

        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0;
                color: button.focus ? "red" : "blue" }
        }

        //color: button_a.focus ? "red" : "blue"

        radius: 0
        antialiasing: true

        Text {
            id: buttonText
            text: parent.description
            anchors.centerIn: parent
            font.pixelSize: parent.height * .5
            style: Text.Sunken
            color: "red"
            styleColor: "blue"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: parent.clicked()
        }

        Keys.onSpacePressed: clicked()
    }
*/

/*
    Item {
        id: button
        x: 100
        y: 100
        width: 30
        height: 100
        property alias text: innerText.text
        signal clicked

        ColorAnimation {
            from: "white"
            to: "black"
            duration: 200
        }

        Image {
            id: backgroundImage
            anchors.fill: parent
            source: (button.enabled ? "images/button_background_normal.png" : "images/button_background_disabled.png")
        }

        Text {
            id: innerText
            anchors.centerIn: parent
            color: "black"
            font.bold: true
        }

        //Mouse area to react on click events
        MouseArea {
            anchors.fill: button
            onClicked: { button.clicked();}
            onPressed: {
                backgroundImage.source = "images/button_background_pressed.png" }
            onReleased: {
                backgroundImage.source = (button.enabled ? "images/button_background_normal.png" : "images/button_background_disabled.png")
            }
        }
    }
*/

/*
    background: Rectangle
    {
        //x: 100
        //y: 100
        rotation: 90
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#bbc7d5" }
            GradientStop { position: 1.0; color: "#355377" }
        }
    }
//*/

/*
    background: Rectangle {
            color: "#355377"
        }
//*/

/*
    style: ApplicationWindowStyle {
        background: BorderImage {
            source: "background.png"
            border { left: 20; top: 20; right: 20; bottom: 20 }
        }
    }
*/

/*
    header:ToolBar
    {
        height: 100

        Button {
            text: "Data Guard v.1.0.0.0"
        }
    }

    ListView
    {
        anchors.fill: parent
        model: MyModel{}
        delegate: MyDelegate{}
    }
*/

/*
    SwipeView
    {
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

    footer: TabBar
    {
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
//*/

}


