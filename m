Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF87606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VJagx0E7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dzdka0no
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U0UQuLgp7Igvb+yIMxQTKWaHOFYtN8CqBQmDEiXPqEM=; b=VJagx0E7XnphnwJXK08WSimdYF
	Ms0qzw+ZWaXBVBFhYrlVydsoSdIZEpYziyRZdhReGny9qTUxiKvLRCJuEcj3ntWWWQZ3MC4mdck3W
	fRjkkq3yxCWfNH4ScnIidhnztAlsu8u5aGWkzrETJAxHSFk79GA+EBh29VGetl/6UijOnnV1xA1SZ
	uLHok74EZlb/F0qiGimdUi43WP3qGMOvi4IIRHAPqVG81wSl6cmT3TWihWaBdoW0HwL1bhRSzRWEO
	IdHE1G0xJwwuCrZqpDCC1LaUK3yadDSgcgjDCO5ZcrcrGFB0kN3YM3pX5O9kdMUoMl7+Rfb7x+poH
	B0lQ0Vvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0mn-0000000G26W-47sr;
	Sun, 08 Nov 2026 11:10:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0ml-0000000G269-04Cs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 11:10:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so3710045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 03:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794136205; x=1794741005; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0UQuLgp7Igvb+yIMxQTKWaHOFYtN8CqBQmDEiXPqEM=;
        b=Dzdka0noz85EEQR6x4FCuouJFXHvz4SAa+nhdzMRJRhjvK1LAA7mrciAbpLVK+XTld
         FWTfpS2Djd9YddG2WuwYXs5WomvdWTI8PnENbNuRTFroHcUvtDHVAdCOoHyirfaqp1L2
         IYozu9WEDIHy0T4T6gJXKLvWvURDXXqFBnW36TFzS61GkQA66H7jlPvFZl7TKvpOKbOJ
         fD10EDLfS4dlZqtmFM5/mhZ1RkUvUNBNxyQJeFvv3bxp5V1lBzoIgNoNFnJlrLjAoh8D
         d20cJKJp0Imdazfiuup682h5E1Q+B0cYQ6vPs9oXDs1DtkxCY3p5eBmnw9jlXUk0jbud
         Lo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136205; x=1794741005;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0UQuLgp7Igvb+yIMxQTKWaHOFYtN8CqBQmDEiXPqEM=;
        b=EqU0G3X1xE9rhBIZluoy2Q21ZcO6bXekflH++n0jAujM3RppANnvCVu9aKm4ZikLba
         R65j0zz1mwAC9RSePF7nn4b1gdjcS2xvT71aMYUkd8eepQ9JGdvRILfZUyI2YbVm3qj3
         T30gitC5HlEMhU4Y+SOUNCyeuzju1pnrKC9skcfBEzI4tWB0xzzBWeEwVwgl9Zv+xFdb
         RHC1FLNQ5NtRdjkEEj9NehxUDLig4NiW0IP4JzszM1Z0FPem4CIoA/72rvyBhjgXZZeh
         7tqURNLQZs+4qD0jUxkopMAW3qtxTti3znlYmGw/6cW4ISuKcFJ2wIR959Z7rUGLyHF9
         EulQ==
X-Gm-Message-State: APuU4Z9NNDj0QPJKulxltbLjSkMaBGo9Fh9MBGmpmHUtbnJDjZ7c6T2q
	S8+l9uAYTsPT0/iFVGzUtTVKhQYJEnigeGxkW0wLVqPiG7c0KWuUQe7n
X-Gm-Gg: AYBFou2QM260aw1cCP+CQGkldBvQzrgUy0seBdIJuEH9xqU89TacA+XYxvmb2fS21vH
	eMyA9x7eLMdH7XBkGVzUrabWXtcMf4cigBZtoPq6OiDF1DT9ZlkmzfoU+uU5Th1eiixOY3eWpn2
	WxIxizohcfcJmf0MRsAA3xNA0zvBiq/FQK71yurz+rHhIQnXQdmv+eQ37gYzfQbeZRbxD66coKM
	OpQHTWo/YOnp7sJpgGJ9I2+6RHuRbg5+QzlEWKMaz8HhGkHhQuKSw6ybIPzFBBH2zdAfpeUDGdx
	He0VRVTB4dm5tr8CdxwJ1HjlR3ZeqtsT0UOyJO6KuBvyrT6ZaG58eJdSV/kMcUcVeK63cq0gSmY
	zTVBC/OONPww2LSyQDK/VGMTyoJSb0sTaycSoD6HHE7VtmgJ1TzFPQhmJHT/UYEiofpFK8vvxlL
	r0c9/kcYI6OZY8zqPb/wNqdkrUmp9e0GhYYky1PeqoGgsZU9kbl2/BnSTt+DdemDVm3TbklW+ms
	zZvpWx+wd4rndqcMQ/gciVTEjF2VTbvzAChaqO4UkFj1roIP1PbjTuMXvpiMv8sA2EuPp+rggmh
	VyuVtE65BbP+9lyVFR8JxJSrJrtIwt/tM68j6KcTOw==
