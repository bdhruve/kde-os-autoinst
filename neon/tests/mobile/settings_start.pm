
# Copyright (C) 2018 Bhavisha Dhruve <bhavishadhruve@gmail.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License or (at your option) version 3 or any later version
# accepted by the membership of KDE e.V. (or its successor approved
# by the membership of KDE e.V.), which shall act as a proxy
# defined in Section 14 of version 3 of the license.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use base "basetest";
use strict;
use testapi;

sub run {
    wait_still_screen;
    send_key 'ret';

    # wait for plasma-mobile screen to appear.
    assert_screen 'plasma-mobile-start', 60;
    assert_and_click 'plasma-mobile-settings';
    type_string 'settings';
    send_key 'tab';
    assert_and_click 'plasma-mobile-selectsettings';
    assert_and_click 'plasma-mobile-opensettings';
    assert_screen 'plasma-mobile-audiovol', 60;
    assert_and_click 'plasma-mobile-audiovol';
    assert_and_click 'plasma-mobile-closesettings';

}

sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'
    return { important => 1 };
}

1;
