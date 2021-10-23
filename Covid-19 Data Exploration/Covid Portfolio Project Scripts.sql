
-- Looking at our entire data set

SELECT *
FROM PortfolioProject.dbo.CovidDeaths
Where continent is not null
order by 3,4

SELECT *
FROM PortfolioProject.dbo.CovidVaccinations
order by 3,4

-- Selecting the data we'll be using primarily
Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject.dbo.CovidDeaths
Where continent is not null
order by 1,2


-- BREAKING THE DATA DOWN BY COUNTRY

-- Looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract Covid in a specific country (over time)
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathLikelihood
From PortfolioProject.dbo.CovidDeaths
Where location like '%states%' -- only in United States for convenience
and continent is not null
order by 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of a country's population has Covid (over time)
Select Location, date, Population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
Where location like '%states%'
and continent is not null
order by 1,2


-- Looking at Countries with Highest Infection Rate relative to their Population
Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- Looking at Countries with Highest Death Count
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount -- Total_deaths was of dtype nvarchar(255) by default
From PortfolioProject.dbo.CovidDeaths
Where continent is not null
Group by Location
order by TotalDeathCount desc


-- BREAKING THE DATA DOWN BY CONTINENT

-- Looking at Continents with the Highest Death Count
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject.dbo.CovidDeaths
Where continent is null -- Original dataset only included correct continent counts in Location column (not the continent column strangely enough)
Group by location
order by TotalDeathCount desc


-- GLOBAL NUMBERS

-- Looking at the global numbers of Total Cases, Total Deaths, and the Death Percentage of the global population
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
Where continent is not null
order by 1,2


-- Looking at Total Population vs Vaccinations

-- USE CTE (temporary result set for a single query)
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From PortfolioProject.dbo.CovidDeaths dea
Join PortfolioProject.dbo.CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
)
Select *, (RollingPeopleVaccinated/Population)*100 as RollingPercentVaccinated
From PopvsVac


-- TEMP TABLE

-- Creating the Temp Table
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

-- Inserting into the Temp Table
Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From PortfolioProject.dbo.CovidDeaths dea
Join PortfolioProject.dbo.CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null

-- Viewing our Temp Table
Select *, (RollingPeopleVaccinated/Population)*100 as RollingPercentVaccinated
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

-- Creating View
Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From PortfolioProject.dbo.CovidDeaths dea
Join PortfolioProject.dbo.CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null;

-- Viewing our View
Select *
From PercentPopulationVaccinated