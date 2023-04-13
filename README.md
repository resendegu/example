# Output Get

**A simple plugin for getting any output you want**

This plugin is very simple. It will read files under /var/lib/ocsinventory-agent/outputget/ and will return the content of each file to you OCS Interface.

**Use cases**

A good example, is a build that you make in OCS Inventory and deploy to the clients, but you would like to get the output of the command you ran, for example. Then, all you need to do is to make your command output to be stored in a file under the path /var/lib/ocsinventory-agent/outputget/. The script will read all the files in it, and return with each rows being a different file.
