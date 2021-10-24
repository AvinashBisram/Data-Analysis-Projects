/*

Cleaning Data with SQL Queries

*/

--------------------------------------------------------------------------------------------

-- Standardize Date Format (Changing from string representation to date dtype)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
Set SaleDateConverted = Convert(Date,SaleDate)

--------------------------------------------------------------------------------------------

-- Populate Property Address data

-- Strangely enough, this dataset includes duplicate rows (same ParcelID and most other fields) but they have different UniqueID.
-- In the case where one duplicate parcel has a property address but the other does not, we want to populate that null address with its duplicate.

-- Performing a self join on the NashvilleHousing table
Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is Null -- Creating joined rows of same ParcelID where only one UniqueID has a populated address


Update a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
-- we don't need the WHERE clause because our ISNULL() already takes that into account

--------------------------------------------------------------------------------------------

-- Breaking out Property Address into Individual Columns (Address, City)

Select PropertyAddress
From PortfolioProject.dbo.NashvilleHousing

Select
Substring(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) as Address -- substring from start of full address to first comma (this comma separates the street address from the city) 
, Substring(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) as City -- substring from the separating comma to the end of the full address (contains the city)
From PortfolioProject.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255); -- the split street address

Update NashvilleHousing
Set PropertySplitAddress = Substring(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255); -- the split city 

Update NashvilleHousing
Set PropertySplitCity = Substring(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress))

--------------------------------------------------------------------------------------------

-- Breaking out Owner Address into Individual Columns (Address, City, State)

-- Using ParseName instead of Substring this time. This can be useful when we have common separators (in this case they are the commas).
-- ParseName specifically looks for periods so we replace the commas in the OwnerAddress with periods.
Select
PARSENAME(REPLACE(OwnerAddress,',','.'),3) -- split street address
,PARSENAME(REPLACE(OwnerAddress,',','.'),2) -- split city
,PARSENAME(REPLACE(OwnerAddress,',','.'),1) -- split state
From PortfolioProject.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
Set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)

--------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant) -- we see that the "Sold as Vacant" field uses both "Yes" and "Y" (same with "No" and "N")
From PortfolioProject.dbo.NashvilleHousing
Group by SoldasVacant
Order by 2

Select SoldAsVacant -- making sure it works as intended before updating the table
, CASE When SoldAsVacant = 'Y' THEN 'Yes' -- whenever the field is 'Y', change it to 'Yes'
	   When SoldAsVacant = 'N' THEN 'No' -- whenever the field is 'N', change it to 'N'
	   ELSE SoldAsVacant -- else don't make any change
	   END
From PortfolioProject.dbo.NashvilleHousing

Update NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
						When SoldAsVacant = 'N' THEN 'No'
						ELSE SoldAsVacant
						END

--------------------------------------------------------------------------------------------

-- Remove Duplicates

-- Handling the case seen above where multiple rows have different UniqueIDs but all other distinguishing fields are identical

WITH RowNumCTE AS (
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID		 
					) as row_num -- showing the relative number of a row with all the above fields being the same (every duplicate row after the first would have a row_num > 1)
From PortfolioProject.dbo.NashvilleHousing
)
DELETE
From RowNumCTE
Where row_num > 1 -- when row_num > 1, it means that row is a duplicate that we don't need (the first occurence would always have a row_num = 1)

--------------------------------------------------------------------------------------------

-- Delete Unused Columns

-- Deleting the columns we transformed in previous queries (and TaxDistrict which we don't care about)
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate