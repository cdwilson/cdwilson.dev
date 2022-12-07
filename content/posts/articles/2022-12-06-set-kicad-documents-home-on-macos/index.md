---
title: Set KICAD_DOCUMENTS_HOME on macOS
authors:
- Chris Wilson
date: "2022-12-06"
draft: false
slug: set-kicad-documents-home-on-macos
tags:
- KiCad
- macOS
disableComments: false
typora-copy-images-to: ./images
---

# KiCad Documents Home

KiCad 6.x introduced the concept of the "KiCad Documents Home" base directory, described as the:

> Base path of KiCad user-modifiable documents, such as projects, templates, Python scripts, libraries, etc. Subdirectories will be created within this directory for each KiCad minor version. This directory is provided as a suggested user data location, but does not need to be used.

By default, KiCad creates this folder in `~/Documents/KiCad/`:

```
~/Documents/KiCad/
├── 6.0
│   ├── 3dmodels
│   ├── 3rdparty
│   ├── footprints
│   ├── plugins
│   ├── projects
│   ├── scripting
│   ├── symbols
│   └── template
└──6.99
    ├── 3dmodels
    ├── 3rdparty
    ├── footprints
    ├── plugins
    ├── projects
    ├── scripting
    ├── symbols
    └── template
```

**However, you may not want this directory located within your `~/Documents` folder.** For example, you might have iCloud Drive syncing your Documents and Desktop folders to the cloud, and don't want the KiCad folders included in this automatic sync. Or (like me), you keep all your KiCad projects in a top-level `Projects/` directory.

The [KiCad documentation](https://docs.kicad.org/master/en/kicad/kicad.html) says that this directory location can be changed by setting the `KICAD_DOCUMENTS_HOME` environment variable, but it wasn't immediately obvious to me how to set this for a GUI app on macOS.

# Set KICAD_DOCUMENTS_HOME on macOS

There are probably other ways to do this, but the trick I ended up using is to set the `KICAD_DOCUMENTS_HOME` environment variable via a [LaunchAgent](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html) that runs on startup.

I created a launchd property list file that sets `KICAD_DOCUMENTS_HOME` to `/Users/chris/Projects/`. Make sure to set this to the path where you want your top-level `KiCad` folder to be created.

`~/Library/LaunchAgents/org.kicad.env.KICAD_DOCUMENTS_HOME.plist`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>org.kicad.env.KICAD_DOCUMENTS_HOME</string>
        <key>ProgramArguments</key>
        <array>
            <string>sh</string>
            <string>-c</string>
            <string>launchctl setenv KICAD_DOCUMENTS_HOME "/Users/chris/Projects/"</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
```

Now, restart your Mac and fire up KiCad. It should automatically create the `KiCad` folder in the new `KICAD_DOCUMENTS_HOME` path 🎉

# Set KICAD_CONFIG_HOME on macOS

It's worth mentioning that it's also possible to change the base path for KiCad's configuration files by setting the  `KICAD_CONFIG_HOME` environment variable. The default path is `~/Library/Preferences/kicad/`, but the property list method above can be used to change this location.

`~/Library/LaunchAgents/org.kicad.env.KICAD_CONFIG_HOME.plist`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>org.kicad.env.KICAD_CONFIG_HOME</string>
        <key>ProgramArguments</key>
        <array>
            <string>sh</string>
            <string>-c</string>
            <string>launchctl setenv KICAD_CONFIG_HOME "/Path/to/config"</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
```

# Feedback

Anything I got wrong? Do you know of better ways to set environment variables on macOS?

Let me know in the comments below.
