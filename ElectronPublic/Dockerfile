# escape=`
FROM jkoubova/vs2019

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]
WORKDIR C:\TEMP

COPY InstallChocolatey.cmd .
RUN InstallChocolatey.cmd

COPY InstallGit.cmd .
RUN InstallGit.cmd

COPY InstallElectronDeps.cmd .
RUN InstallElectronDeps.cmd

COPY InstallDepotTools.cmd .
RUN InstallDepotTools.cmd

COPY InstallElectronBuildTools.cmd .
RUN InstallElectronBuildTools.cmd
