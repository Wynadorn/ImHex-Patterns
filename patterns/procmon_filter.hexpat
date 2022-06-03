//SysInternals Procmon saves filters in the registry under
//HKEY_CURRENT_USER\SOFTWARE\Sysinternals\Process Monitor\

//Filters will be saved as Filter#<n>:<name>

enum FilterCategory : u8
{
	Operation = 0x77
};

enum FilterRelation : u8
{
	Is = 0x00,
	GreaterThan = 0x30
};

struct FilterEntry
{
	//FilterCategory FilterType;
	FilterCategory FilterType;
	padding[3];
	FilterRelation Relation;
	padding[3];
	bool include;
	u8 stringSize;
	padding [3];
	char value[stringSize];
	padding[8];
};

struct FilterSave
{
	u8 header;
	u8 filterCount;
	padding[3];
	FilterEntry filters[filterCount];
};

FilterSave data @ 0x00;





