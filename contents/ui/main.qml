import QtQuick 1.1
import org.kde.qtextracomponents 0.1 as QtExtra
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as Plasma
import org.kde.plasma.graphicswidgets 0.1 as PlasmaWidgets

Item {
    id: root

    InfoWindow {
        id: infoWindow
    }

    function addConnections(client) {
        client.clientStepUserMovedResized.connect(updateInfoRect);
        client.geometryShapeChanged.connect(updateInfo);
    }

    function updateInfo(client, old) {
        infoWindow.show(client.geometry.x, client.geometry.y, client.geometry.width, client.geometry.height);
    }

    function updateInfoRect(client, rect) {
        infoWindow.show(rect.x, rect.y, rect.width, rect.height)
    }

    Component.onCompleted: {
        options.showGeometryTip = false;
        var clients = workspace.clientList();
        for(var i = 0; i < clients.length; ++i) {
            if(!clients[i].noBorder) {
                addConnections(clients[i]);
            }
        }
		workspace.clientAdded.connect(addConnections);
	}
}
