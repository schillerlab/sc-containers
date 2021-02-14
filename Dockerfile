FROM jupyter/minimal-notebook:latest

COPY start.sh .
COPY environment.yml .

# Create the environment
RUN conda env create -f environment.yml && conda clean -a

# Activate the environment
RUN echo "source activate sc-analysis" >> ~/.bashrc
ENV PATH /home/user/miniconda/envs/sc-analysis/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name sc-analysis > sc-analysis_environment.yml
