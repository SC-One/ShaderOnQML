import QtQuick 2.0

Item {
    id:root
    Rectangle{
        id:rect
        color:"red"
        anchors.fill: parent
        Text{
            anchors.centerIn: parent
            text:"I'm in dragger!"
        }
        MouseArea
        {
            anchors.fill: parent
            drag.target: root
            onPressed: rect.color="green"
            onReleased: rect.color="pink"
        }
    }
}
