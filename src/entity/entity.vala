using SDL;
using SDLMixer;
using SDLTTF;
namespace LAIR{
	class Entity : Move{
                public Entity(int x, int y, int b, List<Video.Surface*> imgStack, Music* music, SDLTTF.Font* font, Video.Renderer? renderer ){
                        base(x, y, imgStack.nth_data(0) , music, font, renderer);
                }
                public Entity.Single(int x, int y, Video.Surface* surface, Music* music, SDLTTF.Font* font, Video.Renderer? renderer ){
                        base(x, y, surface, music, font, renderer);
                }
                public Entity.Blockd(int x, int y, Video.Surface* surface, Music* music, SDLTTF.Font* font, Video.Renderer? renderer ){
                        base(x, y, surface, music, font, renderer);
                        Block();
                }
                public Entity.Player(int x, int y, Video.Surface* surface, Music* music, SDLTTF.Font* font, Video.Renderer? renderer ){
                        base(x, y, surface, music, font, renderer);
                        SetType(1);
                }
	}
}