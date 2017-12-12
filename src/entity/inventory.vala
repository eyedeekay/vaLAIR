using SDL;
using SDLMixer;
using SDLTTF;
namespace LAIR{
	class Inventory : Stats{
        //private List<Entity> Storage = new List<Entity>();
        //class BodyWear{
            //Entity head;
            //Entity eyes;
            //Entity neck;
            //Entity shirt;
            //Entity chest;
            //Entity arms;
            //Entity hand1;
            //Entity hand2;
            //Entity fing1;
            //Entity fing2;
            //Entity pants;
            //Entity belt;
            //List<Entity> quiver;
            //Entity ankle1;
            //Entity ankle2;
            //Entity socks;
            //Entity shoes;
            //Entity toes;

            //Entity cache;
        //}
        public Inventory(AutoPoint corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer ){
            base(corner, Surfaces, music, font, renderer);
        }
        public Inventory.Blocked(AutoPoint corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
            base.Blocked(corner, Surfaces, music, font, renderer, tags);
        }
        public Inventory.Wall(AutoPoint corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
            base.Wall(corner, Surfaces, music, font, renderer, tags);
        }
        public Inventory.Mobile(AutoPoint corner, string aiScript, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer, List<string> tags){
            base.Mobile(corner, aiScript, Surfaces, music, font, renderer, tags);
        }
        public Inventory.Player(AutoPoint corner, List<Video.Surface*> Surfaces, List<Music*> music, SDLTTF.Font* font, Video.Renderer? renderer){
            base.Player(corner, Surfaces, music, font, renderer);
        }
	}
}
