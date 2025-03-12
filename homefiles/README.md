- Edit your .bashrc with two useful aliases

	![alt text](https://github.com/user-attachments/assets/aee94dd0-42ab-41c9-a0b4-8d1d0ac6f938)


- Verify your added aliases / bash additions work

	![alt text](https://github.com/user-attachments/assets/0834f1ac-0d8c-405a-8d50-9a58907a063f)

	![alt text](https://github.com/user-attachments/assets/4550d2f3-585e-4eb8-9bcd-04ae30fb29ad) 


- Copy your .bashrc file to your dotfiles repository in homefiles

	cp .bashrc ~/dotfiles/homefiles


- Write a script that [if needed] checks if being run as sudo, installs additional packages needed for your .bashrc file

	I used ChatGPT to write my script. The prompt fed to it was "Create a bash script that [if needed] checks if being run as sudo, installs additional packages needed for your .bashrc file. symbolically links the .bashrc file in your dotfiles repository to your user's home directory and reminds the user to reload their environment (with source or by logging out and back on"

	![alt text](https://github.com/user-attachments/assets/a707fd3d-8f83-4f7b-88e3-50aed964569e)

