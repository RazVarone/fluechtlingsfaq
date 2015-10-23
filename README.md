Vielen Dank für dein Interesse an Mitarbeit in der Flüchtlings-FAQ!

Format
======

Die FAQ ist grösstenteils in Markdown geschrieben. Eine genaue Beschreibung
von Markdown findest du unter
<https://daringfireball.net/projects/markdown/syntax>

Besonderheiten im Markdown-Format auf der Seite:

 * Es sollten nur Überschriften zweiter Ordnung verwendet werden (-- statt ==).
 * Die erste Zeile jeder Datei landet nicht im Markdown-Teil, sondern wird
   automatisch zur Seitenüberschrift.

Aktualisierung
==============

Zum Aktualisieren der Seite reicht es, deine Änderung auf GitHub zu pushen
oder eine Pull Request zu stellen. Sobald die Änderung auf einem der beiden
Wege eingepflegt wurde, läuft regelmässig ein Skript auf den Servern, auf
welchem die Webseite läuft, welches bin/genpage.sh ausführt.

Zu einem späteren Zeitpunkt könnte ein Dienst eingerichtet werden, welcher
diese Aktualisierungen automatisch vornimmt, sobald auf GitHub eine Änderung
vorgenommen wird.

Änderungen an bin/genpage.sh benötigen jedoch die Bestätigung des
Server-Admins und sind ohne neue Signatur des Admins nicht gültig.