X-Received: by 2002:a05:600c:310e:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4b963c70cb2mr22218085e9.18.1794136204439;
        Sun, 08 Nov 2026 03:10:04 -0800 (PST)
Received: from strix.localnet ([197.250.160.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm41904855e9.8.2026.11.08.03.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:10:03 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Sun, 08 Nov 2026 14:09:49 +0300
Message-ID: <taToYWqTRsyGXzOXNcd5Qw@gmail.com>
In-Reply-To: <20261106190828.3823287-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261106190828.3823287-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartXzSuzhomQYiB1VSjXfzNPA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_031007_101272_3A3A841B 
X-CRM114-Status: GOOD (  14.73  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--nextPartXzSuzhomQYiB1VSjXfzNPA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org
Date: Sun, 08 Nov 2026 14:09:49 +0300
Message-ID: <taToYWqTRsyGXzOXNcd5Qw@gmail.com>
In-Reply-To: <20261106190828.3823287-1-isasmendi.agus@gmail.com>
MIME-Version: 1.0

Hi Agustin,

It's good to hear from you again :-)

Am Freitag, 6. November 2026, 22:08:28 Ostafrikanische Zeit schrieben Sie:
> Hi Navid,
> 
> One more finding from testing on my H3600, more serious than the
> others: with this series as posted, the board hangs hard as soon as
> there is sustained WiFi traffic.

Navid ran into the same problem and his first submission contained a patch for 
this:

https://lore.kernel.org/linux-arm-kernel/20261010130024.177503-3-ghahramani.navid@gmail.com/#t

However, Arnd Bergmann didn't like the hack and it looks like we don't 
understand what exactly is going on, so they agreed to postpone this 
particular issue for now (see follow-up replies in the linked thread). If you 
have further ideas what ZTE got wrong in the hardware and what kind of 
workaround they use that would be helpful

Cheers,
Stefan

--nextPartXzSuzhomQYiB1VSjXfzNPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrwWH0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiXx8P/jieuSD6QbaeKBtItpPv
BqKXdlNl1Fy8V3tT70nDcIqfLLi1eed+Qm0HGcqX17WBDjXUPRC4owBLPRh2krHK
okeIzszRzdIRbu1U9KQtyHn7EE7JOv/6B+QRwoTGEj2zwxYTq/dE35tbKCBQizAW
YACVqDkg0CAHCB93PIg0A7Aq8/Pwjo+6TZ6tAWlO/38o9NH0Pm+UHk7iFNLJHlto
wxXUEVfCY5vQPPPHOWGHPbohFpiYFueJ2KD9ayHHu7XjnL/eiNU1PowJHnw3P6HY
F3/E2S3DOcUvcainN38upNePmwZs5+MNmFY1y8hqvxh2nsrbs2ntIhUkENzW9RwV
NO2E6AmAJWQiddJf55BjpSRN0wpYQeVLFX1nZTTa5G+6OzJLz2BkZTir+HQdRS4X
6/Q47BZIBzTy7Cu2Q7b+sEqcJr0oJ/hX4nB946N7wWtnrLdpxf/wy7qChjnijb8K
+1pcJ+ACFnVA+EfSoSb1hHZ1g0UOMVf/dpfzPafEOchYKSPxHankzDKwP/aEiBBK
0sN7lcN/odpNa8I8TmMUIF/gsSG5hSeSw0Ey0dujTIhfYUmmlshQE3QV4EwJ0xjK
haF9bsEeHdRFJ//Xid8yt2cxu6X0MN+NjZwuZflxg64xoOJeb8STC+5TxfNQ6gDK
v8GGtaAEmnK+ccOayXAAAaw9
=qc2j
-----END PGP SIGNATURE-----

--nextPartXzSuzhomQYiB1VSjXfzNPA--




