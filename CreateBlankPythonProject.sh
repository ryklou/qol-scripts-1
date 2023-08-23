# Ask the user for the name of the project.
echo "Enter a name for the Blank Python Project:"
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

clear && echo "Congrats! Django has successfully installed."
echo ""
echo "Program written by:"
echo "Francois Ernst Venter 8/8/2023"
echo ""

