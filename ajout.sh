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
  echo " choix : "
  echo "r->regex;f->fin;p->phrase;e->executer;s->sauvegarder"
  echo "ch->changement fichier dest;l->lecture dest"
  echo "--------------------------------------------------"
  read -e -p "choix > " choix
  if [ "$choix" == "f" ];then exit 0;fi
  if [ "$choix" == "r" ];then
    read -p "veuillez entrer une regex : " -i "$regex" -e regex 
    echo "nouvelle regex : $regex"
  fi
  if [ "$choix" == "p" ];then
    read -p "veuillez entrer une phrase : " -i "$phrase" -e phrase
    echo "nouvelle phrase : $phrase"
  fi
  if [ "$choix" == "e" ];then
    echo "execution $regex sur $phrase"
    java Regme "$phrase" "$regex"
  fi
  if [ "$choix" == "s" ];then 
    echo "sauvegarde vers le fichier \"$dest\""
    read -e -p "commentaire : " commentaire
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
    read -p "changement de dest $dest vers : " -i $dest -e dest
    echo "nouvelle destination : $dest"
  fi
done
