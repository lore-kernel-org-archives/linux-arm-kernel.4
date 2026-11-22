Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978AC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=14tv2qJR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QIe4EQBq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Xi6B0mVc/yhceAu8SvxpAhfmPgktJkCsfdRhwdERps=; b=14tv2qJRFFUt5stXWSpSWeeRAm
	ZCHVut8pvqRUWoE4UNN0R0HpXcqzM4njkQozNdMEW45puygwmWdEVTzQHgFuS9VM0xiDP9LSuwpks
	8QOG/54a3WAIXdqYTyM+zwkGGJ4+uZn1bRh8Ap/i8tkzEb213o0jXkwQ3yI30jAoS0MZrPAWG9M5D
	7QSTXxcy9YHwfL9LVWgJ1je9aE+lV07YEQnMI9npTg+x7GEbsSLY4WhPRHNNx6c1FG1rC90msL9YU
	TwI9FVCssSNMUBPdOeQ/2tkO2KEbQvtc6+6Wcxbn31EczSWnhSoZqHaV+h7qUHJwq1xVPEWhrrjbn
	IJ1SHI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6bS-000000014nA-1pqF;
	Sun, 22 Nov 2026 12:23:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6bO-000000014mf-40FN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 12:23:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so21092575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 04:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795350205; x=1795955005; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Xi6B0mVc/yhceAu8SvxpAhfmPgktJkCsfdRhwdERps=;
        b=QIe4EQBqYIq6U4rhzUEXuiFA4mQUH+R8+K6s1kjJb7eYy6k/1lueMeJCcTmhBefsb2
         H275pKA4xrPnkqRL1JNCsIWsjEICRcixWqN2AKlfVx26+LOm6uchETpNDFwyWi1xcNJW
         q93dJHm/kwl8GgdYf5IzjvJ5LdKM/8q4J8xa+YPEPSQtWa0+dENgHOTvQcke58zYOg9l
         DfUzPZpKskJfl8E+TsnfLldEPapjWPkyKS1amvC/y3ORmnnGN6Gj9mD9tJ/H726PObrp
         003Vd1Gm0hNFuaFCyCMpSXeYModHR3HzDuT+RaTYq8GD15SaRU83Ni95A0nN56vcI88a
         n6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795350205; x=1795955005;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Xi6B0mVc/yhceAu8SvxpAhfmPgktJkCsfdRhwdERps=;
        b=KyG2BejAdyOLpjss50yz+Z/aX5DxS/1cbrt7nqHo2xlhPGaqCmOx8omRsH8fRqOwAr
         thUR626W9z0oZACRJlB3dvQLBCEv4ainhAKHhI1BWPFCkk4glKGl3fONbJmVXdzJnxnh
         mFVMuNQxQiufRqKxl8QwFfDhtsdw88qBO+XNb1aGkYgQr0Ydc5sYFO8fNGQueVq8zcRK
         cVwhbqC5grTz3khvSEk/iIzepJsDzuvhEXrNugAXPBWlSyV6M4gRVeZeC+g0mFOAhCGY
         e11v9TmZvgFdXyorM+pGkDLl2Z09qIjfJyduyRFbmkftYsrQ6vLNlpmqjwh8NAOqq6zO
         Wr2g==
X-Forwarded-Encrypted: i=1; AL+hErEwbrQAR30fVubzerq3AvcCucnbdKaPg+PQa3wK4bGQpGQeMMMkbDzLG4V0He/koOmjLmx5Ku89gS7ziemzLRwG@lists.infradead.org
X-Gm-Message-State: APuU4Z+xZiwoCRion+Xy6pbGc3Z883cxxNRrcBz4/b0bmvokg/Im3KMt
	kJ6vwhtTRxwL6W/P2xphYE8C/vawZgyTcfolHwagyfVZfQg2QjIK6TAjsiqyqkKNqec=
X-Gm-Gg: AZFdTZeRYGPy9fu8Pl8S6KLSjgez/vMWT8I9JwiVvMv2f6vFXA3s564ISwwgrrmSpWz
	6MEoDFwL71YRUAp9BmW2thomGKfG/ss9uDN7/OuB8Rut8I31/3vyj87XF4NzqfS+sDedIF5d0Zj
	ivyuZ7BUDEMePxvEWIQLh2xCCjs7JE4PPCgDjCsnGdwxkzg1wmtPMKJTqh7I+2m0raAZEFIBd6a
	OiFwvgH4NQPeVz4soKnTNXrkW96Qgv/X2kPHkpP1HAyk4pLwiekQCqRal8BXN74T8TPUDemGTuw
	hz1A84hwE+MUWmRtWgaNhIHFQ/Q8BPir+bWcQlUXGMqIAyeBTRVOLO5UofdDp6CJOwGN7CUNHyl
	8mxqXFtL3pJfYIIR0lw4jilgL1Xg5K2J6RpYeSpkBb8aZIT09Q+iZPEMXyHmS7IO9hpxJXoZxb8
	bMudBfZEZIsPR96LU1FObdnQ1/YyZL8ygmQYZIoD3j5LIadbgeKa/0fWfKJ30+Vr19EO9/8H0JV
	b+w9pnqikQaWviVWef2u9gBdbFUeeTTyzECqQ1yjvauo+NUg468RwtSk3DiTC5u9OSOJ+XyxTj+
	2rxcQRLtWKLSf+8UZp2PIH/0TTexpAHbqJInuA+MtQ==
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr205631345e9.21.1795350204702;
        Sun, 22 Nov 2026 04:23:24 -0800 (PST)
