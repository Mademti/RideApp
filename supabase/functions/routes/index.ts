// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "jsr:@supabase/functions-js/edge-runtime.d.ts"

// console.log("Hello from Functions!")

type Coordinates = {
  lat: number;
  lng: number;

Deno.serve(async (req) => { //this is the main function that will be executed when the function is called

  const {origin, destination} : {origin: Coordinates; destination: Coordinates;} = await req.json();

  const response = await fetch('https://routes.googleapis.com/directions/v2:computeRoutes?key=${Deno.env.get('GOOGLE_MAPS_API_KEY')}', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      "X-Goog-FieldMask":
      "routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline,routes.legs.startLocation,routes.legs.endLocation,routes.legs.steps.maneuver,routes.legs.steps.startLocation,routes.legs.steps.endLocation,routes.legs.steps.polyline.encodedPolyline",
    },
    body: JSON.stringify({
      origin: {location: {latLng: origin}},
      destination: {location: {latLng: destination}},
      travelMode: "DRIVE",
      polylineEncoding: 'GEO_JSON_LINESTRING',
      
    }),
  });

  IF (!response.ok) {
    const error = await response.json();
    console.error("Error:", error);
    throw new Error("Http error hahaha");
    
  }

  const data = await response.json();

  const res = data.routes[0];




  // const { name } = await req.json()
  // const data = {
  //   message: `Hello ${name}!`,
  // }

  return new Response(
    JSON.stringify(res),
    { headers: { "Content-Type": "application/json" } },
  )
})

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/routes' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
