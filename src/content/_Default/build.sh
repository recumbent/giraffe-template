#!/bin/sh
#if (Paket)
dotnet tool restore
if [ ! -e "paket.lock" ]
then
    dotnet paket install
else
    dotnet paket restore
fi
#endif
dotnet restore
dotnet build --no-restore
#if (!ExcludeTests)
dotnet test --no-build
#endif