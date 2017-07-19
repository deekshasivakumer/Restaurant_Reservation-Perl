# gets the list of names
# from the files names.txt
sub build_list_of_names
{
	@my_list = ();
	$filename = 'names.txt';
	open (FILE, "<", $filename);
	while (chomp($name = <FILE>))
	{
		push(@my_list, $name);
	}
	close(FILE);
}

# creates the option menu
sub get_user_option
{
	# the options menu
	print("\n1.Search for customer\n");
	print("2.Add new customer\n");
	print("3.Get all customer names\n");
	print("4.Quit\n");
	
	# the option selected by the user
	print("\nSelect an option: ");
	chomp($option_selected = <STDIN>);
	# above line can be written as
	# $option_selected = <STDIN>;
	# chomp($option_selected);
	
	# returns the selected option
	return $option_selected;
}

# retreive all customers
sub get_customers
{
	print("\nCustomers:\n\n");
	my $count = 0; # counts the number of active customers.
	foreach $name_of_customer (@my_list) # prints out the active customers
	{
		$count += 1;
		print("$count. $name_of_customer\n");
	}
}

# to add a new customer
sub add_new_customer
{
	print("\nEnter name of new customer: ");
	chomp($the_new_customer = <STDIN>);
	$exit_status = push(@my_list, $the_new_customer);
	if($exit_status)
	{ 
		print("\nNew customer added.\n");
	}
	else
	{
		print("\nError.\n");
	}
}

# search for a active customer.
sub search_for_customer
{
	# the option selected by the user.
	print("\nEnter name of the customer: ");
	chomp($name_of_customer = <STDIN>);
	
	foreach $name (@my_list)
	{
		#compare the pattern to the user input.
		
		if (lc($name_of_customer) eq lc($name)) # lc - lower case operator
		{
			print("\n$name was found!!!\n");
			return;
		}
	}
}

#--------------------------------------
# Perl Application starts here.
#--------------------------------------

print("\n\n\t\tWelcome To Joe's Bar & Grill:Guest List\n\n");
print("\t\t\tDesigned By: Deeksha Sivakumer\n\n");
&build_list_of_names(); # gets the list of names from the text file and uploads it on the screen.
$option_selected = &get_user_option(); # get user selected option from the menu.
while ($option_selected != 4)
{
	if ($option_selected == 1)
	{
		&search_for_customer();
		$option_selected = &get_user_option();
	} 
	elsif ($option_selected == 2)
	{
		&add_new_customer();
		$option_selected = &get_user_option();
	}
	elsif ($option_selected == 3)
	{
		&get_customers();
		$option_selected = &get_user_option();
	}
	else
	{
		print("\nInvalid Option!!!\n");
		$option_selected = &get_user_option();
	}
}

# save the new data to the text file
$filename = 'names.txt';
open(FILE, ">", $filename);
foreach $name (@my_list)
{
	chomp($name);
	print(FILE "$name\n");
}
close(FILE);

print("\nExiting...\n\n");
exit;

	
	
	
	
	
	
	