#!/usr/bin/env bash
set -o vi
choix=1;
function info {
  echo "--------------------------------------------------"
  echo "infos : regex->$regex ;phrase->$phrase;dest->$dest"
  echo "--------------------------------------------------"
}
function menu {
  echo "--------------------------------------------------"
  echo " choix : "
  echo "i->infos;m->menu"
  echo "r->regex;f->fin;p->phrase;e->executer"
  echo "ch->ch fic sauv;l->lecture fic sauv;s->sauvegarder"
  echo "--------------------------------------------------"
}
menu
while [ "$choix" ];
do
  if [ -z "$dest" ];then
    dest=reponse
    info
  fi
  read -e -p "choix > " choix
  if [ "$choix" == "i" ];then
    info
  fi
  if [ "$choix" == "m" ];then
    menu
  fi
  if [ "$choix" == "f" ];then exit 0;fi
  if [ "$choix" == "r" ];then
    read -r -p "veuillez entrer une regex : " -i "$regex" -e regex
    echo "nouvelle regex : $regex"
  fi
  if [ "$choix" == "p" ];then
    read -r -p "veuillez entrer une phrase : " -i "$phrase" -e phrase
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
