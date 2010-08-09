NowIAmMayor
===========

Small example of addressing internationalization, localization, and accessibility in iOS apps.  This is not meant to be complete nor is the app idea itself especially useful.  It allows you to tweet that you're the "mayor" of a location without ever signing up on Foursquare.  It raises the level of oversharing by tweeting how much you spent as well.  

The completed project will have at least two significant tags for "non-i18n" (the ugly American version) and later one or more versions localized to non-English languages.

Internationalization and Localization Steps
--------------------------

1.  Date formatter was internationalized by default.  Created formatAsCurrency: to parse the "spent" field into a decimal then format it as a string according to the locale.

2.  Right-clicked MayorViewController.xib > Get Info > Make File Localizable. File now has a disclosure arrow beside it that reveals "English".  

3.  Added Swedish by right-clicking MayorVC.xib > Get Info > General > Add Localization.  The dropdown list only has a few languages (none Swedish).  This is OK, just type the correct two-char country designation ("sv") from this list http://www.loc.gov/standards/iso639-2/php/English_list.php .  Somewhat awkwardly, they two localizations are now "English" and "sv" but it all works.

4.  Opened the sv version of MainViewController.xib in IB and changed strings to Swedish versions.  If working with a bigger team, it may be worthwhile to use the "ibtool generate-stringsfile" which will create a textfile similar to a localizable.strings file which you could later merge back with "ibtool --write".  See Apple's "Interface Builder User Guide" under the Localization section for more details. 

5.  Localized "Send" image by performing the same basic steps as in #3 on "image_send.png" and "image_send@2x.png".  Updated the Opacity project to output English and Swedish versions of this image in the correct directories.  

6.  Tweet text was still English so created a Localizable.strings file for this and "username" and "password".  Right-clicked Resources > Add File > Mac OS X > Resource > Strings file named "Localizable.strings".  Unlike many files in XCode, this must be named precisely.  Make localizalbe in English and Swedish like in step #3.

7.  Added all strings that will be made localizable to English file first in form:

    "Some string in code" = "Localized version of string";

8.  Changed hard-coded string literals that require translation to use form:

    NSLocalizedString(@"username", @"username")
	
9.  Examined accessibility via VoiceOver by enabling in Settings.  The only significant problem was the "Send" button which didn't have a useful description.  Changed this through the English and sv .xibs by setting the Accessibility label to "Send" or "Skicka".


The MIT License
---------------

Copyright 2010 Barry Ezell

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.