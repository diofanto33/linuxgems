#cheat_sheet.org.sh
# The contents of this file are released under the GNU General Public License.
# Feel free to reuse the contents of this work, as long as the resultant works
# give proper attribution and are made publicly available under the 
# GNU General Public License.
# Best viewed in emacs org-mode.
# Alternately, one can keep this cheat sheet handy by adding the 
# following line to ~/.bashrc:
#
# alias cheatsheet="less ~/path_to_cheat_sheet.org.sh" 

* Referencias:
** Básicos:
*** Obteniendo ayuda:

# Las páginas de manual (manpages) se dividen en secciones para organizar
# y clasificar la información relacionada. Las secciones más comunes son:

# Sección 1: Contiene páginas de manual para comandos y programas ejecutables del sistema
man command

# Sección 2: Está dedicada a las llamadas al sistema (system calls) y funciones del kernel.
man 2 open 

# La sección 3: de las páginas de manual en Linux contiene información sobre las funciones
# de la biblioteca estándar de C
man 3 printf

# Obtener ayuda acerca del comando 'command' (probablemente la misma que 'man command'):
command -h

# En caso de que te olvidés el nombre de un comando, podés imprimir posible comandos relacionados a la palabra 'word':
apropos word

# Mostrar el índice de las páginas de ayuda:
info


*** Utilidades de líneas de comandos:
**** Operaciones básicas sobre archivos y directorios:

# Imprimir el directorio de trabajo actual:
pwd

# Listar los archivos en el directorio actual:
ls

# Listar información extra de todos los archivos, incluyendo los ocultos:
ls -a

# Listar archivos de manera recursiva en cada subdirectorio:
ls -R

# Listar archivos ordenados por su tiempo de modificación (más reciente primero):
ls -lt

# Mover/renombrar el archivo o directorio 'source' al destino 'destination':
mv source destination

# Suprimir el archivo 'target' por siempre (con cuidado!). Usar rm -r si 'target' es un directorio.
rm target

# Copiar un archivo o directorio desde 'source' a 'destination':
cp source destination

# Montar el sistema de archivos 'device_name':
mount /dev/device_name /media/device_name

# Desmontar el sistema de archivos 'device_name':
umount /media/device_name

# Clonar sistemas de archivos y hacer otras operaciones de bajo nivel sobre archivos. Con cuidado, puede ser destructivo:
dd

# Trabajar con particiones de discos:
parted

# Herramienta de creaciones de sistema de archivos:
mkfs


**** Administración del sistema:

# Ejecutar el comando 'command' como administrador (puede ser inseguro/destructivo. Usar sólo para administración de sistema):
sudo command

# Convertirse en usuario administrador:
sudo -s

# Salir de usuario administrador:
exit

# ¿Te olvidaste escribir sudo delante de un comando y ya presionaste enter? Repite el último comando usando sudo:
sudo !!


***** Instalar programas desde un .tgz (también denominado tarball):

# Primero, descomprimí el tarball (ver la sección de tar abajo)
# Luego, cambiar al directorio que se descomprimió:
cd software_directory

# Siempre hay que leer el README primero en caso de que haya, ya que puede haber modificaciones al procedimiento que se da abajo:
cat README

# Revisa de manera automágica la configuración adecuada y genera un archivo MAKE en el directorio:
./configure

# Compila el programa. Puede que necesite sudo:
make

# Mueve o copia los archivos al lugar adecuado. También puede que necesite sudo:
make install

# Limpia todos los archivos generados en la compilación y deja todo limipo. Puede ser usado si la compilación falla o bien para sacar la basura.
make clean


***** Ubuntu/Debian Software repositories:

# Check distro repositories for software updates:
sudo apt-get update

# Download and install updates (update first):
sudo apt-get upgrade

# Search for package in the repositories:
apt-cache search keyword

# Get more detail on one specific package:
apt-cache show package_name

# Download and install a package:
sudo apt-get install package_name

# View the output of a command in a more convenient format:
command | less

***** Arch Linux Software repositories:

# Check distro repositories for software updates: 
sudo pacman -Syu 

