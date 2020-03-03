#!/bin/bash
#Auther: Pravin
#Purpose: Automated script to create a Postgres Database pipeline?

#read -p "Please Enter the Role Name:" ROLE_NAME
#/usr/bin/psql --username postgres 
sudo su - postgres
echo " "
        if [ "$( psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='$ROLE_NAME'" )" = '1' ]
        then
                echo "Role already Exists, Please Provide Valid Role Name "
                echo " "
        exit 1;
        fi
        if [ "$ROLE_NAME" = "" ]
        then
                echo "ROLE Name is Empty, Please Provide Valid Name"
        exit 1;
        fi
#read -p  "Please Enter the Database Name:" DATABASE_NAME
echo " "
        if [ "$( psql -tAc "SELECT 1 FROM pg_database WHERE datname='$DATABASE_NAME'" )" = '1' ]
        then
                echo "Database already Exists, Please Provide Valid Database Name:"
                echo " "
		#/usr/bin/psql --username=postgres -l $DATABASE_NAME
        exit 1;
        fi
        if [ "$DATABASE_NAME" = "" ]
        then
                echo "DataBase Name is Empty, Please Provide Valid Database Name"
        exit 1;
        fi
#read -p "Please Enter the Owner:" OWNER_NAME
echo " "
        if [ "$OWNER_NAME" = "" ]
        then
        echo "Owner Name is Empty, Please Provide Valid Owner Name"
        exit 1;
        fi

#read -p "Please Enter the Password:" PASSWORD
echo " "
        if [ "$PASSWORD" = "" ]
        then
        echo "Password is Empty, Please Provide Valid Password"
        exit 1;
        fi

echo -e "Choosen Specs \nRole Name: $ROLE_NAME \nDatabase Name: $DATABASE_NAME \nOwner Name: $OWNER_NAME \nPassword: $PASSWORD"
read -p "Are You Sure, All Given Data is Correct [Y/N]:" DECISION

case $DECISION in
Y|y|yes|Yes|YES)
continue
;;
N|n|NO|no|No)
        echo "Please try Again"
        exit 1;
        ;;
esac
        /usr/bin/psql<<EOF
#        CREATE ROLE "$ROLE_NAME" WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT NOREPLICATION CONNECTION LIMIT -1;
#        CREATE DATABASE "$DATABASE_NAME" WITH OWNER = $OWNER_NAME ENCODING = 'UTF8' CONNECTION LIMIT = -1;
#        GRANT ALL ON DATABASE "$DATABASE_NAME" TO "$DATABASE_NAME";
#        ALTER ROLE "$ROLE_NAME" PASSWORD '$PASSWORD';
        \l
EOF

