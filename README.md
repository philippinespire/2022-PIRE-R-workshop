# 2022_PIRE_R_workshop
This repository was created separate from the [2022_PIRE_omics_workshop](https://github.com/philippinespire/2022_PIRE_omics_workshop) repository to make it easier for attendees to clone workshop materials locally. Additionally, the course work can be taught/used stand alone and thus warrants its own separate repository. Below are the relevant information from the main workshop [README](https://github.com/philippinespire/2022_PIRE_omics_workshop/blob/main/README.md)

![](https://github.com/Getterrobog/DipterygonotusBalteatus/blob/main/PPP_logo.png)

This is the README for the 2022 PIRE Omics Workshop. It contains a link to the daily schedule, information on the workshop participants and personnel, links and installation directions for necessary software/programs, and a guide to preparing, processing, and analyzing shotgun data. During this workshop, we will be following the [PIRE SSL](https://github.com/philippinespire/pire_ssl_data_processing) and [PIRE Pre-Processing](https://github.com/philippinespire/pire_fq_gz_processing) pipelines, although both have been modified slightly for the purposes of the workshop.

---

## Schedule

Here is a link to the daily [schedule](https://docs.google.com/spreadsheets/d/17KVHAxO8ihgFinT20YejtroK7-l133fBxTAzXAmE8CM/edit#gid=1010648430).

---

## List of Instructors

|Position |Name | Institution | Contact |
| --- | --- | --- | --- |
| Professor | Kent Carpenter | ODU | cbird@odu.edu |
| Professor | Chris Bird | TAMUCC | kcarpent@odu.edu |
| Postdoc | [Eric Garcia](https://ericgarciaphd.wordpress.com) | ODU | e1garcia@odu.edu |
| Postdoc | Brendan Reid | Rutgers | br450@sebs.rutgers.edu |
| PhD Student | Rene Clark | Rutgers | rdc129@scarletmail.rutgers.edu |
| PhD Student | Kyra Fitz | Rutgers | ksf63@dls.rutgers.edu |
| PhD Student | John Whalen | ODU | jwhal002@odu.edu |
| PhD Student | Jemelyn Baldisimo | ODU | jbald004@odu.edu |
| M.Sc Student | George Bonsall | ODU | gbons002@odu.edu |
| M.Sc Student | Roy Roberts | TAMUCC | rroberts3@islander.tamucc.edu |
| REU/Post-Bac | Jordan Rodriguez | TAMUCC | jrodriguez216@islander.tamucc.edu |

## List of Participants

|Position |Name | Institution | Contact |
| --- | --- | --- | --- |
| REU/Post-Bac |Abigail Ethridge | ODU | aethr001@odu.edu |
| REU/Post-Bac |Eryka Molino | ASU | emolino1230@gmail.com |
| REU/Post-Bac |Rebecca Ruiz | TAMUCC | rruiz25@islander.tamucc.edu |
| REU/Post-Bac |Allison Fink | Rutgers | agf63@scarletmail.rutgers.edu |
| REU/Post-Bac |Marial Malabag | Rutgers | mjm751@scarletmail.rutgers.edu |
| RA | Kevin L. Labrador | UP Mindanao | kllabrador@up.edu.ph |
| RA | Maybelle A. Fortaleza | UP Mindanao | mafortaleza@up.edu.ph |
| RA | Joemarie L. Lanutan | UP Mindanao | jjlanutan@up.edu.ph |
| Professor | Cleto L. Nanola Jr. | UP Mindanao | clnanola@up.edu.ph |
| M.Sc. Student | Omar Mahadalle | Siliman University | omaramahadalle@su.edu.ph | 
| M.Sc. Student | Abner Bucol | Siliman University | abnerbucol2013@gmail.com
| M.Sc. Student | Chandelle Jablonski | ODU | cjabl001@odu.edu |
| M.Sc. Student | Nichole Leach | ODU | npete006@odu.edu |

---

## Required Software for the Workshop

In order to run the SSL pipeline and follow along with the workshop exercises, you will need to make sure you have the following accounts set-up and programs installed on your local computer (if you intend on using one of the computers in the computer lab, you only need to complete step 1).

1. Create a free [GitHub account](https://github.com/). 
    * Once you have your account, set up [two-factor authentification](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa).
    * You will also need a personal access token (PAT) to use GitHub on the HPC cluster. To set this up, follow [these instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token). **MAKE SURE TO SAVE THIS TOKEN SOMEWHERE ON YOUR COMPUTER SO YOU CAN COPY-AND-PASTE!**
2. **WINDOWS ONLY:** Install a Linux Distribution on Windows using the Windows Subsystem for Linux. Follow these steps:
    * Update Windows to the newest version (Windows 10 version 2004 and higher are required, you do not need Windows 11). To update, type "Check for Updates" in the taskbar search bar.
    * Open "Windows PowerShell". You can search for it in the same location where you typed "Check for Updates". Open Windows PowerShell by right-clicking and then left-clicking "Run as Administrator".
    * In the PowerShell Terminal, run the following command (do NOT copy and paste): `wsl --install`.
    * After the command finishes, restart your computer. Once it has restarted, an Ubuntu terminal will open and finish the installation. The installation will take a bit.
    * The terminal will ask for a Username and a Password. Use whatever Username you would like, it will become the name of the User directory. A password is not necessary if you do not want to use one, just enter nothing for both the "New Password" and "Retype Password" prompts.
    * After installation is complete, download [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=en-us&amp%3Bgl=US).
    * Windows Terminal will open PowerShell automatically. Click the "v" symbol next to the "+" (new tab) button and go to "Settings".
    * The first option under "Startup" is "Default Profile". Change this to "Ubuntu" and save your changes.
    * To open again, just type "Terminal" in the taskbar search bar and open the App.
4. Install a text editor. Our recommended free editors:
    * For Macs: the free version of [BBEdit](https://www.barebones.com/products/bbedit/)
    * For Windows (PCs): [Notepad++](https://notepad-plus-plus.org/downloads/)
5. Install [R (v4.2.0 or 4.2.1)](https://www.r-project.org).
6. Install [RStudio](https://www.rstudio.com/products/rstudio/download/)
    * Once R and RStudio are installed, install the following packages (with all dependencies): tidyverse & adegenet.

---
