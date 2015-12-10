#!/usr/bin/python
# vim: set fileencoding=UTF-8 :

import urllib
from xml.dom import minidom

wurl = 'http://xml.weather.yahoo.com/forecastrss?p=%s'
wser = 'http://xml.weather.yahoo.com/ns/rss/1.0'

def weather_for_zip(zip_code):
    url = wurl % zip_code +'&u=c'
    dom = minidom.parse(urllib.urlopen(url))
    forecasts = []
    for node in dom.getElementsByTagNameNS(wser, 'forecast'):
        forecasts.append({
            'date': node.getAttribute('date'),
            'low': node.getAttribute('low'),
            'high': node.getAttribute('high'),
            'condition': node.getAttribute('text')
        })

    ycondition = dom.getElementsByTagNameNS(wser, 'condition')[0]
    yfeellike = dom.getElementsByTagNameNS(wser, 'wind')[0]
    ywind = dom.getElementsByTagNameNS(wser, 'wind')[0]
    yhumidity = dom.getElementsByTagNameNS(wser, 'atmosphere')[0]
    yastro = dom.getElementsByTagNameNS(wser, 'astronomy')[0]
    return {
        'current_condition': ycondition.getAttribute('text'),
        'current_temp': ycondition.getAttribute('temp'),
        'feel_like': yfeellike.getAttribute('chill'),
        'wind': ywind.getAttribute('speed'),
        'humidity': yhumidity.getAttribute('humidity'),
        'sunrise': yastro.getAttribute('sunrise'),
        'sunset': yastro.getAttribute('sunset'),
        'forecasts': forecasts ,
    }



def main():
    a=weather_for_zip("GMXX4857")
    print '├ Temperature:',a['current_temp'],'°C'
    print '├ Condition  :',a['current_condition']
    print '├ Feels Like :',a['feel_like'], '°C'
    print '├ Wind Speed :',a['wind'], 'km/h'
    print '├ Humidity   :',a['humidity'], '%'
    print '├ Sunrise    :',a['sunrise']
    print '├ Sunset     :',a['sunset']
    print '├ Tomorrow   :',a['forecasts'][2]['date']
    print '├ Highs      :',a['forecasts'][2]['high'],'°C'
    print '├ Lows       :',a['forecasts'][2]['low'],'°C'
    print '├ Sky        :',a['forecasts'][2]['condition']

main()
