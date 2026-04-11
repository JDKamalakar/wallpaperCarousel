import QtQuick
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginSettings {
    id: root
    pluginId: "wallpaperCarousel"

    Column {
        id: mainLayout
        width: parent.width
        spacing: Theme.spacingM

    StringSetting {
        settingKey: "wallpaperDirectory"
        label: "Wallpaper Directory"
        description: "Override the wallpaper directory. Leave empty to automatically follow the current wallpaper's directory."
        placeholder: "/home/user/Pictures/Wallpapers"
        defaultValue: ""
    }

    StringSetting {
        settingKey: "itemWidth"
        label: "Item Width"
        description: "Width of each wallpaper thumbnail in pixels. Enter a number (e.g. 300). Default: 300"
        placeholder: "300"
        defaultValue: "300"
    }

    StringSetting {
        settingKey: "itemHeight"
        label: "Item Height"
        description: "Height of each wallpaper thumbnail in pixels. Enter a number (e.g. 420). Default: 420"
        placeholder: "420"
        defaultValue: "420"
    }

        // -------------------------------------------------------------
        // Border Width
        // -------------------------------------------------------------
        // -------------------------------------------------------------
        // Border Width
        // -------------------------------------------------------------
        Column {
            id: colBorderWidth
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 3
            property int val: root.loadValue("borderWidth", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Border Width"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colBorderWidth.val !== colBorderWidth.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colBorderWidth.val = colBorderWidth.defaultValue; 
                            root.saveValue("borderWidth", colBorderWidth.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Width of the skewed border around each wallpaper thumbnail (in pixels). Default: 3"; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 0; maximum: 20; value: colBorderWidth.val; unit: "px"
                onSliderValueChanged: newVal => { colBorderWidth.val = newVal; root.saveValue("borderWidth", newVal); }
            }
        }

    StringSetting {
        settingKey: "selectedScale"
        label: "Selected Item Scale"
        description: "Scale of the currently selected (centered) wallpaper thumbnail. Other items scale down proportionally based on distance. Enter a decimal value (e.g. 1.15). Default: 1.15"
        placeholder: "1.15"
        defaultValue: "1.15"
    }

        // -------------------------------------------------------------
        // Background Dimming
        // -------------------------------------------------------------
        // -------------------------------------------------------------
        // Background Dimming
        // -------------------------------------------------------------
        Column {
            id: colOverlayOpacity
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 80
            property int val: root.loadValue("overlayOpacity", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Background Dimming"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colOverlayOpacity.val !== colOverlayOpacity.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colOverlayOpacity.val = colOverlayOpacity.defaultValue; 
                            root.saveValue("overlayOpacity", colOverlayOpacity.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Opacity of the dark overlay behind the carousel. 0 = transparent, 100 = fully dark. Default: 80"; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 0; maximum: 100; value: colOverlayOpacity.val; unit: "%"
                onSliderValueChanged: newVal => { colOverlayOpacity.val = newVal; root.saveValue("overlayOpacity", newVal); }
            }
        }

    SelectionSetting {
        settingKey: "carouselMode"
        label: "Carousel Mode"
        description: "Standard stops at the edges. Wrap loops the index. Infinite shows a seamless repeating view."
        defaultValue: "wrap"
        options: [
            { label: "Standard", value: "standard" },
            { label: "Wrap", value: "wrap" },
            { label: "Infinite", value: "infinite" }
        ]
    }

    SelectionSetting {
        settingKey: "enableRounding"
        label: "Enable Rounded Corners"
        description: "Apply rounded corners to image thumbnails."
        defaultValue: "false"
        options: [
            { label: "Disabled", value: "false" },
            { label: "Enabled", value: "true" }
        ]
    }

        // -------------------------------------------------------------
        // Corner Radius
        // -------------------------------------------------------------
        // -------------------------------------------------------------
        // Corner Radius
        // -------------------------------------------------------------
        Column {
            id: colCornerRadius
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 15
            property int val: root.loadValue("cornerRadius", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Corner Radius"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colCornerRadius.val !== colCornerRadius.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colCornerRadius.val = colCornerRadius.defaultValue; 
                            root.saveValue("cornerRadius", colCornerRadius.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Adjust the corner radius when enabled. Default: 15"; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 0; maximum: 100; value: colCornerRadius.val; unit: "px"
                onSliderValueChanged: newVal => { colCornerRadius.val = newVal; root.saveValue("cornerRadius", newVal); }
            }
        }

    SelectionSetting {
        settingKey: "expandSelected"
        label: "Expand Selected Image"
        description: "When an image is centered, expand its width to show more."
        defaultValue: "false"
        options: [
            { label: "Disabled", value: "false" },
            { label: "Enabled", value: "true" }
        ]
    }

        // -------------------------------------------------------------
        // Expansion Amount
        // -------------------------------------------------------------
        Column {
            id: colExpandMultiplier
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 150
            property int val: root.loadValue("expandMultiplier", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Expansion Amount"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colExpandMultiplier.val !== colExpandMultiplier.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colExpandMultiplier.val = colExpandMultiplier.defaultValue; 
                            root.saveValue("expandMultiplier", colExpandMultiplier.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Width multiplier for the centered image. Default: 150 (1.5x)."; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 100; maximum: 300; value: colExpandMultiplier.val; unit: "%"
                onSliderValueChanged: newVal => { colExpandMultiplier.val = newVal; root.saveValue("expandMultiplier", newVal); }
            }
        }

        // -------------------------------------------------------------
        // Hold Screen Coverage
        // -------------------------------------------------------------
        Column {
            id: colHoldExpandRatio
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 80
            property int val: root.loadValue("holdExpandRatio", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Hold Screen Coverage"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colHoldExpandRatio.val !== colHoldExpandRatio.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colHoldExpandRatio.val = colHoldExpandRatio.defaultValue; 
                            root.saveValue("holdExpandRatio", colHoldExpandRatio.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Percentage of screen dimensions the image will unfold to when held. Default: 80"; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 30; maximum: 100; value: colHoldExpandRatio.val; unit: "%"
                onSliderValueChanged: newVal => { colHoldExpandRatio.val = newVal; root.saveValue("holdExpandRatio", newVal); }
            }
        }

        // -------------------------------------------------------------
        // Hold Delay
        // -------------------------------------------------------------
        Column {
            id: colHoldDelay
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 1500
            property int val: root.loadValue("holdDelay", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Hold Delay"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colHoldDelay.val !== colHoldDelay.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colHoldDelay.val = colHoldDelay.defaultValue; 
                            root.saveValue("holdDelay", colHoldDelay.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Time to stay on an image before it expands (in milliseconds). Default: 1500"; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 200; maximum: 5000; value: colHoldDelay.val; unit: "ms"
                onSliderValueChanged: newVal => { colHoldDelay.val = newVal; root.saveValue("holdDelay", newVal); }
            }
        }

        // -------------------------------------------------------------
        // Active Margin
        // -------------------------------------------------------------
        Column {
            id: colActiveMargin
            width: parent.width
            spacing: Theme.spacingXS
            property int defaultValue: 80
            property int val: root.loadValue("activeMargin", defaultValue)
            Row {
                width: parent.width
                spacing: Theme.spacingS
                StyledText { text: "Active Margin"; font.weight: Font.Medium; color: Theme.surfaceText; width: parent.width - 24 - Theme.spacingS }
                DankIcon {
                    name: "restart_alt"; size: 20
                    opacity: colActiveMargin.val !== colActiveMargin.defaultValue ? 0.8 : 0.0
                    visible: opacity > 0
                    Behavior on opacity { NumberAnimation { duration: 200 } }
                    MouseArea { 
                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor; 
                        onClicked: { 
                            colActiveMargin.val = colActiveMargin.defaultValue; 
                            root.saveValue("activeMargin", colActiveMargin.defaultValue); 
                        } 
                    }
                }
            }
            StyledText { text: "Margin distance between the expanded active center image and its siblings. Default: 80"; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceVariantText; width: parent.width; wrapMode: Text.WordWrap; opacity: 0.8 }
            DankSlider {
                width: parent.width; minimum: 0; maximum: 300; value: colActiveMargin.val; unit: "px"
                onSliderValueChanged: newVal => { colActiveMargin.val = newVal; root.saveValue("activeMargin", newVal); }
            }
        }
    }
}
