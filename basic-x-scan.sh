 #!/bin/bash

#Funtions will be used 
ping_scan()
{
       echo -e "\e[92m\e[1m⏳First its chechking that Target is up or not\e[0m" | pv -qL 30
       result=$(nmap -sn "$target")
       if [ $? -eq 0 ]; then
              echo -e "\e[93m🎯Target is up. Scan result:\e[0m" | pv -qL 26
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
       echo -e "\e[33mInformation without storage is like a weapon without a wielder. ⚔️💿\e[0m" | pv -qL 30
       echo -e "\e[91mSave it now, or regret it later. Your choice. (yes/no) ⏳🖥️ \e[0m" | pv -qL 30
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
sudo -u $(whoami) /usr/games/cowsay -f bunny "Basic-X Scan" | /usr/games/lolcat
echo -e "\n"
echo -e "\e[91m 🚀Starting the Basic-X scan Tool....\e[0m\e[93mDeveloped by M.Izaz Haider....\e[0m" | pv -qL 40
echo -e "\n"


echo -e "\e[92mHacking: Where patience meets intelligence. 🤓⏳\e[0m" | pv -qL 40
echo -e "\e[91mChecking about Target:\e[0m $target" | pv -qL 40
if ping -c 2 $target &>/dev/null; then
 echo -e "\e[33mTarget is valid, proceeding next...\e[0m" | pv -qL 45
         # Runs a ping scan to check if the target is online.  
        # Offers a preview mode before performing a full scan.  
        # Captures scan results in a temporary file for saving.  
        # Calls functions to save results or return to menu.  
       ping_scan
         read -p " 🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
            sleep 1
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
                  temp_file=$(mktemp)
            {
              echo -e "\e[93mThe best tool a hacker has is the mind. The keyboard is just an extension. 🧠⌨️\e[0m" | pv -qL 40
              echo -e " \e[96m⏳ Initializing Comprehensive Basic Scan Automation scan, please wait...\e[0m" | pv -qL 40
              
              echo -e "\n"
              nmap -Pn -sV -O -sC -v "$target"
            } | tee "$temp_file"
            save_file 
            echo -e "\n"
            exit_or_return
            else
            temp_file=$(mktemp)
            {
                echo -e " \e[96m⏳ Initializing Comprehensive Basic Scan Automation, please wait...\e[0m" | pv -qL 40
                echo -e "\e[96mThe best tool a hacker has is the mind. The keyboard is just an extension. 🧠⌨️\e[0m" | pv -qL 40
                echo -e "\n"
              nmap -Pn -sV -O -sC  "$target"
            } | tee "$temp_file"
            save_file 
            echo -e "\n"
            exit_or_return
            fi
       else
            echo -e "\e[91mError: Unable to reach the target.\e[0m" | pv -qL 40
       fi
else
              echo -e "\e[91m❌ Please enter a valid target.\e[0m" | pv -qL 55
              read -p " 🔍Re-Enter the accurate target: " newtarget 
              target=$newtarget
              echo -e "\n"
              echo -e " \e[96m📡The entered target is: $target\e[0m" | pv -qL 55
              echo -e "\n"
fi