FROM cm2network/steamcmd
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/l4d2-dedicated \
    +app_update 222860 +quit
# Copy apache vhost file to proxy php requests to php-fpm container
COPY server.cfg /home/steam/l4d2-dedicated/left4dead2/cfg/

WORKDIR /home/steam/l4d2-dedicated/
CMD ["./srcds_run", "-console", "+sv_lan", "0", "-game", "left4dead2", "+ip", "0.0.0.0", "-port", "27016", "+map", "c1m1_hotel", "+maxplayers", "32"]
#RUN ./srcds_run -console +sv_lan 0 -game left4dead2 +ip 0.0.0.0 -port 27016 +map c1m1_hotel +maxplayers 32

EXPOSE 27016

#RUN mkdir /usr/local/apache2/conf/sites-available/
#COPY *.conf /usr/local/apache2/conf/sites-available/
#RUN echo "Include /usr/local/apache2/conf/sites-available/*.conf" \
#    >> /usr/local/apache2/conf/httpd.conf
