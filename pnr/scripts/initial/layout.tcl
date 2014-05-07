set dir ../scripts/libs/stooop
source ../scripts/libs/stooop/pkgIndex.tcl
package require stooop
namespace import stooop::*

class grid_element {
    #constructor
    proc grid_element {$this $row $col $width $height} {
	set ($this,row) $row
	set ($this,col) $col
	set ($this,width) $width
	set ($this,height) $height
    }

    #destructor
    proc ~grid_element {$this} {}
}
