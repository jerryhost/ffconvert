#!/bin/bash
#  2014-07-28
#  jerryhost@gmail.com
#
#  ffmpeg convert script.
#  User Input version.

read -p "請輸入來源路徑: "  src

read -p "請輸入來源檔案的副檔名(Ex: wmv、mp4、avi):  "  src_file_type

read -p "請輸入目的路徑: "  dest

read -p "請輸入欲轉出的檔案格式(Ex: mp4):  "  dest_file_type

if [ ! -d ${src} ] ; then 
    #echo "Source Path ${src} not exist!!"
    echo "來源路徑 $src 不存在!!"
    exit;
fi

if [ ! -d ${dest} ] ; then
    #echo "Dest Path ${dest} not exist!!"
    echo "目的路徑 $dest 不存在!!"
    exit;
fi

wait_dir=${src}
done_dir=${dest}

src_type=${src_file_type}
dest_type=${dest_file_type}

list=`find ${wait_dir} -type f -iname "*.${src_type}"`

for i in ${list}; do 

  source_file=${i}
  dest_file="${i##*/}"
  dest_file_first=`echo $dest_file | cut -d "." -f 1`

  echo "開始轉換 ${source_file}..."
  sleep 2
  #echo "ffmpeg -y -v quiet -f ${dest_type} -i ${source_file} ${done_dir}/${dest_file_first}.${dest_type}"
  #ffmpeg -y -v info -i ${source_file} -f ${dest_type} ${done_dir}/${dest_file_first}.${dest_type}
  ffmpeg -y -v info -i ${source_file} -f ${dest_type} -b 1500000 ${done_dir}/${dest_file_first}.${dest_type}
  echo "轉檔完成! 已將 ${source_file} 儲存至 ${done_dir}/${dest_file_first}.${dest_type}"
  sleep 2
done