Received: from strix.localnet ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm16377044f8f.42.2026.11.22.04.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:23:23 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: zx279128s pinmux questions
Date: Sun, 22 Nov 2026 15:23:02 +0300
Message-ID: <XmZwLfbQR5S2t1KqnN7nKw@gmail.com>
In-Reply-To: <20261121101615.3726892-1-isasmendi.agus@gmail.com>
References: <fWpK6nqqTOKOq96a3X8SYQ@gmail.com>
 <20261121092601.1543468-1-isasmendi.agus@gmail.com>
 <20261121101615.3726892-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart25FuNFzhTPahm4mInGNM1g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_042327_025212_5CD9BF03 
X-CRM114-Status: GOOD (  22.03  )
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

--nextPart25FuNFzhTPahm4mInGNM1g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Subject: Re: zx279128s pinmux questions
Date: Sun, 22 Nov 2026 15:23:02 +0300
Message-ID: <XmZwLfbQR5S2t1KqnN7nKw@gmail.com>
In-Reply-To: <20261121101615.3726892-1-isasmendi.agus@gmail.com>
MIME-Version: 1.0

Hi,

Am Samstag, 21. November 2026, 13:16:15 Ostafrikanische Zeit schrieb Agustin 
Santiago Isasmendi:
> Hi Stefan,
> 
> A follow-up to my earlier mail, with the details behind it.  No mux
> field on the ZX279128S controls more than one pin: each pin has its
> own field, so nothing is linked together and a pinmux = <pin function>
> binding works for us too.  The fields are just not in pin order, so the
> driver needs a table of where each pin's field is.  This is what we
> have so far.

Thanks, this looks very similar to zx297520v3. I'll write the driver in the 
next days and send an RFC when I have something working for my board. Then we 
can see what changes to the infrastructure are necessary for yours.

I expect the general outline to look like this:

1) Board specific .yamls

2) A zte,zx specific, but SoC independent header that contains a generic macro 
similar to dt-bindings/pinctrl/stm32-pinfunc.h

3) board-specific macros that define the possible configurations for each pin

4) Board specific driver tables that define the register locations of each pin

5) A generic driver that binds it all together

Am Samstag, 21. November 2026, 12:26:01 Ostafrikanische Zeit schrieben Sie:
> - 0x94200000 + 0x00..0x0c hold the mux, one field per pin, 2 bits
>   where the pad has several functions and 1 bit (function or GPIO)
>   where it has one.  E.g. bits 2k+1:2k of +0x00 are GPIO k for
>   k = 0..10, and +0x08 holds the NAND/SPI-NAND pads.
> - +0x30..+0x38 have one bit per pin; clearing it makes the pin read 0,
>   so probably an input enable.
> - +0x50..+0xa4 have a 6-bit config field per pin, five per word.
>   Bits 1:0 are the pull (01 up, 10 down); I haven't decoded the rest.

My hardware is similar, although it has 3 muxes:

1) "AON" (presumably means "always on")
2) "TOP"
3) "PDCFG"

Whatever is selected in AON is connected to the pin, period. If TOP is 
enabled, it additionally connects something else - either a hardwired function 
or whatever is selected in PDCFG.

The result is that two devices can be connected to the same pin at the same 
time. To prevent them from stepping on each other's toes, it is necessary to 
set AON to select GPIO and configure the GPIO to input. This also allows 
snooping on other devices via GPIO - I used this to measure the frequencies of 
clk0, clk1 and clk2 and confirm how the clock tree works.

The reverse is possible too, on paper. E.g. both Pins 33 and 122 can select 
UART2_TXD. But in my testing neither pin is connected if I try to do that, so 
the muxes likely have some checks built into hardware.

There is of course also electrical configuration. It either has 2 bits (bias 
enable, bias direction) or 8 (bias, input enable, Schmitt trigger, drive 
strength, slew rate)

--nextPart25FuNFzhTPahm4mInGNM1g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsC3qYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoifDoP/j9nsSPZx+gE+bi4pWD1
dEzuT31eCsVb0XdZHg5afYz/j+Gd27kqYgwZOsxEgbm0KUSsJ3S77xmNUMwYEBce
MMf5EvQaw/1tvnyBOMX60U29VraO2MfL4By4iM/6arwlK2jkfonhGxk0jQSbZoCT
CXCsETFf4U8QPhDYnwYf5E2OUq/jFrsRnTNQV+vVTv8zdut3tyA/jS26ZBWgxntQ
9R1EVVImz0zQeTPtIGseLwR6gdAjNHOJM2ZA2Kcw1AMmNsKbmdn+RtMzt/9tL08K
8Xu6ILSSuaTiPr4qznDxTod4+l/wU9zA3/N4o4aPQzT1naleq/0+v8h31HFFCMZZ
AwnIaKt4nAM/rBd9Q6mkTEUnYAL9J2FBoWzuK4LJcj3VLUoa/GiIpL2/6h/XDBzb
YZv+vTMlJylXCl0IKigQEpyYScRvVOGqTmCBnqjvGVnioSiqQWw6RA+fj9AMj8lK
NgbqscYU26Rd/f46ZiNoMgQ89F24moEo2s869Cu3dZiLmqHngJrP7YiPISyzFS3y
C7AufrwLn0n0j9vue6bHJb6YSzfAutnnG2aB9hJiqjipBcTNjQg6rAqJfNViFGHn
AjCCaDzC9LNeUTUKEmVTW1beUK5SnLlyN/hOK4p1GQ4zISbtx1Dek/+v1IyyFwVm
CBTdJ09Qy7paNcdQVoKHa0YF
=G2ZB
-----END PGP SIGNATURE-----

--nextPart25FuNFzhTPahm4mInGNM1g--