# To search for already installed packages:
pacman -Qs keyword

# To search for package file names in remote packages:
pacman -Fs keyword

# To display extensive information about a given package:
pacman -Si package_name

# To display extensive information about a given package, including dependencies: 
pacman -Sii package_name 

# For locally installed packages:
pacman -Qi package_name

# Search for package in the repositories:
pacman -Ss keyword 

# Download and install a package:
pacman -S package_name 

# To remove a package and its dependencies which are not required by any other installed package:
pacman -Rs package_name 

# To remove a package and its dependencies which are required by other installed packages: 
pacman -Rns package_name 

# To remove a package and its dependencies which are required by other installed packages and are not required by any other installed package: 
pacman -Rcns package_name 

# To remove a package and its dependencies which are not required by any other installed package and are not required by any other installed package: 
pacman -Rcs package_name 

# Install a 'local' package that is not from a remote repository (e.g. the package is from the AUR): 
pacman -U /path/to/package/package_name-version.pkg.tar.zst

***** Random:

# top 10 commands used by the user:
history | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 10
 
# Show the current date and time: 
tty-clock -c 

# Show the battery status and other system information: 
gotop -l battery 

**** Trabajando con archivos:

# Imprimir el contenido del archivo 'file' en la terminal:
cat file

# Buscar archivos cuyo nombres coincidan con 'filename':
locate filename

# Ver la versión o la ubicación del programa 'appname':
which appname

# Buscar la cadena 'phrase' dentro del contenido de 'filename':
grep phrase filename

# Buscar la cadena 'phrase' dentro de la salida del comando 'command':
command | grep phrase


**** Trabajando con procesos:

# Listar todos los procesos corriendo:
ps -e

# Monitor sistema estándar mostrando información más extensa de todos los procesos y recursos de sistema:
top

# Similar a top, pero con una mejor interfaz:
htop

# Detener el proceso 'process_name' de usar todos los recursos del sistema (cambiar prioridad):
renice process_name

# Matar el proceso 'process_name' (usar como último recurso, intentar 'renice' antes):
pkill process_name

# Lanzar el comando 'command' en modo background (proceso de fondo):
command &

# Lanzar el proceso de 'command' en background y manterlo corriendo luego de cerrar la sesión:
nohup command &


**** Compression and Encryption:

# Compression and encryption are often used together. Here are some examples of how to use them. 

# Compress a file or directory into a zip archive:
zip archive_name.zip directory_or_file_to_compress 

# Unzip a zip file: 
unzip archive_name.zip 

# Make a simple compressed backup of files or directories:
tar -cvzf backup_output.tgz target_files_or_directories

# Abrir un archivo comprimido con extensión .tgz o .tar.gz:
tar -xvf target.tgz

# Encrypt a file:
gpg -o outputfilename.gpg -c target_file

# Decrypt a file:
gpg -o outputfilename -d target.gpg

# Zip and encrypt a directory simultaneously:
gpg-zip -o encrypted_filename.tgz.gpg -c -s file_to_be_encrypted


*** The Bash shell:
**** File Name expansions:

# Directorio home del usuario actual:
~/

# Directorio actual:
./

# Directorio padre:
../

# O incluso (dos directorios padres abajo):
../../

