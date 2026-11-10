Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF86606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j6+S0j6Q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gr5nohgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o8vOqPjQp+qIgT4SjBM1vuuP9NkLzsqzq4almCwh0ns=; b=j6+S0j6QPXesXG
	uDaya8sUjoccmp+gc+XO/7l+Sq4pw3CVdAmveS355ZfNrrTTQcVXl5ikbFzM6lD9X1vjPzTsH1dUz
	lJXNO0oyvDKyZJFze4b9cZco4A6phLmW7GDex4zRIyl/oAU6nntlZ/TB54kMrRBjnOPPO8j2xgNwa
	1iK53insgfCCK4gXxTSEU+YMuLJ/ax555ABz6/ANVyuIfUcK4g8ebwdRZJfXyceonWUe0hu6ZSS0o
	wmrFFpT7hEQXOmHopc40PPdqVyMEksj9oco4H3g7ufc8noK0xFRMJ/EHUdD8m/+ioZ2u3EhrU5qKh
	FQeSwxQyg79mUMHbmp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkus-00000003pxK-1QaG;
	Tue, 10 Nov 2026 12:25:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkuq-00000003pwz-2UVQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A03141187;
	Tue, 10 Nov 2026 12:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A651F008A2;
	Tue, 10 Nov 2026 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313532;
	bh=o8vOqPjQp+qIgT4SjBM1vuuP9NkLzsqzq4almCwh0ns=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Gr5nohgXHm1YYyj6tvLEZ2lSM8AwTngl7Y9YhcAEKBH+Qk95txebAZ9NtKzrDhbMu
	 /kcVhI4wBuCa61a001FzAROnBPqNtiO/ytzlzOWo7XJ5chQlrrTZ0jAur7hkGa2Dea
	 9e8VcncC+5ovHWHZPm9Udas/YhDeQJz+/Hw/DgiFOKQphYC3tCbIwtuUfnQDwnkr0A
	 NlkNf0d03csKo9TcHJmIS39u4zkv/CzH2xeQIMrUlC8N+o3OuHRReJJo3cYKVKlsnW
	 Ok7Bxat5Tx0PnCcbiQSm1rkYigOOsx53IhuLC4CVONUmhMnelBCuvRRROviPHPq5B4
	 hzmGl2iyPjB0A==
Message-ID: <69a3552e-1fca-49e9-a9c0-66963319d2a9@kernel.org>
Date: Tue, 10 Nov 2026 13:25:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 03/14] mfd: remove unused si476x driver
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek
 <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Sebastian Reichel <sre@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-4-arnd@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260909132153.1596191-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/09/2026 15:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The si476x driver was added in linux-3.9 without devicetree
> support, and has always failed the probe function in the
> absence of a si476x_platform_data definition.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For drivers/media/radio, include/media/drv-intf/si476x.h,
Documentation/admin-guide/media and include/uapi/linux/v4l2-controls.h:

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  .../admin-guide/media/radio-cardlist.rst      |    1 -
>  Documentation/admin-guide/media/si476x.rst    |  160 --
>  .../admin-guide/media/v4l-drivers.rst         |    1 -
>  drivers/media/radio/Kconfig                   |   17 -
>  drivers/media/radio/Makefile                  |    1 -
>  drivers/media/radio/radio-si476x.c            | 1523 ----------------
>  drivers/mfd/Kconfig                           |   13 -
>  drivers/mfd/Makefile                          |    3 -
>  drivers/mfd/si476x-cmd.c                      | 1543 -----------------
>  drivers/mfd/si476x-i2c.c                      |  861 ---------
>  drivers/mfd/si476x-prop.c                     |  233 ---
>  include/linux/mfd/si476x-core.h               |  532 ------
>  include/linux/mfd/si476x-platform.h           |  256 ---
>  include/linux/mfd/si476x-reports.h            |  154 --
>  include/media/drv-intf/si476x.h               |   28 -
>  include/uapi/linux/v4l2-controls.h            |    4 +-
>  sound/soc/codecs/Kconfig                      |    5 -
>  sound/soc/codecs/Makefile                     |    2 -
>  sound/soc/codecs/si476x.c                     |  263 ---
>  sound/soc/fsl/fsl-asoc-card.c                 |    8 -
>  20 files changed, 2 insertions(+), 5606 deletions(-)
>  delete mode 100644 Documentation/admin-guide/media/si476x.rst
>  delete mode 100644 drivers/media/radio/radio-si476x.c
>  delete mode 100644 drivers/mfd/si476x-cmd.c
>  delete mode 100644 drivers/mfd/si476x-i2c.c
>  delete mode 100644 drivers/mfd/si476x-prop.c
>  delete mode 100644 include/linux/mfd/si476x-core.h
>  delete mode 100644 include/linux/mfd/si476x-platform.h
>  delete mode 100644 include/linux/mfd/si476x-reports.h
>  delete mode 100644 include/media/drv-intf/si476x.h
>  delete mode 100644 sound/soc/codecs/si476x.c
> 

