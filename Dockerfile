# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/17 14:52:43 by sbensarg          #+#    #+#              #
#    Updated: 2020/03/09 16:23:06 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
COPY . .
RUN /bin/bash /srcs/install.sh
EXPOSE 443
EXPOSE 80
CMD /bin/bash /root/start.sh && tail -f /dev/null
