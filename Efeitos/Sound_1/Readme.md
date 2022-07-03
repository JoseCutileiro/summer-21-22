# Testing sound elements

### Very ugly page just to test some things about playing sounds on the web 

```js
                    var mySong = document.getElementById("mySong");
                    var icon = document.getElementById("icon");
                    icon.onclick = function() {
                        if (mySong.paused){
                            mySong.play();
                            icon.src = "media/pause.png";
                            icon.src.width = "30%";
                        }else{
                            mySong.pause();
                            icon.src = "media/play.png";
                            icon.src.width = "100%";
                        }
                    }
```

Music by cYsmix: Link here -> https://www.newgrounds.com/audio/listen/1139782
