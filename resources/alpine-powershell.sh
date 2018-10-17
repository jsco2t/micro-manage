# based on: https://github.com/PowerShell/PowerShell-Docker/blob/master/release/preview/alpine/docker/Dockerfile

PS_VERSION=6.1.0-rc.1
PS_PACKAGE=powershell-${PS_VERSION}-linux-x64.tar.gz
PS_PACKAGE_URL=https://github.com/PowerShell/PowerShell/releases/download/v${PS_VERSION}/${PS_PACKAGE}
PS_INSTALL_VERSION=6-preview
export PS_INSTALL_FOLDER=/opt/microsoft/powershell/$PS_INSTALL_VERSION

# Download the Linux tar.gz and save it
curl -L -o /tmp/linux.tar.gz ${PS_PACKAGE_URL}

# Create the install folder
mkdir -p ${PS_INSTALL_FOLDER}

# Unzip the Linux tar.gz
tar zxf /tmp/linux.tar.gz -C ${PS_INSTALL_FOLDER}

# TODO: once the official build produces a full package for Alpine, remove this overlay of the apline files
# Download the apline powershell .tar.gz package
curl -L -o /tmp/alpine.tar.gz https://github.com/TravisEz13/PowerShell/releases/download/v6.1.0-rc.1/powershell-6.1.0-fixalpine-linux-musl-x64.tar.gz

# Extract the Alpine tar.gz
tar zxf /tmp/alpine.tar.gz -C ${PS_INSTALL_FOLDER}

# Define Args and Env needed to create links
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# Install dotnet dependencies and ca-certificates
apk add --no-cache \
    \
    # PSReadline/console dependencies
    ncurses-terminfo-base \
    \
    # .NET Core dependencies
    krb5-libs \
    libgcc \
    libintl \
    libssl1.0 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    icu-libs \
    && apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust \
    \
    # Create the pwsh symbolic link that points to powershell
    && ln -s ${PS_INSTALL_FOLDER}/pwsh /usr/bin/pwsh \
    \
    # Create the pwsh-preview symbolic link that points to powershell
    && ln -s ${PS_INSTALL_FOLDER}/pwsh /usr/bin/pwsh-preview
