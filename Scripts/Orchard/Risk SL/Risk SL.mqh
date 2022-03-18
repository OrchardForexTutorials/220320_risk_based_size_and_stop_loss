/*
   Fixed and Dynamic Arrays.mqh
   Copyright 2022, Orchard Forex
   https://orchardforex.com

 */

/**=
 *
 * Disclaimer and Licence
 *
 * This file is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * All trading involves risk. You should have received the risk warnings
 * and terms of use in the README.MD file distributed with this software.
 * See the README.MD file for more information and before using this software.
 *
 **/
#property strict

#include <Orchard/Tutorials/RiskCalc.mqh>

input double InpLots     = 1.0;  // Lot size for sl calc
input int    InpSLPoints = 200;  // SL Points for lot size calculation
input double InpRisk     = 0.01; // Risk percent

void         OnStart( void ) {

   double slSize = PercentSLSize( Symbol(), InpRisk, InpLots );
   PrintFormat( "Stop Loss distance for %s with equity of %f and risk of %f and lot size %f is %f",
                        Symbol(), AccountInfoDouble( ACCOUNT_EQUITY ), InpRisk, InpLots, slSize );

   double lots = PercentRiskLots( Symbol(), InpRisk, PointsToDouble( Symbol(), InpSLPoints ) );
   PrintFormat( "Lots based on risk for %s with equity of %f and risk of %f and sl of %f is %f",
                        Symbol(), AccountInfoDouble( ACCOUNT_EQUITY ), InpRisk,
                        PointsToDouble( Symbol(), InpSLPoints ), lots );
}
