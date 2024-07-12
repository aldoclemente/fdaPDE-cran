FROM aldoclemente/fdapde-docker:latest

RUN export RGL_USE_NULL=TRUE
RUN export DISPLAY=99.0

RUN cd 
RUN mkdir .R; touch .R/Makevars
RUN echo "CPPFLAGS+=-I'/usr/include/freetype2/'" > .R/Makevars
RUN echo "CPPFLAGS+=-I'/usr/include/harfbuzz/'" >> .R/Makevars
RUN echo "CPPFLAGS+=-I'/usr/include/fribidi/'" >> .R/Makevars

RUN touch setup.R
RUN echo "install.packages(c('pkgbuild','rgl', 'Matrix', 'plot3D', 'RcppEigen', 'Rcpp', 'MASS', 'testthat', 'devtools','rcmdcheck','plotly','plot3Drgl'), repos='https://cran.stat.unipd.it/', dependencies=TRUE)" > setup.R
RUN Rscript setup.R

RUN echo "install.packages('fdaPDE', repos='https://cran.stat.unipd.it/', dependencies=TRUE)" > setup.R
RUN Rscript setup.R

RUN rm setup.R

