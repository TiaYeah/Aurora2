import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column
    {
        width: parent.width
        Page5item
        {
            Label
            {
                text: "Red Button"
            }
            width: parent.width
            color: "red"
        }
    }
}
