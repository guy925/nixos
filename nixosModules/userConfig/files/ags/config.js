const hyprland = await Service.import("hyprland")
const audio = await Service.import("audio")
const battery = await Service.import("battery")
 const mpris = await Service.import("mpris")
const systemtray = await Service.import("systemtray")
import { NotificationPopups } from "./agsModules/notificationPopups.js"
import { applauncher } from "./agsModules/launcher.js"
import { Clock } from "./Clock.js"

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

function Media() {
    const label = Utils.watch("", mpris, "player-changed", () => {
        if (mpris.players[0]) {
            const { track_artists, track_title } = mpris.players[0]
            return `${track_artists.join(", ")} - ${track_title}`
        } else {
            return "Nothing is playing"
        }
    })

    return Widget.Button({
        class_name: "media",
        on_primary_click: () => mpris.getPlayer("")?.playPause(),
        on_scroll_up: () => mpris.getPlayer("")?.next(),
        on_scroll_down: () => mpris.getPlayer("")?.previous(),
        child: Widget.Label({ label }),
    })
}


function Workspaces() {
  return Widget.Box({
    class_name: `workspaces`,
    homogeneous: false,
    vertical: false,
    spacing: 0,
    // children: Array.from({ length:6 },(_,i) => i + 1).map( (i) => Widget.Button({
    children:  [" 󰈹 ", "  ", "  ", "  "].map( (v,i) => {
      let ws_id = i + 1
      return Widget.Button({
        attribute: `${ws_id}`,
        label: v,
        // label: activeId.as( active => active != ws_id && `` || `󱥸` ),
        // class_name: activeId.as( active => active == i ? "focused" : hyprland.workspaces[i].windows != 0 ? "occupied" : "" ),
        on_clicked: () => { hyprland.messageAsync(`dispatch workspace ${ws_id}`) },
        setup: self => {
            self.hook(hyprland, self => {
              if(hyprland.active.workspace.id == ws_id){
                // self.label = `󰸵`;
                self.class_name = "focused";
              } else if(hyprland.active.workspace.id != ws_id){
                // self.label = `󰸶`;
                self.class_name = "";
                hyprland.workspaces.forEach( ws => {
                  if(ws.id == ws_id){
                    if(ws.windows != 0){
                      // self.label = "󰸸"; //󰸴
                      self.class_name = "occupied";
                    }
                  }
                });
                // self.class_name = "occupied"
                // self.toggleClassName("focused",false)
              } 
              // hyprland.active.workspace.id == i ? self.class_names = ["focused"] : self.class_names = []
              // hyprland.workspaces[i].windows == 0 ? 
            })
          }
      }) 
    }
    )
});
}

function Launcher() {
    return Widget.Button({
      on_clicked: () => { App.ToggleWindow("applauncher") },
      child: Widget.Label(`  `),
      class_name: "launchbutton",
    })
}

function Volume() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    })

    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "volume",
        css: "min-width: 180px",
        children: [icon, slider],
    })
}


function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const icon = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon }),
            Widget.LevelBar({
                widthRequest: 140,
                vpack: "center",
                value,
            }),
        ],
    })
}


function SysTray() {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
            child: Widget.Icon({ icon: item.bind("icon") }),
            on_primary_click: (_, event) => item.activate(event),
            on_secondary_click: (_, event) => item.openMenu(event),
            tooltip_markup: item.bind("tooltip_markup"),
        })))

    return Widget.Box({
        children: items,
    })
}


// layout of the bar
function Left() {
    return Widget.Box({
        spacing: 8,
        children: [
            Launcher(),
            Workspaces(),
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 8,
        children: [
            Media(),
        ],
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            Volume(),
            BatteryLabel(),
            SysTray(),
	    Clock(),
        ],
    })
}

function Bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        }),
    })
}

App.config({
    style: "./style.css",
    windows: [
        Bar(),
        NotificationPopups(),
        applauncher,

        // you can call it, for each monitor
        // Bar(0),
        // Bar(1)
    ],
})

export { }
