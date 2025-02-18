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
            echo -e "\n\e[96mChoose file format: markdown (md), text (txt),XML (xml), or log\e[0m"  | pv -qL 35
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
        read -p " 🤔Do you want to scan more? (yes/no): " choice 
        case $choice in
            [Yy]* ) return ;;  # Wapas main menu le jaye
            [Nn]* ) echo -e " \e[91m🚀Exiting...\e[0m"; exit 0 ;;  # Script exit kar de 
            * ) 
              echo " ⚠️Invalid input! Please enter yes or no.\e[0m" | pv -qL 26
            ;; 
        esac
    done
}
sudo -u $(whoami) /usr/games/cowsay -f ghostbusters "Speedy-X Scan" | /usr/games/lolcat
echo -e "\n"
echo -e "\e[96m 🚀Starting the Speedy-X Scan Tool....\e[0m\e[96mDeveloped by M.Izaz Haider....\e[0m" | pv -qL 40
echo -e "\n"

echo -e "\e[92mBehind every hack is a hacker who never quit, even when it seemed impossible. 🔒💪\e[0m" | pv -qL 40
echo -e "\e[91mChecking about Target:\e[0m $target" | pv -qL 40
if ping -c 2 $target &>/dev/null; then
  echo -e "\e[33m Target is valid, proceeding next...\e[0m" | pv -qL 45
  echo -e "\e[94mAll Scan will be automated with the timing template -T4 to make it faster\e[0m"
  echo -e "\n"
  echo -e "1)  \e[97mPing scan Automation (Check if host is online)\e[0m" | pv -qL 40
  echo -e "2)  \e[96mSimple Port Scan Automation (Top 1000 ports)\e[0m" | pv -qL 40
  echo -e "3)  \e[92mOS Detection Automation\e[0m" | pv -qL 40
  echo -e "4)  \e[91mService Version Detection\e[0m" | pv -qL 40
  echo -e "5)  \e[93mDefault nmap -T4 scripts scan Automation \e[0m" | pv -qL 40 
  echo -e "6)  \e[95mAggressive Scan (OS, Services, Traceroute)--\e[0m" | pv -qL 55
  echo -e "7)  \e[96mFull Port Scan (65535 Ports)----\e[0m" | pv -qL 55
  echo -e "8)  \e[97mEvade Firewall (Decoy IPs)----\e[0m" | pv -qL 55
  echo -e "9)  \e[93mTCP SYN Scan (Stealth)----\e[0m" | pv -qL 55
  echo -e "10) \e[95mScan Specific Ports----\e[0m" | pv -qL 55
  echo -e "11) \e[94mCheck UDP Ports----\e[0m" | pv -qL 55
  echo -e "12) \e[97mDetect Firewall Rules----\e[0m"  
  echo -e "13) \e[91mScan for Vulnerabilities (NSE)----\e[0m" | pv -qL 55   
  echo -e "14) \e[92mDetect Live Hosts (No Pings)----\e[0m" | pv -qL 55 
  echo -e "15) \e[96mScan With Custom Timing----\e[0m" | pv -qL 55
  echo -e "16) \e[93mSingle Port scan\e[0m"
  echo -e "17) \e[94mExit\e[0m"
  echo -e "\n"
  read -p "Select an option (1-17): " option 
  # Checks if the user selected Ping Scan  
  # Verifies whether the target is reachable before proceeding  
  echo -e "\e[94mA hacker is a problem solver who just doesn’t give up. 💻🔧\e[0m" | pv -qL 40
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
            nmap -T4  -Pn -v "$target"
            } | tee "$temp_file"
            save_file 
            echo -e "\n" 
            exit_or_return
            else
            temp_file=$(mktemp)
            {
            echo -e " \e[96m⏳ Initializing Simple Port Scan, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn   "$target"
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
    # Initializes and runs an nmap -T4 scan, saves the results, and handles user exit options.
    elif [ "$option" -eq 3 ]; then 
      ping_scan
        if [ $? -eq 0 ]; then
        read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)
            {

            echo -e " \e[96m⏳ Initializing OS Detection, please wait...\e[0m" | pv -qL 40
            nmap -T4 -Pn -O -v "$target"
            } | tee "$temp_file"
            save_file 
            echo -e "\n"
            exit_or_return
            else
            temp_file=$(mktemp)
            {
            echo -e " \e[96m⏳ Initializing OS Detection, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -O "$target"
            } | tee "$temp_file"
            save_file 
            exit_or_return
            fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40
      fi
    # Checks if the user selected the Service Detection Scan option.
    # Prompts the user to preview the scan results before execution or proceed directly.
    # Initializes and runs an nmap -T4 service version scan, saves results, and handles user exit options.
    elif [ "$option" -eq 4 ]; then 
      ping_scan
        if [ $? -eq 0 ]; then
        read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)
            {
      
            echo -e " \e[93m⏳ Initializing Service Version Detection scan, please wait...\[0m" | pv -qL 40
            nmap -T4 -Pn -sV -v "$target"
            } | tee "$temp_file"
            save_file  
            echo -e "\n"
            exit_or_return
            else
            temp_file=$(mktemp)
            {
            echo -e " \e[96m⏳ Initializing Service Version Detection, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -sV "$target"
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
    # Runs an nmap -T4 script scan, saves results, and handles user exit options.
    elif [ "$option" -eq 5 ]; then 
      ping_scan
        if [ $? -eq 0 ]; then
        read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)
            {

            echo -e " \e[96m⏳ Initializing Default nmap -T4 scripts scan, please wait...\e[0m" | pv -qL 40
            nmap -T4 -Pn -sC -v "$target"
            } | tee "$temp_file"
            save_file 
            echo -e "\n"
            exit_or_return
            else
            temp_file=$(mktemp)
            {
            echo -e " \e[96m⏳ Initializing Default nmap -T4 scripts scan, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -sC "$target"
            } | tee "$temp_file"
            save_file 
            echo -e "\n"
            exit_or_return
            fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 45
      fi

    elif [[ "$option" -eq 6 ]]; then
      # Perform a ping scan to check if the target is reachable
      ping_scan
        if [ $? -eq 0 ]; then
        # Ask user if they want to preview the scan before execution
        read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly:  " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            # Create a temporary file to store scan results
            temp_file=$(mktemp)
            {
            echo -e " \e[96m⏳ Initializing Aggressive Scan, please wait...\e[0m" | pv -qL 40
            nmap -T4 -Pn -A -v "$target"  # Perform an aggressive scan with verbose output
            } | tee "$temp_file"
            save_file  # Save scan results
            echo -e "\n"
            exit_or_return  # Prompt user to exit or return to the menu
            else
            # Create a temporary file for scan results
            temp_file=$(mktemp)
            {
            echo " \e[96m⏳ Initializing Aggressive Scan, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -A  "$target"  # Perform an aggressive scan without verbose output
            } | tee "$temp_file"
            save_file  # Save scan results
            echo -e "\n"
            exit_or_return  # Prompt user to exit or return to the menu
            fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  # Notify user if the target is unreachable
      fi

    elif [[ "$option" -eq 7 ]]; then
      ping_scan  # Perform a ping scan to check if the target is reachable
        if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
        read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)  # Create a temporary file to store scan results
            {
            echo -e " \e[96m⏳ Initializing Full Port Scan, please wait...\e[0m" | pv -qL 40
            nmap -T4 -Pn -p- -v "$target"  # Perform an nmap -T4 scan with all ports (-p-) in verbose mode
            } | tee "$temp_file"  # Save output to both terminal and the temp file
            save_file  # Save the scan results
            echo -e "\n"
            exit_or_return  # Provide an option to exit or return to the menu
            else
            temp_file=$(mktemp)  # Create a temporary file for storing results
            {
            echo -e " \e[96m⏳ Initializing Full Port Scan, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -p-  "$target"  # Perform an nmap -T4 scan with all ports (-p-)
            } | tee "$temp_file"  # Save output to both terminal and the temp file
            save_file  # Save the scan results
            echo -e "\n"
            exit_or_return  # Provide an option to exit or return to the menu
            fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  # Error message if the target is not reachable
      fi
    elif [[ "$option" -eq 8 ]]; then
      ping_scan  # Perform a ping scan to check if the target is reachable
      if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
        read -p "🎯Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)  # Create a temporary file to store scan results
            {
            echo -e " \e[96m⏳ Initializing Evade Firewall scan, please wait...\e[0m" | pv -qL 40
            nmap -T4 -Pn -D RND:10 -v "$target"  # Perform an nmap -T4 scan using decoy mode with 10 random IPs
            } | tee "$temp_file"  # Save output to both terminal and the temp file
            save_file  # Save the scan results
            echo -e "\n"
            exit_or_return  # Provide an option to exit or return to the menu
            else
            temp_file=$(mktemp)  # Create a temporary file for storing results
            {
            echo -e " \e[96m⏳ Initializing Evade Firewall scan, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -D RND:10 "$target"  # Perform an nmap -T4 scan using decoy mode with 10 random IPs
            } | tee "$temp_file"  # Save output to both terminal and the temp file
            save_file  # Save the scan results
            echo -e "\n"
            exit_or_return  # Provide an option to exit or return to the menu
            fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  # Error message if the target is not reachable
      fi
    elif [[ "$option" -eq 9 ]]; then
      ping_scan  # Perform a ping scan to check if the target is reachable
        if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
        read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
            if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)  # Create a temporary file to store scan results
            {
            echo-e " \e[96m⏳ Initializing TCP SYN Scan, please wait...\e[0m" | pv -qL 40
            nmap -T4 -Pn -sS -v "$target"  # Perform a stealth (SYN) scan using nmap -T4
            } | tee "$temp_file"  # Save output to both terminal and the temp file
            save_file  # Save the scan results
            echo -e "\n"
            exit_or_return  # Provide an option to exit or return to the menu
            else
            temp_file=$(mktemp)  # Create a temporary file for storing results
            {
            echo " \e[96m⏳ Initializing TCP SYN Scan, please wait...\e[0m" | pv -qL 40
            echo -e "\n"
            nmap -T4 -Pn -sS "$target"  # Perform a stealth (SYN) scan using nmap -T4
            } | tee "$temp_file"  # Save output to both terminal and the temp file
            save_file  # Save the scan results
            echo -e "\n"
            exit_or_return  # Provide an option to exit or return to the menu
            fi
        else
        echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  | pv -qL 40 # Error message if the target is not reachable
        fi
    elif [[ "$option" -eq 10 ]]; then
      ping_scan  # Perform a ping scan to check if the target is reachable
      if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
      read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
          temp_file=$(mktemp)  # Create a temporary file to store scan results
          {
          # Prompt user for port range input
          read -p "Enter start port: " start
          read -p "Enter end port: " end
          echo -e " \e[96m⏳ Initializing Specific Port Range Scan, please wait...\e[0m" | pv -qL 40
          # Perform an nmap -T4 scan on the specified port range
          nmap -T4 -Pn -p "$start"-"$end" -v "$target"
          } | tee "$temp_file"  # Save output to both terminal and the temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          else
          temp_file=$(mktemp)  # Create a temporary file for storing results
          {
          # Prompt user for port range input
          read -p "Enter start port: " start
          read -p "Enter end port: " end
          echo -e " \e[96m⏳ Initializing Specific Port Range , please wait...\e[0m" | pv -qL 40
          # Perform an nmap -T4 scan on the specified port range
          nmap -T4 -Pn -p "$start"-"$end" "$target"
          } | tee "$temp_file"  # Save output to both terminal and the temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  | pv -qL 40 # Error message if the target is not reachable
      fi
    elif [[ "$option" -eq 11 ]]; then
    ping_scan  # Perform a ping scan to check if the target is reachable
      if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
      read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
          temp_file=$(mktemp)  # Create a temporary file for storing results
          {
          echo -e " \e[96m⏳ Initializing UDP Open Ports, please wait...\e[0m" | pv -qL 40
          # Perform a UDP scan with verbose output
          nmap -T4 -Pn -sU -v "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          else
          temp_file=$(mktemp)  # Create a temporary file
          {
          echo -e " \e[96m⏳ Initializing UDP Open Ports, please wait...\e[0m" | pv -qL 40
          echo -e "\n"
          # Perform a UDP scan without verbose output
          nmap -T4 -Pn -sU "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          fi
      else
      echo "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  # Error message if the target is not reachable
      fi

    elif [[ "$option" -eq 12 ]]; then
    ping_scan  # Perform a ping scan to check if the target is reachable
      if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
      read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
          temp_file=$(mktemp)  # Create a temporary file
          {
          echo -e " \e[96m⏳ Initializing Detect Firewall Rules, please wait...\e[0m" | pv -qL 40
          # Perform a firewall bypass scan using nmap -T4 scripts
          nmap -T4 -Pn --script firewall-bypass -v "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          else
          temp_file=$(mktemp)  # Create a temporary file
          {
          echo -e " \e[96m⏳ Initializing Detect Firewall Rules, please wait...\e[0m" | pv -qL 40
          echo -e "\n"
          # Perform a firewall bypass scan without verbose output
          nmap -T4 -Pn --script firewall-bypass "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          fi
      else
      echo "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m"  # Error message if the target is not reachable
      fi
    elif [[ "$option" -eq 13 ]]; then
    ping_scan  # Perform a ping scan to check if the target is reachable
      if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
      read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
          temp_file=$(mktemp)  # Create a temporary file for storing results
          {
          echo -e "\e[96m⏳Initializing vulnerability scan, please wait...\e[0m" | pv -qL 40
          # Perform a vulnerability scan using nmap -T4 scripts
          nmap -T4 -Pn --script vuln -v "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          else
          temp_file=$(mktemp)  # Create a temporary file
          {
          echo -e " \e[96m⏳ Initializing vulnerability scan, please wait...\e[0m" | pv -qL 40
          echo -e "\n"
          # Perform a vulnerability scan without verbose output
          nmap -T4 -Pn --script vuln "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40  # Error message if the target is not reachable
      fi

    elif [[ "$option" -eq 14 ]]; then
    ping_scan  # Perform a ping scan to check if the target is reachable
      if [ $? -eq 0 ]; then  # Check if the previous command executed successfully
      read -p " 🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
          temp_file=$(mktemp)  # Create a temporary file for storing results
          {
          echo -e "\e[96m⏳Initializing standard scan, please wait...\e[0m" | pv -qL 40
          # Perform a standard scan with verbose output
          nmap -T4 -Pn -v "$target"
          } | tee "$temp_file"  # Save output to both terminal and temp file
          save_file  # Save the scan results
          echo -e "\n"
          exit_or_return  # Provide an option to exit or return to the menu
          else
            temp_file=$(mktemp)  # Create a temporary file
              {
                echo -e " \e[96m⏳ Initializing standard scan, please wait...\e[0m" | pv -qL 40
                echo -e "\n"
                # Perform a standard scan without verbose output
                nmap -T4 -Pn "$target"
              } | tee "$temp_file"  # Save output to both terminal and temp file
                save_file  # Save the scan results
                echo -e "\n"
                exit_or_return  # Provide an option to exit or return to the menu
          fi
      else
      echo -e "\e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40  # Error message if the target is not reachable
      fi
    elif [[ "$option" -eq 15 ]]; then
    ping_scan
      if [ $? -eq 0 ]; then
      read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
          temp_file=$(mktemp)
          {
              read -p " 🔍 Enter start port: " start
              read -p " 🕵️ Enter end port: " end
              read -p " 🔄 Enter the Timing template (0-5, where 0=Paranoid,...., 5=Insane): " time
              echo -e " \e[97m✅ Running nmap -T4 scan with timing template $time on ports $start-$end...\e[0m"
              nmap -T4 -Pn -T"$time" -p "$start"-"$end" -v "$target"
          } | tee "$temp_file"
            save_file
            echo -e "\n"
            exit_or_return
            else
          temp_file=$(mktemp)
          {
              read -p " 🔍 Enter start port: " start
              read -p " 🕵️ Enter end port: " end
              read -p " 🔄 Enter the Timing template (0-5, where 0=Paranoid,...., 5=Insane): " time
              echo -e " \e[96m✅ Running nmap -T4 scan with timing template $time on ports $start-$end...\e[0m"
              nmap -T4 -Pn -T"$time" -p "$start"-"$end" "$target"
          } | tee "$temp_file"
            save_file
            echo -e "\n"
            exit_or_return
          fi
      else
        echo -e " \e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40
      fi
    elif [[ $option -eq 16 ]]; then
    ping_scan
      if [ $? -eq 0 ]; then
      read -p "🎯 Enter 'p' to preview the scan before execution, or press Enter to proceed directly: " preview
          if [[ "$preview" == "p" || "$preview" == "P" ]]; then
            temp_file=$(mktemp)
              {
                read -p " 🔍 Enter  port: " port
                echo -e " \e[97m✅ Running nmap -T4 scan  on port $port...\e[0m" | pv -qL 35
                nmap -T4 -Pn  -p "$port" -v "$target"
              } | tee "$temp_file"
              save_file
              echo -e "\n"
              exit_or_return
          else
            temp_file=$(mktemp)
              {
                read -p " 🔍 Enter  port: " port
                echo -e " \e[97m✅ Running nmap -T4 scan  on port $port...\e[0m" | pv -qL 35
                nmap -T4 -Pn  -p "$port" "$target"
              } | tee "$temp_file"
              save_file
              echo -e "\n"
              exit_or_return
          fi
      else
      echo -e " \e[91m ⚠️Target is unreachable or an error occurred.\e[0m" | pv -qL 40
      fi
    elif [[ $option -eq 17 ]]; then 
        # Prompt the user to choose between returning to the menu or exiting the script
        echo -e " \e[94m🔄 Choose what you want to do (Return/Exit)\e[0m" | pv -qL 40
        exit_or_return 
      else
        echo -e "\e[91mInvalid choice\e[0m"
        exit_or_return
      fi
        
else
    echo -e "\e[91m❌ Please enter a valid target.\e[0m" | pv -qL 55
    read -p " 🔍Re-Enter the accurate target: " newtarget 
    target=$newtarget
    echo -e "\n"
    echo -e " \e[96m📡The entered target is: $target\e[0m" | pv -qL 55
    echo -e "\n"
fi