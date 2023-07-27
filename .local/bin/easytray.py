#!/usr/bin/python3
import os
import signal
import argparse
import gi

gi.require_version('Gtk', '3.0')
gi.require_version('AppIndicator3', '0.1')

from gi.repository import Gtk as gtk
from gi.repository import AppIndicator3 as appindicator

class EasyTray():
    def __init__(self, app_id, icon, *commands):
        self.commands = commands

        # can change to appindicator.IndicatorCategory.APPLICATION_STATUS
        self.indicator = appindicator.Indicator.new(app_id, icon, appindicator.IndicatorCategory.SYSTEM_SERVICES)
        self.indicator.set_status(appindicator.IndicatorStatus.ACTIVE)

        self.menu = gtk.Menu()

    def run(self):
        signal.signal(signal.SIGINT, signal.SIG_DFL)
        self.menu.show_all()
        self.indicator.set_menu(self.menu)
        gtk.main()
    
    def add_item(self, item_text, command, is_quit=False):
        item = gtk.MenuItem(label=item_text)
        if is_quit:
            item.connect('activate', lambda source: self.run_quit(command))
        else:
            item.connect('activate', lambda source: self.run_command(command))
        self.menu.append(item)

    def run_command(self, command):
        os.system(command)

    def run_quit(self, command):
        self.run_command(command)
        gtk.main_quit()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            prog='easytray',
            description='Easily add system tray items',
            epilog='example: $ ./easytray.py test media-record -i "test" "echo test" -q "exit" "echo goodbye"',
            usage='%(prog)s app_id icon -i|-q label_text command')
    parser.add_argument('app_id')
    parser.add_argument('icon')
    parser.add_argument('-i', '--item', action='append', nargs=2, default=None)
    parser.add_argument('-q', '--quit_item', action='append', nargs=2, default=None)

    args = parser.parse_args()
    if args.item is None and args.quit_item is None:
        print("At least one menu item is required")
        parser.print_help()
        exit()

    t = EasyTray(args.app_id, args.icon)

    if args.item != None:
        for name, cmd in args.item:
            t.add_item(name, cmd)
    if args.quit_item != None:
        for name, cmd in args.quit_item:
            t.add_item(name, cmd, is_quit=True)
    t.run()
