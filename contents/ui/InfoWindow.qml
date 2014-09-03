import QtQuick 1.1
import org.kde.qtextracomponents 0.1 as QtExtra
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as Plasma
import org.kde.plasma.graphicswidgets 0.1 as PlasmaWidgets

Item {
    id: root

    function show(r) {
        var info = "<div align=left>%1, %2</div><div align=center><b>%3x%4</b></div><div align=right>%5, %6</div>"
        dialogContents.text = info.arg(r.x).arg(r.y).arg(r.width).arg(r.height).arg(r.x + r.width).arg(r.y + r.height);
        hideCountdown.restart();
        dialog.x = r.x + Math.round((r.width - dialog.width) / 2)
        dialog.y = r.y + Math.round((r.height - dialog.height) / 2)
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
