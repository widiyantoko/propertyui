# PropertyUI

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

Local
```
1. Java(TM) SE Runtime Environment (build 1.8.0_162-b12)
2. grails (3.1.x)
3. gradle (min version 3.1)
4. MySQL database (for local development) with table propertyui. Match the development environment settings in the application.yml file
```

### Installing

Uses Homebrew and SDKMAN! for dependancy management. 

To install Homebrew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

For instructions on how to setup SDKMan, please follow instructions at:

```
http://sdkman.io/install.html
```

After Homebrew & SDKMAN! are installed:

```
# Install java via Homebrew
brew tap caskroom/versions
brew cask install java8
```

```
# Setup JAVA_HOME 
export JAVA_HOME=/Library/Java/Home
export PATH="$PATH:$JAVA_HOME/bin"
```

You can setup Java with SDKMAN! too, just be sure to export JAVA_HOME to the location of your SDK.

```
# Install grails
sdk install grails 3.1.3
```

```
# Install gradle
3. sdk install gradle 3.1 
```

## License

Copyright 2019 gHost Dev
