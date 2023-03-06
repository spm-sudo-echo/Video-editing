# AIM:           Split a video file into images
# METHOD:        Extract frames and make a stack
# USES:          Print images of selected frames in a video
# REQUIREMENTS:  Julia packages listed in using ..... (line 8)
# VARIABLES:     path, filename, n 
# Date:          3 March 2023

using Images, VideoIO, FileIO, ImageView,StackViews

path="C:\\Users\\j.sharma\\OneDrive - Scuola Superiore Sant'Anna\\experiments\\active particles 3um\\test\\"  # destination folder path

filename="VID00995"                                                                                           # destination file name

pathv=path*filename*".AVI"

io   = VideoIO.open(pathv);
v1  = VideoIO.openvideo(io);
vid = VideoIO.load(pathv);
vid = StackView(vid);
#imshow(vid)
totframes=VideoIO.counttotalframes(v1)     # number of frames in video
#size(vid)
time= VideoIO.get_duration(pathv::String)  # total video duration 
  
n= 40                                      # number of frames skipped
for i in 1:n:totframes
   
    img=vid[:, :, i]
    #imshow(img)     # display images 
    FileIO.save(path*filename*"_$i.jpg",img)

end

# To delete multiple images, open cmd in the destination folder and type following command
# del *.png 
# CAREFUL this command will delete all png files in folder

# del filename*.png
# only images starting with filename will be deletec

























