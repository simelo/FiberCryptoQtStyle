import QtQuick 2.13
import QtQuick.Templates 2.13 as T
import QtQuick.Controls 2.13
import QtQuick.Controls.impl 2.13
import QtQuick.Controls.Material 2.13

T.SplitView {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    handle: Rectangle {
        implicitWidth: control.orientation === Qt.Horizontal ? 6 : control.width
        implicitHeight: control.orientation === Qt.Horizontal ? control.height : 6
        color: T.SplitHandle.pressed ? control.Material.background
            : Qt.lighter(control.Material.background, T.SplitHandle.hovered ? 1.2 : 1.1)

        Rectangle {
            color: control.Material.secondaryTextColor
            width: control.orientation === Qt.Horizontal ? thickness : length
            height: control.orientation === Qt.Horizontal ? length : thickness
            radius: thickness
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2

            property int length: parent.T.SplitHandle.pressed ? 3 : 8
            readonly property int thickness: parent.T.SplitHandle.pressed ? 3 : 1

            Behavior on length {
                NumberAnimation {
                    duration: 100
                }
            }
        }
    }
}
