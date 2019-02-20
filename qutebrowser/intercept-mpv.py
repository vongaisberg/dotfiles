from qutebrowser.api import interceptor
from urllib.parse import parse_qs
import os
import subprocess
activated = False
def filter_yt(info: interceptor.Request):
        """Block the given request if necessary."""
        url = info.request_url
        print("Received request "+url.scheme()+"://"+url.host()+"  "+url.query())
        if (url.host() == 'start.mpv'):
            activated = True
            info.block()
            host = url.host()
            query = url.query()
            q = parse_qs(query)
#           os.system("terminal -e 'bash -c \""+q.url+" "+q.x+" "+q.y+" \"'")

            print('Intecepted MPV-start')
            print(q)
#            os.system("mpv https://www.youtube.com/watch?v=lSjhdfRYNsA")
            subprocess.Popen(["/home/max/git/dotfiles/qutebrowser/start-mpv.sh", q['url'][0], str(int(q['right'][0])-int(q['left'][0])), str(int(q['bottom'][0])-int(q['top'][0])), q['left'][0], q['top'][0]])
        if (url.host() == 'move.mpv'):
            info.block()
            host = url.host()
            query = url.query()
            q = parse_qs(query)
#           os.system("terminal -e 'bash -c \""+q.url+" "+q.x+" "+q.y+" \"'")

            print('Intecepted MPV-move')
            print(q)
#            os.system("mpv https://www.youtube.com/watch?v=lSjhdfRYNsA")
            subprocess.Popen(["/home/max/git/dotfiles/qutebrowser/move-mpv.sh", q['url'][0], str(int(q['right'][0])-int(q['left'][0])), str(int(q['bottom'][0])-int(q['top'][0])), q['left'][0], q['top'][0]])
        if (url.host() == 'stop.mpv'):
            activated = False
            info.block()
            host = url.host()
            query = url.query()
            q = parse_qs(query)
#           os.system("terminal -e 'bash -c \""+q.url+" "+q.x+" "+q.y+" \"'")

            print('Intecepted MPV-start')
            print(q)
#            os.system("mpv https://www.youtube.com/watch?v=lSjhdfRYNsA")
            subprocess.Popen(["/home/max/git/dotfiles/qutebrowser/stop-mpv.sh", q['url'][0], str(int(q['right'][0])-int(q['left'][0])), str(int(q['bottom'][0])-int(q['top'][0])), q['left'][0], q['top'][0]])
        if ('googlevideo.com' in url.host() and activated):
            info.block()
print("Registering interceptor")
interceptor.register(filter_yt)

