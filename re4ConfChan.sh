#!/bin/bash

################################################################################
##########getopts -r -g -b##########
################################################################################
while getopts r:g:b: opt
  do
      case ${opt}in
        r)laserR=${OPTARG};;
        g)laserG=${OPTARG};;
        b)laserB=${OPTARG};;
        a)laserA=${OPTARG};;
        p)re4configPath=${OPTARG};;
        \?)exit;;
      esac
  done

################################################################################
##########バックアップファイル作成##########
################################################################################
cp $re4configPath/config.ini $re4configPath/config.ini.org

################################################################################
##########re4config.iniのlaser設定値を検索する
################################################################################
laserRConfig=($(grep "laserR"$re4configPath/config.ini))
laserGConfig=($(grep "laserG"$re4configPath/config.ini))
laserBConfig=($(grep "laserB"$re4configPath/config.ini))

################################################################################
##########re4config.iniを置換する########## sed 's/(置換前の文字)/(置換後の文字)/g'
################################################################################
sed 's/$laserRConfig/$laserR/g' $re4configPath/config.in
sed 's/$laserGConfig/$laserG/g' $re4configPath/config.in
sed 's/$laserRConfig/$laserB/g' $re4configPath/config.in
