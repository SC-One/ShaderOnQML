import QtQuick 2.0

Rectangle {
    id:root
    property int floatCompNum: 10;
    property real defWidth: 100;
    property real defHeight: 50;

    function getRandomArbitrary(min, max) {
      return Math.random() * (max - min) + min;
    }

    ShaderEffect
    {
        id:rootShader
        anchors.fill: parent
        property real iGlobalTime: 0.0
        property size u_Resolution:Qt.size(root.width,root.height)
        Timer
        {
            id:timer
            interval: 1; running: true; repeat: true
            onTriggered: {
                rootShader.iGlobalTime += 0.001;
            }
        }

        fragmentShader: "qrc:/BackgroundGradient.fsh"
    }


    Repeater
    {
        model:root.floatCompNum
        FloatComponent{
            width: defWidth
            height: defHeight
            x: getRandomArbitrary(0,500*0.8)
            y: getRandomArbitrary(0,600*0.8)
        }
    }
}
