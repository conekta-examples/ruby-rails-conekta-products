![alt tag](https://raw.github.com/conekta/hello-conekta-ruby-rails/master/readme_files/cover.png)

# Hello Conekta Ruby on Rails

Rails 4 app which implements payment calls via conekta-ruby.

This sample are using ``.ruby-version`` and ``.ruby-gemset`` files, if you are using rb-env or rvm you can use the next steps.

1. ``git clone git@github.com:conekta/hello-conekta-ruby-rails.git hello-conekta``
2. ``cd hello-conekta``
3. ``gem install bundle``
4. ``bundle``
5. ``rake db:migrate``
6. run ``rake secret`` in your console, copy and paste the secret code to ``config/secrets.yml.example``, then put your Sandbox Secret/Public Conekta API KEY. Save without extension ``.example``, the file names looks like ``config/secrets.yml``.

Now you can run ``rails s`` and go to ``http://localhost:3000`` or if you´re using pow.cx, you need to make a symbolic link `` ln -s [route_to_project]/hello-conekta  ~/.pow/hello-conekta``, after you make the symblink to hello-conekta, you can go to your browser and write ``http://hello-conekta.dev``

To run it, install rails 4. The app should run on http://localhost:3000.

The project need some improvements, but you can test Conekta::Charge.create in Ruby on Rails, feel free to make PR.

License
-------
Developed by [Conekta](https://www.conekta.io). Available with [MIT License](LICENSE).