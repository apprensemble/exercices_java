#!/usr/bin/env bash
set -o vi
choix=1;
while [ "$choix" ];
do
  if [ -z "$dest" ];then
    dest=reponse
  fi
  echo "--------------------------------------------------"
  echo "infos : regex->$regex ;phrase->$phrase;dest->$dest"
  echo "--------------------------------------------------"

  echo "--------------------------------------------------"
  echo "r->regex;f->fin;p->phrase;e->executer;s->sauvegarder"
  echo "ch->changement fichier dest;l->lecture dest"
  echo "--------------------------------------------------"
  echo " "
  read -e choix
  if [ "$choix" == "f" ];then exit 0;fi
  if [ "$choix" == "r" ];then
    echo "veuillez entrer une regex : "
    read -p "$regex" -e regex 
    echo "regex : $regex"
  fi
  if [ "$choix" == "p" ];then
    echo "veuillez entrer une phrase"
    read -p "$phrase" -e phrase
    echo "phrase : $phrase"
  fi
  if [ "$choix" == "e" ];then
    echo "execution $regex sur $phrase"
    java Regme "$phrase" "$regex"
  fi
  if [ "$choix" == "s" ];then 
    echo "sauvegarde vers le fichier \"$dest\""
    echo "commentaire : "
    read -e commentaire
    echo "echo \" 
    ---------------------------------------
    $commentaire
    ---------------------------------------\"">>$dest
    echo "java Regme \"$phrase\" \"$regex\"">>$dest
  fi
  if [ "$choix" == "l" ];then
    less $dest
  fi
  if [ "$choix" == "ch" ];then
    echo "changement de dest $dest vers : "
    read -p $dest -e dest
    echo "nouvelle destination : $dest"
  fi
done
