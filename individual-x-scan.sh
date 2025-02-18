#!/bin/bash

#Funtions will be used 
ping_scan()
{
       echo -e "\e[93m⏳First its chechking that Target is up or not\e[0m" | pv -qL 30
       result=$(nmap -sn "$target")
       if [ $? -eq 0 ]; then
              echo -e "\e[95m🎯Target is up. Scan result:\e[0m" | pv -qL 26
              echo -e "\n"
              echo -e "\e[96m$result\e[0m"
              echo -e "\n"
              return 0
       elif [ $? -eq 1 ]; then
              echo -e "  \e[91m❌Target is down. No response from: $target\e[0m" | pv -qL 26
              return 1
       else
              echo -e " \e[97m❌Invalid target provided.\e[0m" | pv -qL 38
       fi
}
# This function allows the user to save collected information in a chosen format.
# It supports markdown (.md), text (.txt), and log (.log) file formats.
save_file()
{
       echo -e "\n"
        echo -e "\e[33m Information without storage is like a weapon without a wielder. ⚔️💿\e[0m" | pv -qL 30
              echo -e "\e[91m Save it now, or regret it later. Your choice. (yes/no) ⏳🖥️ \e[0m" | pv -qL 30
              read -p "Enter Choice: " save_choice

              if [[ "$save_choice" == "yes" || "$save_choice" == "y" ]]; then
       echo -e "\n\e[96mChoose file format: markdown (md), text (txt),XML (xml) or log\e[0m"  | pv -qL 35
       read -p "Enter Format Here: " format
       echo -e "\e[92mPlease enter the name of file below (e.g., result, report, etc.) \e[0m"  | pv -qL 35
       read -p "Enter Name Here: " name 
       if [[ -z "$name" ]]; then
          name="result"
       fi

       if [[ "$format" == "md" || "$format" == "markdown" ]]; then
              filename="$name.md"
       elif [[ "$format" == "txt" || "$format" == "text" ]]; then
              filename="$name.txt"
       elif [[ "$format" == "log" ]]; then
              filename="$name.log"
       elif [[ "$format" == "xml" || "$format" == "XML" ]]; then
              filename="$name.xml"
       else 
              echo -e "\e[91mInvalid choice, saving as .txt extension\e[0m"
              filename="$name.txt"
       fi

       # Ask for directory path
       echo -e "> \e[93mEnter the directory path where you want to save the file or hit enter to save in /HOME/Documents\e[0m" | pv -qL 40
       read dir_path

       # Set default path if user input is empty
       if [[ -z "$dir_path" ]]; then
              dir_path="$HOME/Documents"
       fi

       # Create the directory if it doesn't exist
       mkdir -p "$dir_path"

       # Move the temporary file to the chosen location
       mv "$temp_file" "$dir_path/$filename"

       echo -e "\e[32mOutput saved as $dir_path/$filename\e[0m" | pv -qL 25
       echo -e "\e[96m Active info collected, mission successful! 😁\e[0m" | pv -qL 35
              else
       rm "$temp_file"
       echo -e "\e[91mOutput not saved ❌\e[0m"
              fi
}

# This function asks the user if they want to continue scanning or exit.
# If the user chooses 'yes', it returns to the main menu; otherwise, it exits the script.
exit_or_return() {
       while true; do
              read -p "🤔Do you want to scan more? (yes/no): " choice 
              case $choice in
       [Yy]* ) return ;;  # Wapas main menu le jaye
       [Nn]* ) echo -e " \e[91m🚀Exiting...\e[0m"; exit 0 ;;  # Script exit kar de 
       * ) 
         echo " ⚠️Invalid input! Please enter yes or no.\e[0m" | pv -qL 26
       ;; 
              esac
       done
}
sudo -u $(whoami) /usr/games/cowsay -f tux "Individual-X Scan" | /usr/games/lolcat
echo -e "\n"
echo -e "\e[96m 🚀Starting the Individual-X Scan Tool....\e[0m\e[96mDeveloped by M.Izaz Haider....\e[0m" | pv -qL 40
echo -e "\n"


