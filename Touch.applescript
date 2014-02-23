# Copyright (C) 2010 Ivan Maeder
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

on open (directory)
	touch(directory)
end open

on run
	try
		tell application "Finder" to set workingDirectory to the POSIX path of (the target of the front window as text)
	on error
		set workingDirectory to "~/Desktop"
	end try
	
	touch(workingDirectory)
end run

on touch(directory)
	set filename to text returned of (display dialog directory with title "Touch" with icon (path to resource "droplet.icns" in bundle (path to me)) default answer "Filename")
	do shell script "touch \"" & POSIX path of directory & "/" & filename & "\""
	tell application "Finder"
		select file ((target of the front window as text) & filename)
	end tell
end touch