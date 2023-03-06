# AIM: Make video from images
# METHOD: mages are fetched from a video
# USES: You can cut a video short, skip the frames and change frame rate with this code
# REQUIREMENT: ffmpeg software (installation guide --->>>>> Microscale Robotics Laboratory notebook: Software installation: ffmpeg), julia packages mentioned in using ----
# VARIABLES:   path, filename, fname, n
# Date: 3 March 2023

    using Images, VideoIO, FileIO, ImageView, StackViews


    path="C:\\Users\\j.sharma\\OneDrive - Scuola Superiore Sant'Anna\\experiments\\active particles 3um\\test\\"
    
    filename="VID00995"                                          #input file name
    
    pathv=path*filename*".AVI"
    fname = path*"video.mp4"                                          # output file name
    io   = VideoIO.open(pathv);
    v1  = VideoIO.openvideo(io);
    vid = VideoIO.load(pathv);
    vid = StackView(vid);
    #imshow(vid)
    totframes=VideoIO.counttotalframes(v1)                        # number of frames in video
    #size(vid)
    time= VideoIO.get_duration(pathv::String)                     # total video duration 
    
    n= 10                                                         # number of frames skipped
    h, w, nframes = size(vid)
    fps=25
    options=``
    overwrite=true
    ow = overwrite ? `-y` : `-n`
        open(`ffmpeg
    -loglevel warning
    $ow
    -f rawvideo
    -pix_fmt rgb24
    -s:v $(h)x$(w)
    -r $fps
    -i pipe:0
    $options
    -vf "transpose=0"
    -pix_fmt yuv420p
    $fname`, "w") do out
    for i = 1:n:totframes
    write(out, convert.(RGB{N0f8}, clamp01.(vid[:,:,i])))
    end
    end
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    