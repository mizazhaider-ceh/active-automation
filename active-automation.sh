#!/bin/bash

# ===============================================
# 🌟 Alhamdulillah! All praise is due to Allah, who made me capable of building this tool.  
# 🕊️ Salat wa Salam upon Prophet Muhammad (ﷺ), the greatest guide for humanity.  
# ===============================================

# 🔥 Active Automation - A Powerful Cybersecurity Tool 🔥
# Developed by: Muhammad Izaz Haider  
# 
# 🛠️ This tool is a result of immense effort, problem-solving skills, and deep knowledge in 
# networking, cybersecurity, Nmap, and ethical hacking. It took significant time and dedication 
# to build, and it is one of my finest projects.  
#
# 📌 Purpose & Motivation:
# I developed this tool as a cybersecurity enthusiast to enhance my skills, gain real-world 
# experience, contribute to the community, and support open-source development. This tool 
# is built for ethical hackers who operate within legal and ethical boundaries.  
#
# ⚠️ Ethical Disclaimer:
# This tool strictly follows **active** information gathering techniques and does not 
# involve **passive** reconnaissance, which is often restricted or prohibited when done 
# unethically. **I am not responsible for any illegal use of this tool.**  
# It is designed solely for **ethical hacking, penetration testing, and learning purposes**.  
#
# 💡 Features & Capabilities:
# ✅ Utilizes advanced Nmap scanning techniques for information gathering.
# ✅ Allows users to preview scan results before execution.
# ✅ Provides multiple options to save scan results in different formats.
# ✅ Highly automated, reducing manual effort and improving efficiency.
# ✅ Combines my expertise in **Bash scripting, automation, cybersecurity, information gathering, 
#    networking, and Nmap** to create a top-tier ethical hacking tool.
#
# 🚀 Future Plans:
# This is just the beginning! I plan to develop more cybersecurity projects, contribute to 
# open-source tools, and further advance my skills in ethical hacking and automation.
#
# 🔰 Use this tool responsibly and always adhere to ethical hacking principles! 🔰
# ===============================================

#text effect
DIM="\e[2m"


