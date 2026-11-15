Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GC+ueZQ+;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GwUzGXw6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=; b=GC+ueZQ+r/ck+a0zE1/XPJDR8u
	W0013CKtu8gU8s8m8NrgJJSWjVfNVyf68CRngm3+qq0pTcuAH59f1T3veCg4R+riy0j6VdIVmnwpb
	WxfpvuGpYgpp4rUMf8C52j6MWgcEaNkQk8pIbh68rFmeBfZrkGM1oiFaFkwpaxlCNSPwN4dXzviKI
	uegLeeQ6LajH3izmx1NRfprcj+vATAmc0I7XNf3Eg6Sp2+XNUP5ipGLdId7HW28h+jqtwmrlVPdan
	p+AnqyMIWirVHoxLA5xNPwH/AD+4RiHkRmwPhfxTy/2bfrQ6nwXl+KQL6AVg1LEkk+PYlS2z1CBAo
	PbfKBR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScO3-000000009p0-0TZX;
	Sun, 15 Nov 2026 15:43:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScO0-000000009o4-3h7B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:43:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11973225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=GwUzGXw6+s0+Q1HAk9i4JsxMQ3U6gHPdxIt5r19IYynejirg7PjsNjXUZYXAtet4zd
         aV3gnODGChy3e2pJj7hjMx66Wx8LiekldDyxzzc5XiGQa8lcbn/MySiFw0ffT7jRdHw0
         oF+wBLKll2aaEwCaOpGAkpS4qlEppVbBwOW8nfNmt9sS+nEIdm47IFlHKThbu2lFXPXF
         Gli93YDuJRJpPo68g8e+l+dh/o7JF9Es38kqZvChVS+S5+2eFKiehJHKQvgwBV6j7VPD
         1gP7g68qvHnx00LUVnd/CcK7iNOlDhYxk66EPoghlB5JGnHmCCOnyPsq5IfFmMJFlF9r
         rLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=CBK+1K6q1dgXm2pRB13UB6G22dzmJPKLLqKDioyKF00fSchowiDM4kjXQ/qOHSfCQd
         fReXU/gQIIHOs892Xv804Guh1e/Te34QooUOJ6WVvsGwGQrUMGvimJZaJsCAZ3zopdCU
         EfAJyRILl+iI2Vl5OQx46P9JMJMV6hW5qW31DhoRrPuxhizqs6BjNnRgyShBcZo4oBek
         opKEn2AbbIpRCB58yjrQNI6owOhwybFBfLr8X3PUlOfJgPfJj2FSdck4LI8p1wQu9WnU
         s4O+PZJW390a/qPdU5rADFqfbxHGKxtogvAs9TBEi1/HdjVe4x6+pMhLa3XVXXBb5gUq
         RXOA==
X-Forwarded-Encrypted: i=1; AL+hErGvGme11yWNV+NXyvr0Dn2FZGw42cMMzWXUjdSKk+P8+tp2EOruh6k0mmF/kY1DRhDZXVo3bKCHH+5uQaelyiJO@lists.infradead.org
X-Gm-Message-State: APuU4Z/xq3m8Rs5pOoIuNkQmFxTDeD/Zfoj7mY7K93n42oJ0P0oUn122
	crPn0wK+/rr/c/fNoFc+o7xMkpE+MzCbx6y4PXHxTkPYXpOz7YmHEYQO/FedBcYlF3o=
X-Gm-Gg: AYBFou1PSFXNA/awR+Mkuj0wQWHMXHTj2S1MkWijzs6WRTV/lH3QC0JV5s9N5zZdKI6
	hQa32fpeR3lVbVhD4iY8box3jR4s2L9KXrSLoNiqznfdnbMxbHZ1aw3XP7i35tfTmvakbwcWH70
	R4GuA0Bf/9PvIUoepGEjFlwjkoyZZhw/wPl+XMiE6jzSEsdx4qr72gTh3r8Guc+GWCV/bPaMn6O
	aWY9DpYuQ1mKYhhbm8HMT5G8lHrkozTt4Oklnj0ppsJ2cX3LGpNyoLm6cu+FSK0iOom660aVOid
	CuuQRJldNFEs0iK2mPmtt8cC7n3A9C0IeL/56exS3V884X0D3sQPKL2j1k76Ol9IDK+qGDXbEoC
	N3lrwJ/7Qt3JPrd7hqxswOvhh2rnuC3RVnWqxwmYAa7frxfs5UTPkcKO2EqFEmQq2gwmKipdzeO
	z6Lrz7l3XmY7DqQWRQtUo5+mVfjrd/lguZO56vFzR3teAPaIt+18isxqM815SNrVCnSq9vSXDkw
	sKkpfw5NkGkR+5MT2e4dKUdRy7DQoe37A+YzO8nui4+XsfFP/hjqxzlaws55pZY9Br/mEFsrkv3
	JQ9n4mJWA7zSQEguaB9PQoqN90kU+hJ+FCfdKfwUefGQeinbo7/lKSvc
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
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
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_074320_937309_D1A4B467 
X-CRM114-Status: UNSURE (   9.69  )
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


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--

