# Semesterarbeit Einreichungsformular / Klasse ITCNE25

Im Folgenden beschreibt der Studierende das geplante Thema seiner Zertifikatsarbeit. Der Studierende orientiert sich dabei an dem Bewertungsraster. Der begleitende Dozent entscheidet, ob es sich dabei um ein geeignetes Thema handelt und fügt seine Kommentare und Überlegungen hinzu.

## Name und Vorname des Studierenden

Robin Kiefer

## Titel der Semesterarbeit

_​​Redhat Deployment Automation in First365 (POC) mit Infrastructure as Code (IaC)​_

## Zu behandelnde Themenfelder / Module (bitte ankreuzen)

| **Pkt.** | **Themenfeld / Modul** |     |
| --- | --- | --- |
|     | Projektmanagement (Cäsar Roth) | Pflicht |
|     | Netzwerktechnik / Netzwerkarchitektur (Philipp Albrecht) | ☐   |
|     | AWS Einstieg (Marcello Callisto) | ☐   |
|     | Infrastructure as Code (Armin Dörzbach) | x   |
|     | Führung / Kommunikation / Persönlichkeitsentwicklung (Jürg Mattes) | ☐   |
|     | Azure Cloud (Thanam Pangri oder Samuel Müller) | ☐   |
|     | Private Cloud (z.B. MAAS.io) (Philipp Rohr) | ☐   |
|     |     | ☐   |
|     |     | ☐   |

Kurzbeschreibung des Zertifikatsarbeit Themas**  
(1 bis max. 2 Seiten)**

### Problemstellung

## Ausgangslage

In unserem Unternehmen betreiben wir ein eigenes Datacenter. Dieses wird von hier mit dem Offiziellen Namen first365 bezeichnet. Unser Datacenter hat ein Primären Standort Zürich und eine Redundanz in Bern. Die Virtualisierung wird durch vCenter / vCloud realisiert. In Rücksprache und Analyse der Situation konnte ich sehen, dass wir in der Automatisierung im bereich IAC nur sehr wenig umgesetzt haben. Im RedHat bereich habe wir keine Automatisierung für das Deployment. Nach abklärungen mit Thomas Koller (Teamleiter Datacenter), Michael Hediger (Abteilungsleiter Engineering) und Lukas Studer (CISO) habe ich das Bedürfnis für Ausbau aufgenommen und somit einen Internen Projektantrag für einen POC erstellt.

**Dieser Projetantrag basiert auf dem vorher eingereichten Firmen Internen Projektantrag:**

Referenz: [*Interner Projektantrag*](Interner%20Projektantrag.md)

**POC-Fragestellung:**