# Ensures the script runs with root privileges.
# If the script is executed as a non-root user, it prompts for sudo access
# and re-runs itself with elevated permissions.
# This prevents permission-related issues while executing commands that require root access.
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[33m 🔄Switching to root user...\e[0m" | pv -qL 40
    sudo su -c "$0"  # Re-run the script as root
    exit
fi
echo -e "\e[91m 🚀Starting the Active Automation Tool....\e[0m\e[91mDeveloped by M.Izaz Haider....\e[0m" | pv -qL 40
sudo -u $(whoami) /usr/games/cowsay -f eyes "Hacking is not a job; it’s a passion. 🔥💻" | /usr/games/lolcat
echo -e "\n"


# 🎨 Apply yellow color before displaying the banner.
# 🔠 Use 'figlet' with the 'slant' font to create a stylish text banner.
# ⏳ Add a smooth typing effect with 'pv' for a cool visual experience.
# 🎨 Reset text color to default after displaying the banner.
echo -e "\e[96m"
figlet -f slant "   Active  Automation" | pv -qL 80
figlet -f slant "    V.3.1" | pv -qL 80
echo -e "\e[0m"

echo -e "\e[92mHacking is the art of exploring the unknown and finding solutions where others see problems. 🔍💡\e[0m" | pv -qL 40
# Author & Description
echo -e "\e[34m========================================================================\e[0m" # Prints a blue-colored separator line for better readability
echo -e " \e[91mPentester:  \e[0m Muhammad Izaz Haider \e[0m"
echo -e " \e[95mDescription:\e[0m Automates active reconnaissance efficiently" # Prints author/developer name 
echo -e " \e[93mImportance :\e[0m Very Helpful for Pentesters,Bug Hunters, and others" # Importance of script's work
echo -e " \e[96m  Github:   \e[0m github.com/mizazhaider-ceh" # Tells the developer's GitHub profile
echo -e "\e[34m======================================================================--\e[0m\n" # Prints a blue-colored separator line for better readability

echo -e "\e[31m======================================\e[0m"
echo -e "\e[31m⚠️  LEGAL DISCLAIMER ⚠️\e[0m"
echo -e "\e[31m======================================\e[0m"
echo -e "\e[33mThis tool is for authorized testing only.\e[0m"
echo -e "\e[33mUnauthorized use is ILLEGAL and punishable.\e[0m"
echo -e "\e[33mUse at your OWN RISK.\e[0m"
echo -e "\e[31m======================================\e[0m"


#function
new_target()
{
        echo -e "\e[91m❌ Please enter a valid target.\e[0m" | pv -qL 55
        read -p " 🔍Re-Enter the accurate target: " newtarget 
        target=$newtarget
        echo -e "\n"
        echo -e " \e[96m📡The entered target is: $target\e[0m" | pv -qL 55
        echo -e "\n"
}
# User Input for Target
# Prompts the user to enter a target for scanning or automation.
# The input is stored for further processing.
read -p " 🔍Enter the target: " target 

echo -e " \e[93m📡The entered target is:\e[0m $target" | pv -qL 34
export target
echo -e "\e[95m No system is safe when curiosity is at its peak. 🚨🔐\e[0m" | pv -qL 40
# Menu Display
# Provides the user with different scanning options in a structured format.
# Ensures clarity and easy selection of scanning modes.
while true; do
    echo -e "\n"
    echo -e "\e[91m Checking about Target:\e[0m $target" | pv -qL 40
    if ping -c 2 $target &>/dev/null; then
    echo -e "\e[33m Target is valid, proceeding next...\e[0m" | pv -qL 45
    echo -e "\e[95m ✅Select an option below:\e[0m\e[0m" | pv -qL 45
    echo -e "\n"
    echo -e " 1️⃣) \e[96mComprehensive  Automation 🕵️--(Try First) \e[0m" | pv -qL 55
    echo -e " 2️⃣) \e[91mPerform Individual Scans Automation🔍\e[0m" | pv -qL 55
    echo -e " 3️⃣) \e[93mAdvanced & Specialized Scans Automation🎯\e[0m" | pv -qL 55
    echo -e " 4️⃣) \e[95mSpeedy-X Scan🚀---(Recomended if speed matters)\e[0m" | pv -qL 55
    echo -e " 5️⃣) \e[92mModify Target Selection 🔄\e[0m"  | pv -qL 55
    echo -e " 6️⃣) \e[97mExit\e[0m" | pv -qL 45
    echo -e "\n"
    echo -e "\e[93mPatience is the hacker's greatest ally. Time is your tool. ⏳💻\e[0m" | pv -qL 40
# User Selection Prompt
# Asks the user how they want to proceed with the automation.
# Ensures users understand the choices before making a selection.

    echo -e "\e[96m✅ Choose your scanning method\e[0m" | pv -qL 40
    read -p "🕵️ Select an option (1-4) to proceed with scanning: "  choice
    

# Processes user input and executes the selected option.  
# Ensures only valid choices (1-4) are accepted.  

    case $choice in
    1)
        echo -e "\e[91mA true hacker never takes shortcuts; they take the long way and learn the most. 🛣️💻\e[0m" | pv -qL 40
        chmod +x basic-x-scan.sh
        echo -e "\n"
        echo -e "Executing... hope this works! 🤞💀" | pv -qL 30
        echo -e "\n"
        ./basic-x-scan.sh
    ;;
    2)
        echo -e "\e[94mHacking is not just a skill, it’s a mindset. 🔄💻\e[0m" | pv -qL 40
        chmod +x individual-x-scan.sh
        echo -e "\n"
        echo -e "Hacking the matrix... please wait. 🟢💾" | pv -qL 30
        echo -e "\n"
        ./individual-x-scan.sh
    ;;
    3)
        echo -e "\e[93mGreat hackers are like great detectives—always solving puzzles. 🕵️‍♂️💻\e[0m" | pv -qL 40
        chmod +x advance-x-scan.sh
        echo -e "\n"
        echo -e "Please wait... or don’t. The code runs when it wants. 🐢💻" | pv -qL 30
        echo -e "\n"
        ./advance-x-scan.sh
    ;; 
    4)
        echo -e "\e[94mThe best hackers are often the quietest; they work in silence, let their actions speak. 🤫💻\e[0m" | pv -qL 40
        echo -e "\n"
        chmod +x speedy-x-scan.sh
        echo -e "Finding Results faster than your excuses! 😂🔓...Wait its going to be start.." | pv -qL 30
        echo -e "\n"
        ./speedy-x-scan.sh
    ;;
    5)
        echo -e "\e[6 great hacking skills, comes great responsibility. 🦸‍♂️🔐\e[0m" | pv -qL 40
        echo -e " \e[93m🔄 Change the Target\e[0m" | pv -qL 40
        # Prompting user to enter a new target (IP or domain)
        read -p " 🕵️ Enter new target (IP/domain name, e.g., example.com): " newtarget
        target=$newtarget
        # Confirming the new target selection
        echo -e " \e[96m✅ Your new target is set to: $target\e[0m" | pv -qL 40
    ;;
    6)
        echo -e "\e[91mGood hackers have no limits. They are not confined to boundaries. 🚧💡\e[0m" | pv -qL 40
        exit 0
    ;;
    *)
        
        # Display an error message for an invalid choice
        echo -e " \e[91m⚠️ Invalid choice!\e[0m" | pv -qL 40
    ;;
    esac
    else
       new_target
    fi
done

