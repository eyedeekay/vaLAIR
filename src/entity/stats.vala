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
                private string stat_func = "";
                private int has_speed(){
                        return (speed > 0) ? 1 : 0;
                }
		private int has_exert(){
                        return (exert > 0) ? 1 : 0;
                }
		private int has_dodge(){
                        return (dodge > 0) ? 1 : 0;
                }
		private int has_aim(){
                        return (aim > 0) ? 1 : 0;
                }
		private int has_will(){
                        return (will > 0) ? 1 : 0;
                }
		private int has_resist(){
                        return (resist > 0) ? 1 : 0;
                }
		private int has_magic(){
                        return (magic > 0) ? 1 : 0;
                }
		private int has_tech(){
                        return (tech > 0) ? 1 : 0;
                }
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
                public Stats.Mobile(Video.Point corner, string aiScript, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
                        base.Mobile(corner, aiScript, Surfaces, music, font, generate_labels(), renderer, tags);
                        /*lua_do_function(get_stat_func());
                        List<string> tmp = get_lua_last_return();
                        Strength = tmp.nth_data(0).to_int();
                        Agility = tmp.nth_data(1).to_int();
                        Toughness = tmp.nth_data(2).to_int();
                        Intelligence = tmp.nth_data(3).to_int();
                        Special = tmp.nth_data(4).to_int();*/
                }
                public Stats.Player(Video.Point corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer){
                        //base.Parameter(corner, Surfaces, music, font, generate_labels(), renderer, one_tag_to_list("player"));
                        base.Player(corner, Surfaces, music, font, generate_labels(), renderer, one_tag_to_list("player"));
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
                public void set_stat_func(string statfunc){
                        stat_func = statfunc;
                }
                public string get_stat_func(){
                        return stat_func;
                }
		public int Speed(){
			int tmp = ( ( (Strength / 5) + (Agility / 2) ) / 2 ) ;
			return (tmp + speed) * has_speed();
		}
		public int Exert(){
                        int tmp = ( ( (Strength / 5) + (Toughness / 2) ) / 2 ) ;
			return (tmp + exert) * has_exert();
		}
		public int Dodge(){
                        int tmp = ( ( (Agility / 5) + (Toughness / 2) ) / 2 ) ;
			return (tmp + dodge) * has_dodge();
		}
		public int Aim(){
                        int tmp = ( ( (Agility / 5) + (Intelligence / 2) ) / 2 ) ;
			return (tmp + aim) * has_aim();
		}
		public int Will(){
                        int tmp = ( ( (Toughness / 5) + (Intelligence / 2) ) / 2 ) ;
			return (tmp + will) * has_will();
		}
		public int Resist(){
                        int tmp = ( ( (Toughness / 5) + (Special / 2) ) / 2 ) ;
			return (tmp + resist) * has_resist();
		}
		public int Magic(){
                        int tmp = ( ( (Intelligence / 5) + (Special / 2) ) / 2 ) ;
			return (tmp + magic) * has_magic();
		}
		public int Tech(){
                        int tmp = ( ( (Intelligence / 5) + (Agility / 2) ) / 2 ) ;
			return (tmp + tech) * has_tech();
		}
	}
}
