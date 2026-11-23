Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E82A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=beIMkiVl;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IqhY+59G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=; b=beIMkiVlSDbAd5F46qKEM3Aw9A
	wn8TeFuIdFi75WaE84hWGNtHdFCmS+aBeM/TcMaLFK6rDkQc+sYb9wUhwnQ2rFcUxpMvN1nORxmfw
	FFIAI0+BZCXGmQq2voi4AQM5OCmQNZwYK5J9uTqouIePag6wXDTe2r+9dawbbSKaZlB7z7PgY34Bd
	F47CiZK/ZBgGjToaQeHSQ1aMGM48h2/lG3JsO7XDYS3/HSvQrOcywVX3RvZE9U3t89Z+XGNgMYOg7
	H6KxAFNcQAe5NubCHNvND3m/FpKdWT/51wfH5RAI3QLdKs0kevOWfG2UnRjPybuKfZJzIYga6znF9
	McUdcgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQAo-00000002fhg-3RM1;
	Mon, 23 Nov 2026 09:17:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQAW-00000002fgB-2rk4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1380667f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425419; x=1796030219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=IqhY+59G1qhNd67Bp7xn9YjeHFKW6Q6Xi887F2JffQMv/7M7qbT3oVBTHzGlSW/L6M
         uUnj4C/AVmy4lEf1OkWsE8dUHdWRQvhHsqgobYlB/S/MOF6oFLzVBAUjI0fkUS/GghCE
         juDz9sHswdUEbHXKydFkmxpn8IAtlANatm0asuUqLKzPZBIAblbOqRo1SAXsegCXmtiM
         aDHmDi+8rwJ7SM/fW92vGHB0WeyMgI2Qlh/0GBhm3h1Q0IREiMX48yXSnr23v+sJeA5W
         s+F9SaBXLRuqm2RVv2pq8lJykvmE/aGhK14gHWvaVqAK0W9R+FsdMerQyU75sBvbCnob
         +ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425419; x=1796030219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=cV9HlPvk0hIXVyfz92sfyS9i8dv9gsrnFaVhSHe8Y5pA5j4pGUKU0JeX0ETiAwnHhQ
         4trpOh+4IxOj6kiYac6A4Udva3GLw3ZpEIpOQlDC5v5CxBCiN+bxALCd3SsyGydRhbLM
         m384xEkRj+5XHLava6ZDc5VbN1nkJzrerYla4vyWFHEN/dsHn/YXOXhXXZy+31PXSzv2
         F8bYzo30df/lgjsze+ehl67TZRKISe5km1jNeGBfEdfk2VBVyZcKehtQmY3Yt9k9Zvfv
         FR3muW3846/JuCvINLeFz7w1iKPQ+L8ohZ+0++A8ZdJsF6aqk8qXxYkINM9jkD4Gtkxa
         JOCg==
X-Gm-Message-State: APuU4Z+gbFGfOWFdVoVocW6ylAm57QLvae5fWmqnE/yynrui23E5Aq8X
	obOPDZOnDDoPE9S7zH8B2JPJdVzqOm51oX5TaQHwja9EPgD0NJl37DrzNmc5AnnRS60=
X-Gm-Gg: AZFdTZfFlgqL3ohRCrsooA+r12RG1Wbi27n1/lAb2++a79agvpXtv92mCBO2Yyad116
	LHc0N6ZVwNqGk0f8Uz2DBRC3tZuJzOpgCEiNxzCxc28i8McFUnZfmvjAYuilvYrwlNi568DhvvW
	CThx7DCVEhuZsRaxYiB/nI4kbn1BNTUBV91M9OEA6Zfq2Z37z0Uhli+52lE+6moIIh2lyVqlyJt
	53CPAlHqi7MSKW7fNKUb86bQ16m4Vv02qHFXtH1g5JbHIoRms1EMK67wLmRULC7z962+miY5UuD
	K9ZQPifERxBhbMX4x5CZzgJVcJ4Ljw6fdNddcMQgYs1bt4j3AfFfKuqFAPd1UD/kOWafX4gud7Y
	eNviadolKZleBEv5z0T8mhVcFysl9wdJXkaB/B5EMZGRtM2HxZ0I6A+cUoZriZJGhUBJbWalzEL
	zyd4fxsHCEB8tp7cv4+4PPkhYikpaCEQA1kVa8lwD6Tg1T2QAIBzz3n1YotA5VEz8GVsu7DAlzN
	QC/OGbEIXmm5Sb2w2BxOG8GHDOkrCL1nG9HLpDmox+MHfHAzHtfPIX8PZmcQFIhYFySMtVYdWrF
	B+BAT8NzOBKfBIzmlFMCqNZ3S1IGhStMRUZ68t0lhqYZ9HbbDwd6O9djgVZUrluCaT/k6RCfmmc
	t5yJ563tnnCXFWmlVEJAHZL4WQwTfGbiWYJJKfw==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr20062459f8f.28.1795425418389;
        Mon, 23 Nov 2026 01:16:58 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61e8sm22313933f8f.11.2026.11.23.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:16:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:16:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
Message-ID: <awQEP9bHA0RPfRUA@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4xfpqjjox3khpoi"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011714_381733_1E5BFD19 
X-CRM114-Status: GOOD (  15.14  )
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


--o4xfpqjjox3khpoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touchscreen/at550-ts.c
> new file mode 100644
> index 000000000..89c2d2701
> --- /dev/null
> +++ b/drivers/input/touchscreen/at550-ts.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 draft. */
> +#include <linux/bits.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--o4xfpqjjox3khpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBIYACgkQj4D7WH0S
/k6Mogf+I4t6gj7ob8tkta5kHm+YP96+f6rsROw+nYQ5NXBDBTwdaHgtuxTw/3u3
9TSFi59BI6mt1CJkV2ldOhel8Do0lFyFlVyx1+tlaLGNAjrt3f8m2IWJcvQU4hQK
qCxr790Ac2+n+6M13QHVHO8E7+V5Kxu109uuNUNUWIsrjawNdIUx+lqOywM9o/JT
s7dUkwPF41vgxb8gPn3Hr9uAImmkTspc70TUfxqNtGVNmQlizkBCtSCoABv5QCdW
mXZx4sl+NJUJpqZ/jj0ehbdZ1DT8xVBRF1ZDrDU0AdqO6EAWVEnOx3tb5+7JsaKI
HSj3Bm7869/tgf+jXQ3QF1Uu7I1vmA==
=UpFb
-----END PGP SIGNATURE-----

--o4xfpqjjox3khpoi--

