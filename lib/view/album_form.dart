library dart_polymer_presentation_model.view.album_form;
		
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:dart_polymer_presentation_model/model/album_form_model.dart';

@CustomTag('album-form')
class AlbumForm extends PolymerElement
{
	//-----------------------------------
	//
	// Public Properties
	//
	//-----------------------------------
	
	@published AlbumFormModel albumFormModel;
  
	//-----------------------------------
	// HTML Elements
	//-----------------------------------
	
	FormElement get albumForm 			=> shadowRoot.querySelector('#album-form');

	InputElement get artistInput 		=> shadowRoot.querySelector('#artist-input');

	InputElement get titleInput 		=> shadowRoot.querySelector('#title-input');

	CheckboxInputElement get isclassicalBox	=> shadowRoot.querySelector('#isclassical-box');

	InputElement get composerInput 	=> shadowRoot.querySelector('#composer-input');
	
	InputElement get submitButton		=> shadowRoot.querySelector('#submit-button');
	
	InputElement get cancelButton		=> shadowRoot.querySelector('#cancel-button');
	
	//-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
 	
  AlbumForm.created() : super.created();
  
	//-----------------------------------
  //
  // Lifecycle Methods
  //
  //-----------------------------------
  
  @override
  void domReady()
  {
  	artistInput
    	..onInput.listen((_) => _updateButtons())
			..onChange.listen((_) => _updateButtons());
		
		titleInput
		  ..onInput.listen((_) => _updateButtons())
			..onChange.listen((_) => _updateButtons());

		isclassicalBox
			..onChange.listen((_) => _changeClassical());

		composerInput
		  ..onInput.listen((_) => _updateButtons());
		
		albumForm
  		..onSubmit.listen(_applyChanges);
		
		cancelButton
			..onClick.listen((_) => _cancelChanges());
		
		_resetForm();
  }
  
	//-----------------------------------
	//
	// Private Methods
	//
	//-----------------------------------
  
  void _changeClassical()
	{
  	albumFormModel.updateIsClassical(isclassicalBox.checked);
		
		_updateButtons();
	}
	
	void _updateButtons()
	{
		cancelButton.disabled = !albumFormModel.canCancel();
		submitButton.disabled = !_canSubmit();
	}
	
	bool _canSubmit()
	{
		bool result = !cancelButton.disabled;
		result = result && artistInput.validity.valid;
		result = result && titleInput.validity.valid;
		
		if (isclassicalBox.checked == true)
		{
			result = result && composerInput.validity.valid;
			result = result && composerInput.value != "";
		}
		
		return result;
	}
	
	void _applyChanges(Event event)
	{
		albumFormModel.applyChanges();
	
		event.preventDefault();
		event.stopPropagation();
		
		_updateButtons();
	}
	
	void _cancelChanges()
	{				
		albumFormModel.cancelChanges();
		
		_updateButtons();
	}
	
	void _resetForm()
	{
		cancelButton.disabled = true;
		submitButton.disabled = true;
	}
}