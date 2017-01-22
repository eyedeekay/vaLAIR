using SDL;
using SDLMixer;
using SDLTTF;
namespace LAIR{
	class Stats : Voice{
		private int Strength = 10;
		private int Agility = 10;
		private int Toughness = 10;
		private int Intelligence = 10;
		private int Special = 10;
		private int speed = 1;
		private int exert = 1;
		private int dodge = 1;
		private int aim = 1;
		private int will = 1;
		private int resist = 1;
		private int magic = 1;
		private int tech = 1;
                public Stats(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer ){
                        base(corner, Surfaces, music, font, generate_labels(), renderer);
                }
                public Stats.Floor(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer){
                        base.Parameter(corner, Surfaces, music, font, generate_labels(), renderer, one_tag_to_list("floor"));
                }
                public Stats.Blocked(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
                        base.Blocked(corner, Surfaces, music, font, generate_labels(), renderer, tags);
                }
                public Stats.Wall(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
                        base.Blocked(corner, Surfaces, music, font, generate_labels(), renderer, tags);
                        Strength = 10;
                        Agility = 10;
                        Toughness = 10;
                        Intelligence = 0;
                        Special = 0;
                        speed = 1;
                }
                public Stats.Mobile(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
                        base.Blocked(corner, Surfaces, music, font, generate_labels(), renderer, tags);
                }
                public Stats.Player(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer){
                        base.Parameter(corner, Surfaces, music, font, generate_labels(), renderer, one_tag_to_list("player"));
                }
                private static List<string> generate_labels(){
                        List<string> tmp = new List<string>();
                        tmp.append("Strength : ");
                        tmp.append("Agility  : ");
                        tmp.append("Toughness: ");
                        tmp.append("Intellect: ");
                        tmp.append("Special  : ");
                        tmp.append(" _speed : ");
                        tmp.append(" _exert : ");
                        tmp.append(" _dodge : ");
                        tmp.append(" _aim   : ");
                        tmp.append(" _will  : ");
                        tmp.append(" _resist: ");
                        tmp.append(" _magic : ");
                        tmp.append(" _tech  : ");
                        return tmp;
                }
		public int Speed(){
			int tmp = ( ( (Strength / 5) + (Agility / 2) ) / 2 ) ;
			return (tmp + speed) -1;
		}
		public int Exert(){
                        int tmp = ( ( (Strength / 5) + (Toughness / 2) ) / 2 ) ;
			return (tmp + exert);
		}
		public int Dodge(){
                        int tmp = ( ( (Agility / 5) + (Toughness / 2) ) / 2 ) ;
			return (tmp + dodge);
		}
		public int Aim(){
                        int tmp = ( ( (Agility / 5) + (Intelligence / 2) ) / 2 ) ;
			return (tmp + aim);
		}
		public int Will(){
                        int tmp = ( ( (Toughness / 5) + (Intelligence / 2) ) / 2 ) ;
			return (tmp + will);
		}
		public int Resist(){
                        int tmp = ( ( (Toughness / 5) + (Special / 2) ) / 2 ) ;
			return (tmp + resist);
		}
		public int Magic(){
                        int tmp = ( ( (Intelligence / 5) + (Special / 2) ) / 2 ) ;
			return (tmp + magic);
		}
		public int Tech(){
                        int tmp = ( ( (Intelligence / 5) + (Agility / 2) ) / 2 ) ;
			return (tmp + tech);
		}
	}
}
