using SDL;
namespace LAIR{
	class Floor : Object{
		private List<Room> rooms = new List<Room>();
		public Floor(int width, int height, int count, GLib.Rand* DM){
			for (int c = 0; c <= count; c++){
				rooms.append(new Room(width, height, DM));
			}
		}
		public Floor.WithPlayer(int width, int height, int count, int entry, Entity* player, GLib.Rand* DM){
			for (int c = 0; c <= count; c++){
				if (count == entry){
					Room tmp = new Room(width, height, DM);
					rooms.append(tmp);
				}else{
					Room tmp = new Room.WithPlayer(width, height, player);
					rooms.append(tmp);
				}
			}
		}
		private bool HasPlayer(){
			bool tmp = false;
			foreach(Room room in rooms){
				tmp = room.HasPlayer();
			}
			return tmp;
		}
		public void RenderCopy(Video.Renderer* renderer){
			if (HasPlayer()){
				foreach(Room room in rooms){
					room.RenderCopy(renderer);
				}
			}
		}
	}
}