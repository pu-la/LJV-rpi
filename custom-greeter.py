#!/usr/bin/env python3

import gi

gi.require_version("LightDM", "1")
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, LightDM


class GreeterWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Kiosk Login")
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_border_width(10)

        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.add(vbox)

        self.entry = Gtk.Entry()
        vbox.pack_start(self.entry, True, True, 0)

        button = Gtk.Button(label="Login")
        button.connect("clicked", self.login_button_clicked)
        vbox.pack_start(button, True, True, 0)

        self.greeter = LightDM.Greeter()
        connected = self.greeter.connect_to_daemon_sync()
        print("Hello")
        if connected:
            print("Greeter connected to LightDM.")
            self.connect_signals()
        else:
            print("Failed to connect to LightDM.")

    def connect_signals(self):
        self.greeter.connect("authentication-complete", self.on_authentication_complete)
        self.greeter.connect("show-prompt", self.show_prompt)
        self.greeter.connect("show-message", self.show_message)
        self.greeter.authenticate(None)
        print("connection")

    def login_button_clicked(self, widget):
        username = "utilisateur"  # You can use a fixed username for a kiosk scenario.
        self.greeter.respond(username)

    def show_prompt(self, greeter, text, prompt_type):
        print("Prompt:", text)
        if "password:" in text.lower():
            self.greeter.respond("QAws12@@1")  # This should be the password response.

    def show_message(self, greeter, text, message_type):
        print("Message:", text)

    def on_authentication_complete(self, greeter):
        # Code pour si authentification est reussi ICI
        if greeter.get_is_authenticated():
            print("Authentication successful.")
            self.greeter.start_session_sync("xfce")  # Specify session
        else:
            print("Authentication failed")
            Gtk.main_quit()


def main():
    window = GreeterWindow()
    window.connect("delete-event", Gtk.main_quit)
    window.show_all()
    Gtk.main()


if __name__ == "__main__":
    main()
