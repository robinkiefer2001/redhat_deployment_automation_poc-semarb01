# Proof of Concept & Testprotokoll  

**Projekt: Automatisiertes RHEL Deployment via Ansible, Image Builder und vSphere**

## 1. Zielsetzung

Ziel dieses Proof of Concept (POC) war der Nachweis, dass sich Red Hat Enterprise Linux (RHEL) Systeme vollständig automatisiert und flexibel via Ansible, Red Hat Image Builder API und VMware vSphere bereitstellen lassen. Die Lösung soll nach Best Practices aufgebaut, modular erweiterbar und einfach in die bestehende Cloudlösung **first365** integrierbar sein.

---

## 2. Ausgangslage

- Bislang keine standardisierte und wiederholbare Methode zur automatisierten RHEL-Provisionierung.
- Unterschiedliche Anforderungen je nach Kunde/Projekt (Diskgrösse, CPU, RAM, Netzwerkkonfiguration).
- Ziel: Minimaler Hands-on-Aufwand und maximale Wiederverwendbarkeit.

---

## 3. Lösungskonzept

Die Lösung basiert auf folgenden Komponenten:

- **Ansible** als Automatisierungswerkzeug
- **Red Hat Image Builder API** für dynamisches Image-Building (ISO)
- **vSphere** für die VM-Provisionierung
- **Firstboot-Skript** für kontextbasierte Konfiguration (Hostname, Zeitzone, Benutzer etc.)

**Besonderheiten:**

- Alle Parameter wie Disk Size, CPU, RAM sind über Variablen steuerbar.
- Bootskript ist modular und jederzeit anpassbar.
- Die ISO-Images werden bei jedem Lauf **neu erstellt**, um stets aktuelle Konfigurationen zu garantieren.
- Die meisten Templates lassen sich auch für **Windows Deployments** weiterverwenden.

---

## 4. Testprotokoll

### Allgemeine Angaben

- Test-ID: TST-RHEL-AUTO-001
- Datum: 2025-07-05
- Tester: Robin Kiefer
- Umgebung: GitLab Repo, Red Hat Image Builder API, VMware vSphere 8
- Zielsystem: Red Hat Enterprise Linux 9.3

### Testdaten

| Variable    | Wert                     |
|-------------|--------------------------|
| VM-Name     | rhel-test-001            |
| vCenter     | vcenter01.first365.local |
| Datastore   | ds01-nvme                |
| Netzwerk    | vLAN-10-Server           |
| Hostname    | rhel-test-001            |
| Timezone    | Europe/Zurich            |
| NTP-Server  | 0.ch.pool.ntp.org, 1.ch.pool.ntp.org |

---

### Testschritte & Ergebnisse

| Schritt | Beschreibung                           | Erwartung                        | Ergebnis | Kommentar                         |
|--------:|-----------------------------------------|-----------------------------------|:--------:|------------------------------------|
| 1       | Deployment via Ansible Playbook starten 1 Command mit Parametern          | Maschine erstellt und Ready für Use              | OK       | Dauer ca. 5 Hands-on / 60 Minuten Hands-off            |
| 2       | VM via vSphere erstellen                | VM erfolgreich angelegt           | OK       |     |
| 3       | VM bootet vom neuen ISO                 | Bootvorgang erfolgreich           | OK       |                                   |
| 4       | Bootskript läuft                        | Hostname, Zeitzone, User gesetzt | OK       |         |

---

### Beobachtungen

- Hands-on-Zeit: **~5 Minuten** (ein Befehl, dann automatisch).
- Hands-off-Zeit: **~60 Minuten** (Image Build via Red Hat API).
- Netzwerk- und Systemkonfiguration greifen korrekt.
- Keine Fehler im Bootprozess oder bei Skriptausführung festgestellt.

---

## 5. Bewertung

- Ziel erreicht: **Vollständige Automatisierung der RHEL-Bereitstellung** nach firmenspezifischen Anforderungen.
- Flexibilität: Hoch – Parameter wie Disk, CPU, RAM, Bootskript leicht anpassbar.
- Erweiterbarkeit: Gut – einfache Einbindung in bestehende GitLab Workflows und first365.
- Sicherheit: SSH-Only-Login umgesetzt, kein Default-Root-Zugriff.
- Monitoring-Integration wurde aus **Zeitgründen nicht umgesetzt**, lässt sich jedoch in ca. 4–5 Stunden **nachrüsten**.

---

## 6. Fazit

Der POC war **erfolgreich**. Das Deployment ist vollständig automatisiert, nachvollziehbar und lässt sich ohne weiteres auch auf andere Linux- oder Windows-basierte Deployments übertragen. Die gewählte Architektur folgt Best Practices und ist wartungsfreundlich.

Die Integration in **first365** ist gut umsetzbar und bietet eine tragfähige Grundlage für die Produktivsetzung.

---

## 7. Empfehlungen / Nächste Schritte

- Ergänzung um Monitoring-Integration (z. B. SNMP, PRTG-Anbindung)
- Rollout auf Windows-Deployment vorbereiten (Template-Anpassung)
- Einbindung in GitLab CI/CD zur vollständigen Automatisierung
- Absicherung über Vault-Integration für Zugangsdaten

---
