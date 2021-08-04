Wellbe: Task Todo Assignment
==============================================

About
-----

Wellbe task list is an application that manage task list for patients. feature includes

 - Create Tasks
 - Create Task Items
 - Create Patients
 - Assign Tasks
 - Track Task progress
 

------------------------------------------------------------------------
Pre-requisite
-----
- nvm
- yarn
- node -v 16.0.0
- ruby -v 2.6.5
- postgresql


**Nvm** is a version manager for node.js, designed to be installed per-user, and invoked per-shell. nvm works on any POSIX-compliant shell (sh, dash, ksh, zsh, bash), in particular on these platforms: unix, macOS, and windows WSL.

**Installation**


If you\'re using Debian:

    $ sudo apt install node.js
    $ curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
    $ bash install_nvm.sh
    
Update your bash profile to load nvm

    export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion    


    $ nvm install 16.0.0
    $ nvm use 16.0.0
-----------------------------------------------------------------------
Setup
-----

create database:

    $ rails db:create

migrate database:

    $ rails db:migrate

install webpacker requirements
    
    $ rails webpacker:install

purge existing precompiled assets

    $ rails assets:clobber

precompile assets

    $ rails assets:precompile 

Run Test Cases
----------

run controller tests

    $ rails test test/controller
    
run model tests

    $ rails test test/models
    
run system tests

    $ rails test test/system

Run Server
----------
run the rails server

    $ rails server

-------------------------------------------------------------------------

Deployment commands
-------------------

*Pending capistrano setup*

--------------------------------------------------------------------------

Notes
--------

    - Task and Task item are not paginated
    - Dropdowns can converted to remote dropdown using elastic search for scalability
    - Common UI can be extracted into rails mountain view components
    
as this was only 3-5 hours exercise, but above improvements requires time to implement
