username="YOUR USERNAME"
password="YOUR PASSWORD"

rm -rf /home/konrad/Uni/downloads

python main.py --download_dir /home/konrad/Uni/downloads/ml/ubs --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4640032&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/m/ubs --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4566020&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/theo/ubs --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4635382&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/theo/slides --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4641187&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/m/slides --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4565882&client_id=pr02" --username "$username" --password "$password" &
python main.py --download_dir /home/konrad/Uni/downloads/ml/slides --url "https://ovidius.uni-tuebingen.de/ilias3/goto.php?target=fold_4613334&client_id=pr02" --username "$username" --password "$password" &

wait