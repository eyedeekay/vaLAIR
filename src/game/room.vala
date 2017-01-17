using SDL;
using Lua;

namespace LAIR{
	class Room : LuaConf{
		private bool visited = false;
                private Video.Rect Border = Video.Rect(){ x = 0, y = 0, w = 0, h = 0 };
		private List<Entity> Particles = new List<Entity>();
		private List<Entity> Mobs = new List<Entity>();
                private Entity Player = null;
                private static FileDB GameMaster = null;
                public Room(Video.Rect position, Video.Rect floordims, string[] scripts, FileDB DM, Video.Renderer? renderer){
                        base(scripts[0], 2, "room:");
                        SetDimensions(position.x, position.y, position.w, position.h);
                        SetFloorDimensions(floordims);
                        SetName("room ("+HitBoxToString()+"): ");
                        prints("generating room\n");
                        GameMaster = DM;
                        //RegisterLuaFunctions();
                        PushDimsToLuaTable(GetHitBox());
                        GenerateStructure(2, renderer);
		}
                public Room.WithPlayer(Video.Rect position, Video.Rect floordims, string[] scripts, FileDB DM, Video.Renderer? renderer){
                        base(scripts[0], 2, "room:");
                        SetDimensions(position.x, position.y, position.w, position.h);
                        SetFloorDimensions(floordims);
                        SetName("room ("+HitBoxToString()+"): ");
                        prints("generating room with player\n");
                        GameMaster = DM;
                        //RegisterLuaFunctions();
                        PushDimsToLuaTable(GetHitBox());
                        GenerateStructure(2, renderer);
                        EnterRoom(new Entity.Player(Video.Point(){x = 128, y = 128}, GameMaster.BodyByTone("med"), GameMaster.BasicSounds(), GameMaster.GetRandFont(), renderer));
		}
                private void SetDimensions(int x, int y, uint w, uint h){
                        Border.x = x;
                        Border.y = y;
                        Border.w = w;
                        Border.h = h;
                }
                private void SetFloorDimensions(Video.Rect floordims){
                        PushUintToLuaTable("floor_w", "w", floordims.w );
                        PushUintToLuaTable("floor_h", "h", floordims.h );
                        PushUintToLuaTable("floor_coarse_w", "w", (floordims.w / 32) );
                        PushUintToLuaTable("floor_coarse_h", "h", (floordims.h / 32) );
                }
                private int GetX(){     return (int) Border.x;}
                private int GetOffsetX(int x){
                        int r = (x * 32) + GetX();
                        return r;
                }
                private int GetY(){     return (int) Border.y;}
                private int GetOffsetY(int y) {
                        int r = (y * 32) + GetY();
                        return r;
                }
                public Video.Point GetCorner(){
                        Video.Point r = Video.Point(){x=GetX(), y=GetY()};
                        return r;
                }
                public uint GetW(){     return Border.w;}
                public uint GetH(){     return Border.h;}
                private void GeneratorPushXYToLua(Video.Point current, Video.Point simplecurrent){
                        PushCoordsToLuaTable(current, simplecurrent);
                        particle_count();
                        particle_count_bytag();
                        mobile_count();
                        mobile_count_bytag();
                }
                private int particle_count(){
                        PushUintToLuaTable("""generator_particle_count""", """c""", Particles.length());
                        return (int) Particles.length();
                }
                //private CallbackFunc particle_count_delegate = (CallbackFunc) particle_count;
                private int mobile_count(){
                        PushUintToLuaTable("""generator_mobile_count""", """c""", Mobs.length());
                        return (int) Mobs.length();
                }
                //Todo: Instead of doing it this way, pass a new entity to this
                //function and have it do the appending, so we can skip the
                //first for loop here and just add tags for new entities.
                //Requires caching the tag count, but arguably should be doing
                //that anyway. Not important right now. Thiw way works.
                private void particle_count_bytag(){
                        List<TagCounter> tagcount = new List<TagCounter>();
                        foreach(Entity particle in Particles){
                                foreach(string tag in particle.GetTags()){
                                        bool has = false;
                                        foreach(TagCounter count in tagcount){
                                                if(count.CheckName(tag)){
                                                        count.Inc();
                                                        has = true;
                                                        break;
                                                }
                                        }
                                        if(!has){
                                                tagcount.append(new TagCounter(tag));
                                        }
                                }
                        }
                        foreach(TagCounter count in tagcount){
                                PushUintToLuaTable(count.GetName(), "c", count.GetCount());
                        }
                }
                private void mobile_count_bytag(){
                        List<TagCounter> tagcount = new List<TagCounter>();
                        foreach(Entity mob in Mobs){
                                foreach(string tag in mob.GetTags()){
                                        bool has = false;
                                        foreach(TagCounter count in tagcount){
                                                if(count.CheckName(tag)){
                                                        count.Inc();
                                                        has = true;
                                                        break;
                                                }
                                        }
                                        if(!has){
                                                tagcount.append(new TagCounter(tag));
                                        }
                                }
                        }
                        foreach(TagCounter count in tagcount){
                                PushUintToLuaTable(count.GetName(), "c", count.GetCount());
                        }
                }
                private void GenerateFloorTile(Video.Point coords, Video.Renderer* renderer){
                        Particles.append(new Entity(coords, GameMaster.ImageByName("floor"), GameMaster.NoSound(), GameMaster.GetRandFont(), renderer));
                }
                private void DecideBlockTile(Video.Point coords, Video.Renderer* renderer){
                        LuaDoFunction("""map_cares_insert()""");
                        List<string> cares = GetLuaLastReturn();
                        prints("\n");
                        if(cares != null){
                                if(cares.nth_data(0) == "true"){
                                        prints("Will it blend?\n");
                                        LuaDoFunction("""map_image_decide()""");
                                        List<string> imgTags = GetLuaLastReturn();
                                        LuaDoFunction("""map_sound_decide()""");
                                        List<string> sndTags = GetLuaLastReturn();
                                        LuaDoFunction("""map_fonts_decide()""");
                                        List<string> fntTags = GetLuaLastReturn();
                                        inject_particle(coords, imgTags, sndTags, fntTags, renderer);
                                }
                        }
                }
                private void DecideMobileTile(Video.Point coords, Video.Renderer* renderer){
                        LuaDoFunction("""mob_cares_insert()""");
                        List<string> cares = GetLuaLastReturn();
                        prints("\n");
                        if(cares != null){
                                if(cares.nth_data(0) == "true"){
                                        prints("Will it blend?\n");
                                        LuaDoFunction("""mob_image_decide()""");
                                        List<string> imgTags = GetLuaLastReturn();
                                        LuaDoFunction("""mob_sound_decide()""");
                                        List<string> sndTags = GetLuaLastReturn();
                                        LuaDoFunction("""mob_fonts_decide()""");
                                        List<string> fntTags = GetLuaLastReturn();
                                        inject_mobile(coords, imgTags, sndTags, fntTags, renderer);
                                }
                        }
                }
                //Only coarse generation of the dungeon structure is done in the native code, most of the logic will be handed to scripts eventually.
                private void GenerateStructure(int CR, Video.Renderer* renderer){
                        int WT = (int)(GetW() / 32); int HT = (int)(GetH() / 32);
                        for (int xx = 0; xx < WT; xx++){
                                for (int yy = 0; yy < HT; yy++){
                                        Video.Point simplecoords = Video.Point(){x=xx, y=yy};
                                        Video.Point coords = Video.Point(){x=GetOffsetX(xx), y=GetOffsetY(yy)};
                                        GeneratorPushXYToLua(coords, simplecoords);
                                        GenerateFloorTile(coords, renderer);
                                        DecideBlockTile(coords, renderer);
                                        DecideMobileTile(coords, renderer);
                                }
                        }
                }
                public bool HasPlayer(){
			bool tmp = false;
			if (Player != null){
				tmp = true;
                                visited = true;
			}
			return tmp;
		}
                public Entity GetPlayer(){
			Entity tmp = null;
			if (Player != null){
				tmp = Player;
			}
			return tmp;
		}
                public int TakeTurns(){
                        int tmp = 1;
                        if (HasPlayer()){
                                tmp = Player.run();
                                if (tmp > 1){
                                        prints("    Player took a turn : %s \n", tmp.to_string());
                                }
                        }else{
                                foreach(Entity mob in Mobs){
					mob.run();
				}
                        }
                        return tmp;
                }
                public bool DetectCollisions(){
                        bool t = false;
                        foreach(var particle in Particles){
                                if(HasPlayer()){
                                        t = Player.DetectCollision(particle) ? true : t ;
                                }
                                //foreach(var mob in Mobs){
                                        //particle.DetectCollision(mob);
                                        //t = Player.DetectCollision(mob) ? Player.DetectCollision(mob) : t;
                                //}
                        }
                        return t;
                }
                private Video.Rect GetHitBox(){
                        return Border;
                }
                private string HitBoxToString(){
                        string HBSUM = "x:";
                        HBSUM += Border.x.to_string();
                        HBSUM += "y:";
                        HBSUM += Border.y.to_string();
                        HBSUM += "w:";
                        HBSUM += Border.w.to_string();
                        HBSUM += "h:";
                        HBSUM += Border.h.to_string();
                        return HBSUM;
                }
                private bool InRange(Video.Point point, Video.Rect hitbox){
                        bool t = false;
                        int xx = (int) (hitbox.x + hitbox.w);
                        int yy = (int) (hitbox.y + hitbox.h);
                        if ( point.x > hitbox.x ){
                                if ( point.x <  xx ){
                                        if( point.y > hitbox.y ){
                                                if( point.y < yy ){
                                                        t = true;
                                                }
                                        }
                                }
                        }
                        return t;
                }
                public bool DetectTransition(Entity t){
                        bool r = false;
                        if(t!=null){
                                Video.Point tlc = Video.Point(){ x = t.GetHitBox().x,
                                        y=t.GetHitBox().y };
                                bool TLeftCorner = InRange(tlc, GetHitBox());
                                Video.Point trc = Video.Point(){ x = (int)(t.GetHitBox().x + t.GetHitBox().w),
                                        y = t.GetHitBox().y };
                                bool TRightCorner = InRange(trc, GetHitBox());
                                Video.Point blc = Video.Point(){ x = t.GetHitBox().x,
                                        y = (int)(t.GetHitBox().y + t.GetHitBox().h) };
                                bool BLeftCorner = InRange(blc, GetHitBox());
                                Video.Point brc = Video.Point(){ x = (int)(t.GetHitBox().x + t.GetHitBox().w),
                                        y = (int)(t.GetHitBox().y + t.GetHitBox().h) };
                                bool BRightCorner = InRange( brc, GetHitBox());

                                //TLeftCorner = GetHitBox().contains(tlc);
                                //TRightCorner = GetHitBox().contains(trc);
                                //BLeftCorner = GetHitBox().contains(blc);
                                //BRightCorner = GetHitBox().contains( brc);
                                if (TLeftCorner){
                                        r = true;
                                }
                                if (TRightCorner){
                                        r = true;
                                }
                                if (BLeftCorner){
                                        r = true;
                                }
                                if (BRightCorner){
                                        r = true;
                                }
                        }
                        return r;
                }
                public void RenderCopy(Video.Renderer renderer, Video.Point player_pos){
			if (visited){
                                //prints("Drawing Room at: %s\n", HitBoxToString());
				foreach(Entity particle in Particles){
					particle.RenderOffset(renderer, player_pos);
				}
			}
                        if (HasPlayer()){
				Player.RenderOffset(renderer, player_pos);
				if (visited = false){
					visited = true;
				}
				foreach(Entity mob in Mobs){
					mob.RenderOffset(renderer, player_pos);
				}
			}
		}
		public bool EnterRoom(Entity player){
			if (player != null){
                                prints("    Player Entering Room. \n");
				Player = player;
                                visited = true;
			}else{
                                Player = null;
                                visited = false;
                        }
			return visited;
		}
		public Entity LeaveRoom(bool doleave){
                        Entity tmp = null;
                        if (doleave){
                                if (Player != null){
                                        tmp = Player;
                                        Player = null;
                                }
                        }
			return tmp;
		}
                //lua interfaces for dungeon generation start here, already loose naming conventions deliberately changed...
                private void inject_particle(Video.Point coords, List<string> imgTags, List<string> sndTags, List<string> fntTags, Video.Renderer* renderer){
                        if ( coords.x < GetX() + GetW() ){ if ( coords.x >= GetX() ){
                                if ( coords.y < GetY() + GetW() ){ if ( coords.y >= GetY() ){
                                        //List<string> tags = new List<string>(); tags.concat(imgTags.copy()); tags.concat(sndTags.copy()); tags.concat(fntTags.copy());
                                        //Particles.append(new Entity.Blocked(coords, GameMaster.ImageByName(imgTags.nth_data(0)), GameMaster.NoSound(), GameMaster.GetRandFont(), renderer));
                                        Particles.append(new Entity.ParameterListBlocked(coords, GameMaster.ImageByName(imgTags.nth_data(0)), GameMaster.NoSound(), GameMaster.GetRandFont(), renderer, imgTags));
                                        LuaDoFunction("record_cell(\"" + imgTags.nth_data(0) + "\")");
                                }}
                        }}
                }
                private void inject_mobile(Video.Point coords, List<string> imgTags, List<string> sndTags, List<string> fntTags, Video.Renderer* renderer){
                        if ( coords.x < GetX() + GetW() ){ if ( coords.x >= GetX() ){
                                if ( coords.y < GetY() + GetW() ){ if ( coords.y >= GetY() ){
                                        //List<string> tags = new List<string>(); tags.concat(imgTags.copy()); tags.concat(sndTags.copy()); tags.concat(fntTags.copy());
                                        //Mobs.append(new Entity(coords, GameMaster.ImageByName(imgTags.nth_data(0)), GameMaster.BasicSounds(), GameMaster.GetRandFont(), renderer));
                                        Mobs.append(new Entity.ParameterList(coords, GameMaster.ImageByName(imgTags.nth_data(0)), GameMaster.BasicSounds(), GameMaster.GetRandFont(), renderer, imgTags));
                                        LuaDoFunction("record_mobile(\"" + imgTags.nth_data(0) + "\")");
                                }}
                        }}
                }
	}
}
