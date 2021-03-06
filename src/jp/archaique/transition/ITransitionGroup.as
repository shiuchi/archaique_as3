package jp.archaique.transition
{
	public interface ITransitionGroup extends ITransitionBase
	{
		function get state():String;
		function addTransition( ...item ):void;
		function removeTransition( transition:ITransitionBase ):void;	
	}
}