echo -e "\e[91mChecking about Target:\e[0m $target" | pv -qL 40
if ping -c 2 $target &>/dev/null; then
 echo -e "\e[33m Target is valid, proceeding next...\e[0m" | pv -qL 45
 
        # Displays a menu for individual scan types.  
        # Users can select from different scanning options.  
        # Includes an option to return to the main menu or exit.  
        echo -e "1)  \e[97mPing scan Automation (Check if host is online)\e[0m" | pv -qL 40
        echo -e "2)  \e[96mSimple Port Scan Automation (Top 1000 ports)\e[0m" | pv -qL 40
        echo -e "3)  \e[92mOS Detection Automation (Basic Guessing)\e[0m" | pv -qL 40
        echo -e "4)  \e[91mService Version Detection Automation (Basic Services)\e[0m" | pv -qL 40
        echo -e "5)  \e[93mDefault Nmap scripts scan Automation \e[0m" | pv -qL 40
        echo -e "6)  \e[94mReturn to Main menu or Exit\e[0m" | pv -qL 40
        echo -e "\n"
        read -p "Select an option (1-6): " option 
            # Checks if the user selected Ping Scan  
            # Verifies whether the target is reachable before proceeding  

            if [ "$option" -eq 1 ]; then
                ping_scan
                if [ $? -eq 0 ]; then
                echo -e "✅Target is online. You may proceed with further scans.\e[0m" | pv -qL 45
                else
                echo -e "❌Target is offline or unreachable. Please check the target\e[0m" | pv -qL 45
                fi

            
            # Checks if the user selected Simple Port Scan  
            # Ensures the target is online before proceeding  
            elif [ "$option" -eq 2 ]; then 
             ping_scan
                if [ $? -eq 0 ]; then
                read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
                    if [[ "$preview" == "p" || "$preview" == "P" ]]; then
                      temp_file=$(mktemp)
                     {

                       echo -e " \e[96m⏳ Initializing Simple Port Scan, please wait...\e[0m" | pv -qL 40
                       echo -e "\n"
                      nmap -Pn -v "$target"
                     } | tee "$temp_file"
                      save_file 
                      echo -e "\n" 
                      exit_or_return
                    else
                    temp_file=$(mktemp)
                    {
                    echo -e " \e[96m⏳ Initializing Simple Port Scan, please wait...\e[0m" | pv -qL 40
                      echo -e "\n"
                     nmap -Pn   "$target"
                    } | tee "$temp_file"
                    save_file 
                    echo -e "\n"
                    exit_or_return
                     fi
                else
                echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"
                fi

            # Checks if the user selected the Ping Scan option and runs a connectivity test.
            # Prompts the user to preview the scan results before execution or proceed directly.
            # Initializes and runs an nmap scan, saves the results, and handles user exit options.
            elif [ "$option" -eq 3 ]; then 
             ping_scan
                if [ $? -eq 0 ]; then
                read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
                    if [[ "$preview" == "p" || "$preview" == "P" ]]; then
                      temp_file=$(mktemp)
                     {

                       echo -e " \e[96m⏳ Initializing OS Detection, please wait...\e[0m" | pv -qL 40
                      nmap -Pn -O -v "$target"
                     } | tee "$temp_file"
                      save_file 
                      echo -e "\n"
                      exit_or_return
                    else
                    temp_file=$(mktemp)
                    {
                    echo -e " \e[96m⏳ Initializing OS Detection, please wait...\e[0m" | pv -qL 40
                      echo -e "\n"
                     nmap -Pn -O "$target"
                    } | tee "$temp_file"
                    save_file 
                    exit_or_return
                     fi
                else
                echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40
                fi
            # Checks if the user selected the Service Detection Scan option.
            # Prompts the user to preview the scan results before execution or proceed directly.
            # Initializes and runs an nmap service version scan, saves results, and handles user exit options.
            elif [ "$option" -eq 4 ]; then 
             ping_scan
                if [ $? -eq 0 ]; then
                read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
                    if [[ "$preview" == "p" || "$preview" == "P" ]]; then
                      temp_file=$(mktemp)
                     {
 
                       echo -e " \e[93m⏳ Initializing Service Version Detection scan, please wait...\[0m" | pv -qL 40
                      nmap -Pn -sV -v "$target"
                     } | tee "$temp_file"
                      save_file  
                      echo -e "\n"
                      exit_or_return
                    else
                    temp_file=$(mktemp)
                    {
                    echo -e " \e[96m⏳ Initializing Service Version Detection, please wait...\e[0m" | pv -qL 40
                      echo -e "\n"
                     nmap -Pn -sV "$target"
                    } | tee "$temp_file"
                    save_file 
                    echo -e "\n"
                    exit_or_return
                     fi
                else
                echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40
                fi
            # Checks if the user selected the Script Scan option.
            # Prompts the user to preview the scan results before execution or proceed directly.
            # Runs an nmap script scan, saves results, and handles user exit options.
            elif [ "$option" -eq 5 ]; then 
             ping_scan
                if [ $? -eq 0 ]; then
                read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
                    if [[ "$preview" == "p" || "$preview" == "P" ]]; then
                      temp_file=$(mktemp)
                     {

                       echo -e " \e[96m⏳ Initializing Default Nmap scripts scan, please wait...\e[0m" | pv -qL 40
                      nmap -Pn -sC -v "$target"
                     } | tee "$temp_file"
                      save_file 
                      echo -e "\n"
                      exit_or_return
                    else
                    temp_file=$(mktemp)
                    {
                    echo -e " \e[96m⏳ Initializing Default Nmap scripts scan, please wait...\e[0m" | pv -qL 40
                      echo -e "\n"
                     nmap -Pn -sC "$target"
                    } | tee "$temp_file"
                    save_file 
                    echo -e "\n"
                    exit_or_return
                     fi
                else
                echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 45
                fi
            # Checks if the user selected the Exit/Return option.
            # Displays a prompt asking the user to choose between returning or exiting.
            # Calls the exit_or_return function to handle user input accordingly.
            elif [ $option -eq 6 ]; then 
            echo -e " \e[93mSelect an option: Return to menu or Exit.\e[0m" | pv -qL 40
            exit_or_return
            # Handles invalid user input by displaying an error message.
            # Prompts the user to try again if an incorrect option is chosen.
            else
            echo -e "\e[91mInvalid option. Please try again.\e[0m" | pv -qL 40
        fi
else
    echo -e "\e[91m❌ Please enter a valid target.\e[0m" | pv -qL 55
    read -p " 🔍Re-Enter the accurate target: " newtarget 
    target=$newtarget
    echo -e "\n"
    echo -e " \e[96m📡The entered target is: $target\e[0m" | pv -qL 55
    echo -e "\n"
fi