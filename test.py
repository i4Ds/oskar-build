import oskar
import numpy as np

def testSimulation():
    sky_data = np.array([
        [20.0, -30.0, 1, 0, 0, 0, 100.0e6, -0.7, 0.0, 0,   0,   0],
        [20.0, -30.5, 3, 2, 2, 0, 100.0e6, -0.7, 0.0, 600, 50,  45],
        [20.5, -30.5, 3, 0, 0, 2, 100.0e6, -0.7, 0.0, 700, 10, -10]])

    sky = oskar.Sky.from_array(sky_data, "single")

    params = {
        "simulator": {
            "use_gpus": False,
            "double_precision": False
        },
        "observation" : {
            "num_channels": 64,
            "start_frequency_hz": 100e6,
            "frequency_inc_hz": 20e6,
            "phase_centre_ra_deg": 20,
            "phase_centre_dec_deg": -30,
            "num_time_steps": 24,
            "start_time_utc": "01-01-2000 12:00:00.000",
            "length": "12:00:00.000"
        },
        "telescope": {
            "input_directory": "telescope.tm"
        },
        "interferometer": {
            "oskar_vis_filename": "result.vis",
            "channel_bandwidth_hz": 1e6,
            "time_average_sec": 10
        }
    }

    settings = oskar.SettingsTree("oskar_sim_interferometer")
    settings.from_dict(params)

    # Set the sky model and run the simulation.
    sim = oskar.Interferometer(settings=settings)
    sim.run()
    print(sim)


if __name__ == "__main__":
    print("test")
    testSimulation()
