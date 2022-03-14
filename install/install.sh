if [ $# -eq 0 ]
  then
    echo "ERROR!!!! -> Specify conda path name in argv 1. Example: /usr/local/anaconda3/"
    exit
fi
conda_bin_path=$1"/bin/conda"

## Use this to keep conda envs
$conda_bin_path config --add envs_dirs ~/.conda/envs/

## Create environment
$conda_bin_path create -n PROPHET_TUTORIAL  python=3.9
source $1"etc/profile.d/conda.sh"
conda activate PROPHET_TUTORIAL

## Install dependencies
pip install -r requirementsA.txt
pip install -r requirementsB.txt

## Add environment to jupyter kernels
python -m ipykernel install --user --name=PROPHET_TUTORIAL

## Download data to be used
mkdir ../data/
wget https://raw.githubusercontent.com/facebook/prophet/main/examples/example_retail_sales.csv -P ../data/
wget https://raw.githubusercontent.com/facebook/prophet/main/examples/example_wp_log_peyton_manning.csv -P ../data/
wget https://raw.githubusercontent.com/facebook/prophet/main/examples/example_wp_log_R.csv -P ../data/
wget https://raw.githubusercontent.com/facebook/prophet/main/examples/example_air_passengers.csv -P ../data/ 
