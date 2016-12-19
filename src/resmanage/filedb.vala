using SDL;
using SDLImage;
using SDLGraphics;
using SDLMixer;
using SDLTTF;
namespace LAIR{
	class FileDB {
		private List<Image> imgRes = new List<Image>();
		private List<Sound> sndRes = new List<Sound>();
		private List<Fonts> ttfRes = new List<Fonts>();
		private LairFile imgListPath = null;
		private LairFile sndListPath = null;
		private LairFile ttfListPath = null;
                private GLib.Rand Sorcerer = new GLib.Rand();
		public FileDB(string imgList, string sndList, string ttfList){
			var imgfile = new LairFile.WithPath(imgList);
			stdout.printf("Pre-Loading the game data files.\n");
			if (imgfile.CheckPath()){
				stdout.printf("Pre-Loading the image files(data at %s).\n", imgfile.GetPath());
				imgListPath = imgfile;
			}else{
				stderr.printf ("File '%s' doesn't exist.\n", imgfile.GetPath());
			}
			var sndfile = new LairFile.WithPath(sndList);
			if (sndfile.CheckPath()){
				stdout.printf("Pre-Loading the sound files(data at %s).\n", sndfile.GetPath());
				sndListPath = sndfile;
			}else{
				stderr.printf ("File '%s' doesn't exist.\n", sndfile.GetPath());
			}
			var ttffile = new LairFile.WithPath(ttfList);
			if (ttffile.CheckPath()){
				stdout.printf("Pre-Loading the font files(data at %s).\n", ttffile.GetPath());
				ttfListPath = ttffile;
			}else{
				stderr.printf ("File '%s' doesn't exist.\n", ttffile.GetPath());
			}
			LoadFilesWithTags();
		}
                public bool LoadFilesWithTags(){
			bool tmp = false;
			if (imgListPath.CheckPath()){
				stdout.printf("Loading the image files\n");
                                for (int x = 0; x < imgListPath.LenLineDelimitedConfig(); x++){
                                        List<string> image = imgListPath.GetConfigLine(x);
                                        foreach(string y in image){
                                                stdout.printf("(%s)", y);
                                        }
                                        stdout.printf(".\n");
					imgRes.append(new Image.WithAttList(image));
                                }
				tmp = true;
			}else{
				tmp = false;
			}
			if (sndListPath.CheckPath()){
				stdout.printf("Loading the sound files\n");
                                for (int x = 0; x < sndListPath.LenLineDelimitedConfig(); x++){
                                        List<string> sound = sndListPath.GetConfigLine(x);
                                        foreach(string y in sound){
                                                stdout.printf("(%s)", y);
                                        }
                                        stdout.printf(".\n");
					sndRes.append(new Sound.WithAttList(sound));
                                }
				tmp = true;
			}else{
				tmp = false;
			}
			if (ttfListPath.CheckPath()){
				stdout.printf("Loading the font files\n");
                                for (int x = 0; x < ttfListPath.LenLineDelimitedConfig(); x++){
                                        List<string> font = ttfListPath.GetConfigLine(x);
                                        foreach(string y in font){
                                                stdout.printf("(%s)", y);
                                        }
                                        stdout.printf(".\n");
					ttfRes.append(new Fonts.WithAttList(font, "medium"));
                                }
				tmp = true;
			}else{
				tmp = false;
			}
			return tmp;
		}
/*                public int GetImagesLength(){
                        return (int) imgRes.length();
                }*/
                public int GetSoundsLength(){
                        return (int) sndRes.length();
                }
                public int GetFontsLength(){
                        return (int) ttfRes.length();
                }
                /*private int GetRandomImageIndex(){
                        int tmp = Sorcerer.int_range(0, GetImagesLength());
                        stdout.printf("Random Image from Index #: %s \n", tmp.to_string());
                        return tmp;
                }*/
                private int GetRandomSoundIndex(){
                        int tmp = Sorcerer.int_range(0, GetSoundsLength());
                        stdout.printf("Random Sound from Index # %s \n", tmp.to_string());
                        return tmp;
                }
                private int GetRandomFontIndex(){
                        int tmp = Sorcerer.int_range(0, GetFontsLength());
                        stdout.printf("Random Font from Index #: %s \n", tmp.to_string());
                        return tmp;
                }
/*                private int GetRandomImageIndexByRange(int bottom, int top){
                        int t = top;
                        int b = bottom;
                        if (top > GetImagesLength()){
                                t = GetImagesLength();
                        }
                        if (bottom > 0 ){
                                b = 0;
                        }
                        return Sorcerer.int_range(bottom, top);
                }
                private int GetRandomSoundIndexByRange(int bottom, int top){
                        int t = top;
                        int b = bottom;
                        if (top > GetSoundsLength()){
                                t = GetSoundsLength();
                        }
                        if (bottom > 0 ){
                                b = 0;
                        }
                        return Sorcerer.int_range(bottom, top);
                }
                private int GetRandomFontIndexByRange(int bottom, int top){
                        int t = top;
                        int b = bottom;
                        if (top > GetFontsLength()){
                                t = GetFontsLength();
                        }
                        if (bottom > 0 ){
                                b = 0;
                        }
                        return Sorcerer.int_range(bottom, top);
                }*/
/*                public Video.Surface* GetRandImage(){
                        return imgRes.nth_data(GetRandomImageIndex()).GetImage();
                }
                public Video.Surface* GetRandImageByRange(int bottom, int top){
                        return imgRes.nth_data(GetRandomImageIndexByRange(bottom, top)).GetImage();
                }*/
                public Music* GetRandSound(){
                        return sndRes.nth_data(GetRandomSoundIndex()).GetSound();
                }/*
                public Music* GetRandSoundByRange(int bottom, int top){
                        return sndRes.nth_data(GetRandomSoundIndexByRange(bottom,top)).GetSound();
                }*/
                public SDLTTF.Font* GetRandFont(){
                        return ttfRes.nth_data(GetRandomFontIndex()).GetFont();
                }/*
                public SDLTTF.Font* GetRandFontByRange(int bottom, int top){
                        return ttfRes.nth_data(GetRandomFontIndexByRange(bottom, top)).GetFont();
                }*/
                public List<Video.Surface*> ImageByName(string name){
                        int c = 0;
                        List<int> tmp = new List<int>();
                        List<Video.Surface*> r = new List<Video.Surface*>();
			foreach (Image file in imgRes){
				if (file.HasName(name)){
					tmp.append(c);
				}
                                c++;
			}
                        int top = (int) tmp.length();
                        int index = Sorcerer.int_range(0, top);
                        stdout.printf("Emitting random image from index #: %s \n", tmp.nth_data(index).to_string() );
			r.append(imgRes.nth_data(tmp.nth_data(index)).GetImage());
                        return r;
		}
                public List<Video.Surface*> ImageListByName(string name, int num){
                        int c = 0;
                        List<int> tmp = new List<int>();
                        List<Video.Surface*> r = new List<Video.Surface*>();
			foreach (Image file in imgRes){
				if (file.HasName(name)){
					tmp.append(c);
				}
                                c++;
			}
                        int top = (int) tmp.length();
                        for (int i = 0; i < num; i++){
                                int index = Sorcerer.int_range(0, top);
                                stdout.printf("Emitting random image from index #: %s \n", tmp.nth_data(index).to_string() );
                                r.append(imgRes.nth_data(tmp.nth_data(index)).GetImage());
                        }
			return r;
		}
                /*
		public Video.Surface* ImageByTag(string query){
                        int c = 0;
                        List<int> tmp = new List<int>();
			foreach (Image file in imgRes){
				if (file.HasTag(query)){
					tmp.append(c);
				}
                                c++;
			}
                        int top = (int) tmp.length();
                        int index = Sorcerer.int_range(0, top);
			return imgRes.nth_data(tmp.nth_data(index)).GetImage();
		}*/
                public List<Video.Surface*> BodyByTone(string tone){
                        //int c = 0;
                        List<List<int>> tmp = new List<List<int>>();
                        List<Video.Surface*> r = new List<Video.Surface*>();
                        List<string> Names = new List<string>();
                        Names.append("head"); Names.append("body"); Names.append("leftarms"); Names.append("leftleg"); Names.append("rightarms"); Names.append("rightleg");
                        stdout.printf("Generating a body of %s ", tone);
                        foreach(string name in Names){
                                int c = 0;
                                List<int> t = new List<int>();
                                foreach (Image file in imgRes){
                                        string fullname = tone + name;
                                        if (file.HasName(fullname)){
                                                stdout.printf("found component %s ", fullname);
                                                t.append(c);
                                        }
                                        c++;
                                }
                                tmp.append(t.copy());
                        }
                        foreach(var tm in tmp.copy()){
                                int top = (int) tm.length();
                                int index = Sorcerer.int_range(0, top);
                                stdout.printf(" \n Emitting body component index #: %s \n", tm.nth_data(index).to_string() );
                                r.append(imgRes.nth_data(tm.nth_data(index)).GetImage());
                        }
			return r;
                }/*
                public List<Video.Surface*> BodyByTagList(List<string> query){
                }
                public Music* SoundByName(string name){
			List<Music*> tmp = new List<Music*>();
			foreach (Sound file in sndRes){
				if (file.HasName(name)){
					tmp.append(file.GetSound());
				}
			}
                        int top = (int) tmp.length();
                        int index = Sorcerer.int_range(0, top);
			return tmp.nth_data(index);
		}
		public Music* SoundByTag(string query){
			List<Music*> tmp = new List<Music*>();
			foreach (Sound file in sndRes){
				if (file.HasTag(query)){
					tmp.append(file.GetSound());
				}
			}
                        int top = (int) tmp.length();
                        int index = Sorcerer.int_range(0, top);
			return tmp.nth_data(0);
		}
                public SDLTTF.Font* FontByName(string name){
			List<SDLTTF.Font*> tmp = new List<SDLTTF.Font*>();
			foreach (Fonts file in ttfRes){
				if (file.GetPath() == name){
					tmp.append(file.GetFont());
				}
			}
                        int top = (int) tmp.length();
                        int index = Sorcerer.int_range(0, top);
			return tmp.nth_data(index);
		}
		public SDLTTF.Font* FontByTag(string query){
			List<SDLTTF.Font*> tmp = new List<SDLTTF.Font*>();
			foreach (Fonts file in ttfRes){
				if (file.HasTag(query)){
					tmp.append(file.GetFont());
				}
			}
                        int top = (int) tmp.length();
                        int index = Sorcerer.int_range(0, top);
			return tmp.nth_data(0);
		}*/
	}
}