# All files in target directory. (Be very careful.):
/*


**** Output Redirects:

# Redirigir la salida de 'command_1' a la entrada de 'command_2' a través de un pipe |:
command_1 | command_2

# Incluso con más de dos comandos:
command_1 | command_2 | command_3

# Redirigir la salida de 'command' al archivo 'file':
command > file

# Or:
file > file

# Or even, to redirect in a different direction:
file < file

# Añadir la salida de 'file_or_command' al contenido de 'file', en vez de sobreescribirlo:
file_or_command >> file

# Works like |, but it writes output to both target and terminal:
tee target

# Redirect standard output and error to /dev/null, where it is deleted.
command > /dev/null 2>&1


**** Controlling Execution:

# Esperar a que 'command_1' termine para ejecutar 'command_2':
command_1 ; command_2

# O incluso:
command_1 ; command_2 ; command_3

# && actúa como ; pero sólo ejecuta 'command_2' si 'command_1' indica que terminó sin error retornando 0:
command_1 && command_2

# || actúa como && pero sólo ejecuta 'command_2' si 'command_1' indica un error retornando 1:
command_1 || command_2


**** Bash Wildcards:

# Zero or more characters:
*

# Coincide con cualquier cadena que comience con 'phrase':
phrase*

# Matches any incidences of "phrase" with any trailing or leading chars:
*phrase*

# Coincide con cualquier carácter:
?

# Coincide con algunos de los caracteres listado dentro de los corchetes:
[chars]

# Coincide con cualquier carácter en a, b, c, ..., x, y, z:
[a-z]


** Advanced:
*** Command Line Utilities, Continued:
**** Networking:

# Configure network interfaces:
ifconfig

# Configure wireless network interfaces:
iwconfig

# Connect to a remote server.
ssh username@ip_address

# Forward X from target to current machine (Get a remote desktop. Somewhat obscure, but very useful):
ssh -X username@ip_address

# Copy files/directory over the network from one machine to another recursively:
scp -r source_filename:username@ip_address target_filename:target_username@target_ip_address

# Copy only changes between files or directories (super efficient way to sync directories, works either locally or with remote servers using username@ip_address:optionalport, just like ssh):
rsync source target

# Check to see if target is online and responding
ping ip_address

# View network route to target:
traceroute6 ip_address

# Network Monitor
netstat

# View firewall rules
iptables -L

# Scan this machine(localhost) to check for open ports:
nmap localhost


***** wget:

# Descargar un archivo por http:
wget http://example.com/folder/file

# Completar un archivo descargado parcialmente:
wget -c http://example.com/folder/file

# start download in background:
wget -b wget -c http://example.com/folder/file

# download a file from ftp server:
wget --ftp-user=USER --ftp-password=PASS ftp://example.com/folder/file


***** netcat:

# Listen for input from network on recieving_port, dump it to a file (insecure, but handy):
netcat -l recieving_port > file_copied

# Pipe the output of a command to a target ip and port over the network:
command | netcat -w number_of_seconds_before_timeout target_ip target_port

# Use tar to compress and output a file as a stream, pipe it to a target ip and port over the network:
sudo tar -czf - filename | netcat -w number_of_seconds_before_timeout target_ip target_port


**** Users and Groups:
# Change owner of a file or directory:
chown user_name:group_name directory_name

# Change privileges over file or directory (see man page for details.)
chmod

# Create a new user:
adduser

# Change user privileges (be very careful with this one):
usermod

# Delete user
deluser

# Print groups:
groups

# Create a new group:
groupadd

# Change group privileges:
groupmod

# Delete group:
delgroup

# Temporarily become a different user:
su username

# Print usernames of logged in users:
users

# Write one line to another user from your terminal:
talk

# Interactive talk program to talk to other users from terminal (must be installed from repositories.):
ytalk


**** Trabajando con archivos, continuación:

# Ver que procesos están usando que archivos:
lsof

# Ver las diferencias entre el contenido de dos archivos:
diff file_1 file_2

# Imprimir las primeras 'number_of_lines' líneas del archivo 'file':
head -n number_of_lines file

# Como head, pero imprime las últimas 'number_of_line' líneas del archivo 'file':
tail -n number_of_lines file

# Calcular el MD5 del archivo 'file':
md5sum file

# Calcula el MD5 de cada archivo en un directorio (hay que instalarlo desde los repositorios):
md5deep directory

# Calcula el SHA1 del archivo 'file' (mejor algoritmo que MD5):
sha1sum file

# Similar a md5sdeep, pero utilizando SHA1:
sha1deep

# Call command every few number_of_seconds, and highlight difference in output:
watch -d -n number_of_seconds command

# Ejecutar un comando e imprimir cuanto tiempo le tomó:
time command

# View files in directory from largest to smallest:
du -a directory | sort -n -r | less

# remove spaces from filenames in current directory:
rename -n 's/[\s]/''/g' *

# change capitals to lowercase in filenames in current directory:
rename 'y/A-Z/a-z/' *


***** Environment and Hardware:
# print motherboard information
dmidecode

# Print full date and time:
date

# Print the hostname of this machine:
echo $HOSTNAME

# Print information about current linux distro:
lsb_release -a

# Or even:
more /etc/issue

# Print linux kernel version:
uname -a

# Print information about kernel modules:
lsmod

# Configure kernel modules (never do this ;p ):
modprobe

# View Installed packages:
dpkg --get-selections

# Print environment variables:
printenv 

# List hardware connected via PCI ports:
lspci

# List hardware connected via USB ports:
lsusb

# Print hardware info stored in BIOS:
sudo dmidecode

# Dump captured data off of wireless card:
dumpcap

# Dump info about keyboard drivers:
dumpkeys


***** Ubuntu System Administration, Advanced (Continued):

# Add a Personal Package Archive from Ubuntu Launchpad:
add-apt-repository

# Install a .deb file from command line:
sudo dpkg -i package.deb


**** Python:

# Update pip (Python package manager):
pip install -U pip

# search pip repos for a library:
pip search library_name

# create a virtual python environment to allow install of many different versions of the same Python modules:
virtualenv dirname --no-site-packages

# connect to a virtual python environment
source dirname/bin/activate

# disconnect from a virtual python environment:
deactivate

# install package into virtual python environment from outside:
pip install packagename==version_number -E dirname

# export python virtual environment into a shareable format:
pip freeze -E dirname > requirements.txt

# import python virtual environment from a requirements.txt file:
pip install -E dirname -r requirements.txt

# manpages for python modules:
pydoc module_name

**** git (all commands must be performed in the same directory as .git folder):

# Start a new git project:
git init

git config user.name "user_name"

git config user.email "email"

# Make a copy of a git (target can be specified either locally or remotely, via any number of protocols):
git clone target

# Commit changes to a git:
git commit -m "message"

# Get info on current repository:
git status

# Show change log for current repository:
git log

# Update git directory from another repository:
git pull [target]

# Push branch to other repository:
git push [target]

# Create a new branch:
git branch [branchname]

# Switch to target branch:
git checkout [branchname]

# Delete a branch:
git branch -d [branchname]

# Merge two branches:
git merge [branchname] [branchname]

# Show all branches of a project:
git branch

# Merge file from source branch into target branch:
git checkout [target_branch] -- [filename]

*** Virtualization:

#clone a virtual machine (this works, it's been tested):
vboxmanage clonehd virtual_machine_name.vdi --format VDI ~/target_virtual_machine_name.vdi

#mount a shared virtual folder:
#you need to make sure you have the right kernel modules. You can do this with modprobe, but this package works instead in a ubuntu-specific way.

sudo apt-get install virtualbox-ose-guest-utils

sudo mount -t vboxsf name_of_shared_folder_specified_in_Virtualbox path_of_mountpoint


*** mysql:

# Get help:
help

# Show databases:
show databases;

# Choose a database to use:
use database_name_here;

# Show database schema:
show tables;

# Delete database:
DROP DATABASE databasename;

# New database:
CREATE DATABASE databasename;

# Create a new user:
CREATE USER username@localhost IDENTIFIED BY 'password';

# Show users:
select * from mysql.user;

# Delete a user:
delete from mysql.user WHERE User='user_name';

# Give user access to all tables (make them root). the "%" means that they can sign in remotely, from any machine, not just localhost.:
grant all privileges on *.* to someusr@"%" identified by 'password';

# give certain privileges to a user on a certain database:
grant select,insert,update,delete,create,drop on somedb.* to someusr@"%" identified by 'password';

# Tell mysql to use new user priv policies:
flush privileges;

# change user password:
use mysql;

update user set password='password'('newpassword') where User='user_name';

# mysql command line args:
# export text file with commands to rebuild all mysql tables:
mysqldump databasename > dumpfilename.txt

# restore from a dump:
mysql -u username -p < dumpfilename.txt

# dump entire database:
mysqldump -u username -p --opt databasename > dumpfile.sql

# restore from entire database dump:
mysql -u username -p --database=databasename < dumpfile.sql
