{
  services.ollama = {
    enable = true;

    # Dirección y puerto por defecto de la API
    host = "127.0.0.1";
    port = 11434;

    # Aceleración GPU:
    # null   -> autodetecta según nixpkgs.config.{cuda,rocm}Support
    # false  -> solo CPU
    # "cuda" -> NVIDIA
    # "rocm" -> AMD
    acceleration = null;

    # Variables de entorno opcionales para el servidor
    environmentVariables = {
      # OLLAMA_LLM_LIBRARY = "cpu";
      # HIP_VISIBLE_DEVICES = "0,1";
    };
  };
}
