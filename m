Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8450F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lnRdR5Py;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W1NGAgHz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=; b=lnRdR5PyFWb0CMie53NFyA8fc0
	1g7XuAvSJf2GS5EMq/l6vp7qmjugzrguyII0DadwhD4wdGRyJ7Ye/W45Skt9R/63ZIHjoHxAVuR9v
	CDH4k5qUyDdCJ5lnZXLqeizgc7YvY5K533yoz33VYXzsWKu3kVCIsHaAuMSrXJkyzWmbE7Y0Csh4Y
	DRQ/nIqJDx59bB0S1rPS+NF8pPWAQ/EHX2pK/eAlZqkUXpq204tcVHzUJMyFyEWiE52/AYf/hLZQ7
	uR+3H/0PJ2qHfkgj1Gxxqo8plJTC0xhxz1tAd3gzoF5JQ4wOfvpg9hhQxXZJfmsgsh9kYH+Z60vtl
	dwYTzU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDO4-00000000Vxd-2LfV;
	Sat, 28 Nov 2026 08:02:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDO1-00000000Vx3-0pKn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 08:02:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso85154995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852939; x=1796457739; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=W1NGAgHzwd127jM/hJ020ZSM5fIf3xsz8KmeEoUe635/vcc2uEkG+TTUHpx4cJYYjx
         tiT2kero3B02lOAraIQN7TBdyHGYLJGOudwT53FdUEWSCu6tDU0AexuwGEYtaWeNNDb/
         ayUmucI7sOT4oQKKeZpwO+Kj2uasBPUC4lucu32xD9ZmHZCawroZ6b0nrRKnL/hgYIey
         vN6DObnmisOs9YXS66T1mKyp5QtwTjnz7CE57Ymx3+3yWusH7z+GBrTsWhijWAB3E7ER
         LvHPe313Nh8uamJDvF9LhYykqh9vHcoM7A4WH5vPZb//QyxdloQZmb8f6qXJCcMxo79p
         uppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852939; x=1796457739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=RNSZUSCrN1PpWpzBRcGxLHOcq1d7fmBbkFYwAdc1Ezjh/cLyBbHnBZ8qFE/IcEetGJ
         3F2Fz/TJf5s5k27rYleRuaXEAyW6r/uTWT9rEYrca5jjIw+aOkAF7PkPwhiCxILPGuDA
         hQ/uDoiyg9leox7iEisLrwsQV0EabOXBQCXwavbTtTFsB7HJkz/rTKE0uZ03jKlIf4tT
         p1nvKm0PL2FWFhZ3SDgg9rv13jogjGRe4pHc5CIYsVmuXLsVgWIUu8IfWHS/8QRy6PcO
         VLi6NJMCW/6QO/RF39yGMXa7wBwkmjXKWSLp8LQClyeZc6/Iq4/m9ZqpIy8ShXOmCXv/
         CrSA==
X-Forwarded-Encrypted: i=1; AL+hErFfAIC4NxmKaRdO4HmcHUy8RGGPLa0489YKjHmo2aA3yeMvlgm0GzOy4sbADmhbROsQlmadX3e9icb7R+oWPVsk@lists.infradead.org
X-Gm-Message-State: APuU4Z+lCtI7PUJEXxM+QkwpvsQCDZJ2EZW3RZiDbJWntnDqFPZQGDvO
	Vkxjo3iC44aR8l5BXgi0YLZVH09zMfGvf9EDY2lZUHlMuYSjErrsHXCl61CeSzNXIn4=
X-Gm-Gg: AZFdTZfpUIu1g3xWjJYYEnvJY8Wtm+3G3rgox5HVLPhPPi3hr9wmn9flD3qcRd0HMQU
	FCqEpJJhRrsu6fjXBqtoWAOK14ryNUYOGvpYplAnme08zgKBYHnyUthJo4WUupUplZHCBk764XT
	iFm1K4FjH7wrnUvvO3jGfjcCEka/3sdRsX7eH5u0v+VHrBcyv1b6KezRFCFm8JvXOISj8LRjd0v
	cAPDT0wNR8emRAVohfZWDCmfshfHdCEv0VbsdVUquZ7cpr3o/Pf3dCEaye+DItC5Xorhc0sknIw
	DaeDwM7F8YGduevXmHONhjwpxKi/Vld9Cin+yMVQEWWuXmZAeu15xw0dA5txDIHTJnTQMmzM3so
	3yejqkdZGu7TcWi5thqcgNO6cMjzaGZtX4y9BpJ2+2aJjZJtF7ZLDFsKbRGslnk29SpF5Wdtz2M
	MpumirQrv9uoePNW+MMc9+2ZcqKVGAIIOBwzyMyXGC0W4HlaKGTv95IWzzJBCF6IKMIoWnuWIM0
	FvB0zdVvJEd4En+2qlhRhlyYHq8WpiR3tiaxwTy9sxT+E+RBQeIvUf0QA/NrosSLu50CyJV3ynl
	MX+zPdT1Snuii5oajP5fFVUUITfPrbM8tgEqdBOIM7BQhYhL1FvRHRxRJj3+YZY8WXnm+O0Gkfw
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr505581765e9.9.1795852938637;
        Sat, 28 Nov 2026 00:02:18 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm59330195f8f.14.2026.11.28.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:02:17 -0800 (PST)
Date: Sat, 28 Nov 2026 09:02:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
Message-ID: <awqKD6EufgpjsjP8@monoceros>
References: <20261127073231.1776847-1-alastair@d-silva.org>
 <20261127073231.1776847-7-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xgu3d2pgo3fouvi"
Content-Disposition: inline
In-Reply-To: <20261127073231.1776847-7-alastair@d-silva.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_000221_249499_1E69F780 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--6xgu3d2pgo3fouvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 06:32:26PM +1100, Alastair D'Silva wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> provides of_device_id already without the
unneeded build dependencies that <linux/mod_devicetable.h> comes with.
So please drop <linux/mod_devicetable.h>.

There is no need to Cc: me for the next revisions of your series.

Best regards
Uwe

--6xgu3d2pgo3fouvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKioUACgkQj4D7WH0S
/k7jYAf/QI/UwQ7qh2BbAqLJFatOOEv5i4Gi+vBVMqy7v16wMvrk3u7U4/ECqS/O
C2/R+NZfyAK6CTe/5t37K/v9LeyvsEN4IbMSK3b5rwXFErl5KgfUZIBdgbD/1BJJ
UP2X0g6ABsQZ5fNkNJXk8nerljU4Pxf7OUuWsz42+HHHKiq9AcZwAZgrS/TttgCN
xeKamMt2XFYPMdjOhAhO57r/l3qPChmlWbT2bDdzM4i9nTyLBXrDRghnJWItoaN4
puwi4x03yymrmDrp7IH2TYfNTOy/Lcc0OcjvpqxxhIG18CeOOMBMdMXQofE0HdQ6
Htyr2kbi6xiqECUEVFTnuPE7uy+hvw==
=iKhd
-----END PGP SIGNATURE-----

--6xgu3d2pgo3fouvi--

