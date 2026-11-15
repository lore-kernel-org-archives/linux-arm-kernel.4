Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uq3p0Tto;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y9GYloHx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=; b=uq3p0TtoslstI7eOPucl/Wf5Fe
	F6JXDWCt7WtPs630w3y4gZAmyvw7Qy5AJp7mMYwmmucdMQzFpODg7kGvlNtBntaJQOIQU9+RnMsW8
	Wwkc6pEoMoKi8oRabc2+du4TvkKczPnU4DluY7tOu4+jq88qsQFSRwhFrnlkBz61gi7x6/4i0U6T6
	+Wr1g32M23YLPmLy+hzBZv5bzy4kdE5NkckgoCw6p1K9Ok9T1s3R51mkllv6BK6A8VFJk/Y1wDY3p
	yETh5BT5SeIl+tx0ieg0P9n07vbSyhzhQP2EeFNCRzB1sW4WZ6IY88tJdU6JigUIcFYAYb2JsoNb7
	SzgkeAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScLu-000000009TG-3REj;
	Sun, 15 Nov 2026 15:41:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScLq-000000009SN-1LTl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:41:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-497614c95f0so1129766f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757264; x=1795362064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=Y9GYloHxMkVPMJfP+XWrbrQjxFppVBWkZmrhtxCzCBsGLFu5FEjn/vFL4mn1YoW/yF
         zHMMzS+jFyuZYi9MoN5Cj/zY2S7DasoJTjiONoHdJNVnTYOtw0cFLbi3yoKiHBhGG3I6
         ZRdu9Q0VZbSgj5rkdFcmQ3yA5OhuUSer4LMkodjpbzUNNVkw5VAQ3woA+RNft8SvlUAH
         7IaLKTiAouqAw0uwN2dVzz918Fi4YzZ9dpZoB6GkQCTvPa8rxomZArwwuNX87Wjj0TdQ
         1SE+jUMXiywmhHWItt5LT/9ZsDscCLVeoQDRVXx8eEh4j1atUkC1O812nM2EHjv4O4Zj
         G0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757264; x=1795362064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=KgZnC5nsMxlqnJiH3HQogY9ZWLwr74WjqhzZIUWCXqkYA3M9PKW4r92efNNp+nKtR0
         KA+7V4I0JKSkRDI7t4nuyKDkOQhziWYq4h686h3WscEWsPQWmC6flA9Og8ZxvnrqAx9I
         5ttxXZhwaw4EL2TUeBwHCgv8AOsSVs9nKEQns83VQUy+ToOokVCSlZOv0ePxoeyAPsrT
         TW+3tVKC71dj2OOq5CPB8DKu1nKHDPgNPeFVRHISb4DhwV5dUi28ddcFz//ALU/22iBX
         jWDFt5Br6oRG1cvSr/v3482sLrFL70i4R057bP8ydij9rzoCQydA2giKdnAO+H5Tmklt
         +8gQ==
X-Forwarded-Encrypted: i=1; AL+hErF4wTPHKMMBzRVi09UtoD9FaJC7BPS5uh60qrMw/7owegUOIFJ8nFDDuum99cmeDo8VA/4mnxLoPQzAKpFuk1Ef@lists.infradead.org
X-Gm-Message-State: APuU4Z+yLrt/P8+RRxdsX+hC4mYAsVgjGFPS6fu+l5aqNI9RbChW7GvM
	rrcVPYZ3Wa8jT6E4aErpkzoBOkzpNA39zP87aBPVUxN+UdL+/qElgo3EnzUje1Yt7Y8=
X-Gm-Gg: AYBFou3JFlg+w3RPM+zgAMGue75JCORmHUagCf/AvOXVpOAHTSpv9wzupYdI5BO5+Pi
	OyQEs3Ry3fx6Cjk0rkLvvdwn1hFVGPUzLf8G8z9X/x6eeYjEYjNsNrp1YjBfnuemm5vzokT+ltU
	c3XYiFrT+J0tExcdJdxkpqDdhhl2snVKV8DHkbTrGU4ux2HE9mfoBZkkYItTBySleIs5KBO3hgm
	G1I4krYnvu4qiFqUksBIbkZ3cP1mMtyRN7bCofZ93WUQfg4AVHr5xL9BrjgNHKuWZS9/lNWs69k
	ukPQNxzTPIAfFCpibmMewy+USwbtGI0GSeEY6I1Lqv9ySt41rGto7fdOQKQU7aH7iEVncFUwXF0
	1aRGOn9fnPKkpuoIkBys5E28EowjCJVOUUav1R5rZI4q1oPmJKu+liDMrKH3Di/dUFf0gGNZB6j
	gjnP+xjijr8/7dIPWPVqUhPxjisGLXcNPiG3m6Xu9i6TWjLtgSQShw6MvAEh+f8HbvG8z/WlcrQ
	twXoidWSkI/Qn2GuNPrNYEupAfWFbP0kTLPsUC40a/afvjfNbJOrVRApfcGaqMWJIY51JFqEYqz
	bT5aA1oOFZJ46wgWEQ99U4E4QD1LfYWlhM4=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr19465481f8f.4.1794757264141;
        Sun, 15 Nov 2026 07:41:04 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c888b90d4sm16462060f8f.9.2026.11.15.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:41:03 -0800 (PST)
Date: Sun, 15 Nov 2026 16:41:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
Message-ID: <avnR67LnZo4Mo0Tf@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgskattfdxvvv7hb"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_074106_379956_FD7838FC 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--fgskattfdxvvv7hb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
MIME-Version: 1.0

Hello,

On Sat, Nov 14, 2026 at 06:33:40AM +0800, Han Gao via B4 Relay wrote:
> new file mode 100644
> index 000000000000..742465076d86
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Allwinner V861 SoC pinctrl driver.
> + *
> + * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */
> +
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id with less dependencies, so please just
drop including <linux/mod_devicetable.h>.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> [...]
> +static const struct of_device_id v861_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun252i-v861-pinctrl", },
> +	{}
> +};

Please drop the comma before the closing } and add a space in the list
terminator.

Best regards
Uwe

--fgskattfdxvvv7hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50okACgkQj4D7WH0S
/k78BwgAggANSfiR3lIax5U5QxcHapAeEwjkuu5kUUd7ThVymu6geBziPkTKM9LN
kV1vp14gkKuMuThllE6yPhDE+jBai3H2dmZPRAVxRmkHkRXaCGvN2Qy6QvjG7hn+
pKrIhNm9FD3gtJcf3syW5npYiRAxG/6TkK+Gz1PXPgmg9Yj7puOzJ5ZZsZ+kBOcS
xiSHHn5ujqEIP4jnBc7Dv7UpeDH4NxdbQ6ssuWEYpdmNKvGpbP4Xi4tlxo4RAMXF
XWXJcAtussx3dylMOghSQ5VBKABwOqksAb/tX5/oaY13ScR8Lg/M3WzfjwXPwvtR
yRXJHXEAk7lxYPB9WoXGrz3bVWm0dg==
=Eo1Y
-----END PGP SIGNATURE-----

--fgskattfdxvvv7hb--

