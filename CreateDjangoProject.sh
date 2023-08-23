#!/bin/bash

# V1.0.1
# TODO: Add a check to make sure that the user has all dependent programs to run
# the script. If the user does not have the required dependent programs, offer to
# have the script install them, or update them.

# Function to check if a command is available.

command_exists() {
  command -v \$1 >/dev/null 2>$1
}

# Ask the user for the name of the project.
echo "Enter a name for you Django project:"
read ProjectName

# Check if the directory .venvs exists.
if [ ! -d "./.venvs" ]; then
  # If not, then ask the use rif they want to create the directory.
  while true; do
    echo ".venvs directory does not exist."
    echo "Do you want to create it? (yes|no)"
    read answer

  # If the answer is yes, then create the directory and break the loop.
    if [ "$answer" = "yes" ]; then
      mkdir ./.venvs
      break
    elif [ "$answer" = "no" ]; then
      # If the answer is no, then exit the script.
      echo ".venvs directory is required."
      clear
      echo "Exiting..."
      exit 1
    else
      echo "Invalid input."
      echo "Please answer only yes or no."
    fi
done
fi

clear

# Navigate to the directory where you want to create the virtual environment
echo "Entering '.venv' Directory..."
cd ./.venvs/

# Create the virtual environment
clear && echo "Creating the virtual environment '$ProjectName'..."
python3 -m venv ./$ProjectName
clear && echo "The virtual environment $ProjectName has been created."

# Activate the virtual environment
cd $ProjectName
clear && echo "Activating " && source ./bin/activate

# Update PIP so not to run into funny business.
echo "Updating PIP..."
python3 -m pip install --upgrade pip
clear && echo "PIP has finished updating..."

# Install Django
echo "Installing Django..."
pip install django -v
clear && echo "Django installed..."

# Go back to the root folder.
cd ..
cd ..

# Create the Django project
echo "Creating project: $ProjectName ..."
django-admin startproject $ProjectName

#Enter project folder.
cd ./$ProjectName/$ProjectName

clear && echo "Creating folder structure..."
echo " Making   file: requirements.txt" && touch requirements.txt  #  TODO: Add requirments to file auto-magicaly.
echo " Making folder: apps" && mkdir ./apps # TODO: Add base files to folders? --V
echo " Making folder: static " && mkdir ./static
echo " Making folder: media" && mkdir ./media
echo " Making folder: tempalates" && mkdir ./templates

clear

echo "/$ProjectName/"
echo "|-- manage.py"
echo "|-- $ProjectName"
echo "    |-- asgi.py"
echo "    |-- __init__.py"
echo "    |-- settings.py"
echo "    |-- urls.py"
echo "    |-- wsgi.py"
echo "|-- requirements.txt"
echo "|-- apps/"
echo "|-- static/"
echo "|-- media/"
echo "|-- templates/"
echo ""
echo "Congrats! Django has successfully installed."
echo ""
echo "Program written by:"
echo "Francois Ernst Venter 8/8/2023"
echo ""
