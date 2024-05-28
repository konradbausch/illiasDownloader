#input your username and password
username="YOUR USERNAME"
password="YOUR PASSWORD"

#optional, removes the folder before downloading all files again, so you dont get duplicates
rm -rf /home/konrad/Uni/downloads


#replace the download dir and url
#downloads the files in parralel
python main.py --download_dir /home/konrad/Uni/downloads/ml/ubs --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4640032&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/m/ubs --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4566020&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/theo/ubs --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4635382&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/theo/slides --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4641187&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/m/slides --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4565882&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/ml/slides --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4613334&client_id=pr02" --username "$username" --password "$password" &

wait