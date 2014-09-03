import QtQuick 1.1
import org.kde.qtextracomponents 0.1 as QtExtra
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as Plasma
import org.kde.plasma.graphicswidgets 0.1 as PlasmaWidgets

Item {
    id: root

    function show(x, y, width, height) {
        var info = "<div align=left>%1, %2</div><div align=center><b>%3x%4</b></div><div align=right>%5, %6</div>"
        dialogContents.text = info.arg(x).arg(y).arg(width).arg(height).arg(x + width).arg(y + height);
        hideCountdown.restart();
        dialog.x = x + Math.round((width - dialog.width) / 2)
        dialog.y = y + Math.round((height - dialog.height) / 2)
        dialog.visible = true;
    }

    function hide() {
        dialog.visible = false;
    }

    Text {
        id: dialogContents

        width: theme.defaultFont.mSize.width * 16 + 8
        visible: true

        font.capitalization: theme.defaultFont.capitalization
        font.family: theme.defaultFont.family
        font.italic: theme.defaultFont.italic
        font.letterSpacing: theme.defaultFont.letterSpacing
        font.pointSize: theme.defaultFont.pointSize
        font.strikeout: theme.defaultFont.strikeout
        font.underline: theme.defaultFont.underline
        font.weight: theme.defaultFont.weight
        font.wordSpacing: theme.defaultFont.wordSpacing

        text: "<div align=left>0000x0000</div><div align=center><b>0000x0000</b></div><div align=right>0000x0000</div>"
        textFormat: Text.RichText
    }

    PlasmaCore.Dialog {
        id: dialog
        x: 0
        y: 0
        windowFlags: Qt.ToolTip
        mainItem: dialogContents
    }

    Timer {
        id: hideCountdown
        interval: 1250
        onTriggered: root.hide();
    }
}
