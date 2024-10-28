# opus_muxer
Mux OPUS frame to WebM. OPUS is length(4B, small end)+data style.

## Build
Depend on many third party lib, please see build.sh :)
```bash
./build.sh
```

## Usage
```bash
./opus_muxer -c <channel> -i <input> -o <output>
# e.g.
./opus_muxer -c 2 -i test/stereo.opus -o test/stereo.webm
```