- Ist IAC zu aufwendig und haben wir zu wenig Deployments um hier einen Vorteil herauszuziehen, verglichen zum Aufwand?
- Können wir IAC-Lösungen einfach mit unserer VMware Umgebung integrieren?
- Inwiefern wird dies first365 und den Networkers<sup>[\[1\]](#footnote-2)</sup> helfen, effizienter zu sein?

### Ziele

**POC-Annahmen:**

- Integration in first365 ist leicht umsetzbar und kann durch wenig Aufwand unterhalten werden.
- Ausbau ist jederzeit granular möglich
- Ausbaumöglichkeiten betreffen Arbeiten in first365 wie auch mögliche Anwendungen in lokalen Umgebungen bei Kunden.
- Aufwand und Kosten sehen IAC zu Gunsten.

**Allgemeine Ziele:**

- Vorschlag für Umsetzung in first365
- POC-Bericht abliefern mit allen Fragen des POCs beantwortet  
- POC soll mit möglichst geringem Aufwand in die Produktion aufgenommen werden können

&nbsp;

**Konkrete Ziele:**

Das Projekt wird sich im Konkreten um die komplette Automatisierung von Redhat Linux Deployments in first365 kümmern.

### Terminplan

<table><tbody><tr><th><p>Zeitraum&nbsp;</p></th><th><p>Arbeitspaket&nbsp;</p><p>(Arbeitspaket-Beschreibung, Aufwand pro Paket, wer leistet wieviel h?)&nbsp;</p></th><th><p>Verantwortlich&nbsp;</p></th></tr><tr><td><p>05.05.2025 – 15.05.2025</p></td><td><p>Erstellung eines Vision &amp; Scope inkl. SWOT und PUA&nbsp;</p></td><td><p>Robin Kiefer&nbsp;</p></td></tr><tr><td><p>15.05.2025 – 25.05.2025</p></td><td><p>Erstellen des Konkreten Projektplans (Project Workbook)&nbsp;</p></td><td><p>Robin Kiefer&nbsp;</p></td></tr><tr><td><p>25.05.2025 – 16.06.2025</p></td><td><p>Projekt Umsetzung&nbsp;</p><ul><li>Anhand Project Workbook&nbsp;</li><li>Parallelerstellung des POC-Berichts&nbsp;</li></ul></td><td><p>Robin Kiefer&nbsp;</p></td></tr><tr><td><p>Juni 2025</p></td><td><p>Projekt Präsentation an definierte Stakeholder&nbsp;</p></td><td><p>Robin Kiefer&nbsp;</p></td></tr><tr><td><p>Juni 2025</p></td><td><p>Projekt Abnahme&nbsp;&nbsp;</p></td><td><p>Robin Kiefer&nbsp;</p></td></tr></tbody></table>

### Sachmittel

- _Zugikirsch Infrastruktur ie. Interne Testumgebung_
- _GitTea@firstframe ie. Interne GitTea_
- _Qwiki ie. Interne Prozesse und Referenzen_

### Vorgaben, Methoden und Werkzeuge

- Interne Referenzen und Prozesse für Projektabwicklung
- Vorgaben und Guidelines TBZ
- Klassisches Projektmanagement
- ITIL
- _Teams, Kommunikation, Projektablage, Projektmanagement via Planner_

### Risiken

**Technische Risiken:**

- **Integration**: Schwierigkeiten bei der Integration der IaC-Lösungen in die bestehende VMware-Umgebung.
- **Komplexität**: Die Implementierung von IaC könnte sich als zu aufwendig erweisen, insbesondere wenn die Anzahl der Deployments nicht ausreichend ist, um den Aufwand zu rechtfertigen.

**Organisatorische Risiken:**

- **Zeitplan**: Verzögerungen im Projektzeitplan, die den geplanten Start- und Endtermin beeinflussen könnten.

**Sicherheitsrisiken:**

- **Datenschutz**: Sicherstellung, dass kein Code vom Deployment auf den Maschinen verbleibt und keine Plain Text Übertragungen von Code oder Kennwörtern stattfinden.

**Entscheid des begleitenden Dozenten**

Bitte ankreuzen

- Genehmigt ☐
- Zu verbessern ☐
- Abgelehnt ☐

**Begleitender Dozent**

Ort und Datum: \_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**

Name & Unterschrift: \_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**\_**_

**Bewertungsraster für Beurteilung des Antrages**

| **Kriterium** | **Kommentare** | **Erfüllt** |
| --- | --- | --- |
| **Anforderungen an die Form (Strukturierung) der Semesterarbeit** |     |     |
| Problemstellung |     | ☐   |
| Ziele (mindestens drei!) |     | ☐   |
| Risiken bezogen auf Zertifikatsarbeit |     | ☐   |
| Themenfelder (mindestens zwei!) |     | ☐   |
| **Anforderungen an Qualität der Semesterarbeit** |     |     |
| Machbar |     | ☐   |
| Praxisnah |     | ☐   |
| Herausfordernd |     | ☐   |
| Lehrgangsbezug |     | ☐   |

Damit die Semesterarbeit angenommen wird, müssen alle Kriterien erfüllt sein.

1. Interner Standard ist es im Zusammenhang mit Mitarbeitenden der firstframe networkers ag von zu networkers sprechen. [↑](#footnote-ref-2)