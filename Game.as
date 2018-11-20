package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.motion.MotionEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.media.SoundChannel;
	
	/**
	  * This is the document-level class that runs our entire game.
	  */
	public class Game extends MovieClip {
		
		 var score:int = 0;

		
		/** The constructor of the Game class. */
		public function Game() {
			
			var muse:BackMusic = new BackMusic(); // place holder for sound
			muse.play(); // plays the sound
			 
			
			start.addEventListener(MouseEvent.CLICK, StartGame); // adds a button to the start button and calls the startgame funtion when clicked
			gotoAndStop(1); //stops on the first frame
			
		}
		
		
		
		function StartGame (event:MouseEvent):void // starts the game
		{
			
			
			gotoAndStop(2); // goes to the next frame where the game is located
			addEventListener(Event.ENTER_FRAME, gameLoop); // adds event for when the game enters the frame to call a function
			
			
			
		}
		
		
		
		
		/**
		 * This is our game loop. It is an event-handler function that
		 * runs on the ENTER_FRAME event.
		 * @param e The Event object that is triggering this event-handler.
		 */
		
		
		function gameLoop(e:Event):void {
			
			// 1. measure how much time has passed
			// 2. get user input
			// 3. update everything
			
			
			
			
			thingy.update(); // update design pattern!
			
			if(thingy.unscoredPoints > 0){
				
				score += thingy.unscoredPoints;				
				thingy.unscoredPoints = 0;
				
			}
			
			
			
			scoreboard.text = "Score: " + score;
			
			if(thingy.isOutOfBounds){
				// game over...
				
			    removeEventListener(Event.ENTER_FRAME,gameLoop); // stops game loop
				gotoAndStop(3); // goes to game over screen
				
				scoreboard.text = "Score: " + score; // shows final score
				reset.addEventListener(MouseEvent.CLICK, Again); // calls the reset button function(also known as again)
				
			}
			
			// 4. draw everything		
			
			
			
			
		} // ends gameLoop
		
		
		
		
		
		
		function Again(event:MouseEvent):void // this function resets the game
		    {
				
				gotoAndStop(1);
				score = 0;
				start.addEventListener(MouseEvent.CLICK, StartGame);
			}
		
	} // ends Game class
	
} // end package
