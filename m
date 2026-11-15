Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7F6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oD2uA6W3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0V+/ezRK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=; b=oD2uA6W3W/goUZ1UMJYQpIiNfd
	fXEKchBFH1Sd9x/p7FS1DhQqF7YZPBCSVk9esnHinM1l2qgDIdwS/WACLNMF8jSKAK+jJh/juSD8a
	r/4tbhWy+9MO+7IDCmHgR/TnY4rryZc8vqKySsmSabkgWcPEj0XKxvdyEZb7OUWAtPCAYz1od0x1J
	72tcj8LUZLOLZlwuxv9iU5ZOnIe2ybdjUuPZNHuvRpqS/0Vb2Ushq1ljTRTwu5sIRzD1Jqkoiq4Sg
	7OG2Hszd9vv1uU5/x/cls/n0FxchtR8TA6Tl7Txbp1nor/0fadPO79x00cRglJDP6vaMq3Z1CY390
	lnNu9w5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUie-0000000HBHl-3smp;
	Sun, 15 Nov 2026 07:32:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUic-0000000HBGr-1nz3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 07:32:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so3860655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=0V+/ezRK0R9dnVZbpqllL92zne1rqxdUKHsV/hvCGjRC94mL3X7oNlOyI8vIj6tyv3
         24iYsn3ytiJ5ma3Ngk2a6fPttLSTeP/WcMJHuS3eTVPD9AxSx/zB9/uGOltieuX/QO3k
         UtJ04gHRl4LPCM1+dbvihs6CUZKrr9hGmRlsv/Co3HrCX2HkXJgNxQ0XyPPoFMxa/rdM
         QkgHa7Mr6lfYRtzq5JAHVYeS1HVtx6IXGW9cPZFkurR8OkcCL8H9jqCKvlkMtEC/wQuV
         /wb88R4jMxUSqZFodPkiHufy8n96zh1UkRsGweJiLKnU/KHkc3sp4LOESR3OLvlxxUIK
         RA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=R+/+rYO3Mtmejlhz03+jE20RqNRU0YUsDhx6W4ubKIsd9ykJN3e6wRs+7TxxqsABbT
         dcCFF/QkSYeQczS5xkq1t5Z/tCFdRUnAoJ9QcyMOEu25cUB0eSdXORUGjjSKywZNs6Nf
         nrMZNeSFWpRjeFrVqYtHnVw0Jzm+67L9FFQ6dD01JqInIOcV/77aNW77YwujZb4xRGGO
         YTuYf+CgY+witUtpFXT9C9t3yrgFvjp+sGyzdCBjmkKPjaK+KlbOlX6oFLUnG4vBL04W
         SLaY1A8nMviG9USprmbuotv1U0OU5XETk16jS9xvU1e9bVN0BM3T4T3jBA8xOQEnF8k4
         idmg==
X-Forwarded-Encrypted: i=1; AL+hErHs7zj0NIDioC2uxm5QAQd5B2KjYFSo+hzm2GziBK2bHo/RWfbEURyGBkz/pbfDfBdzGsKoJMu7s0VsDt9a4tfb@lists.infradead.org
X-Gm-Message-State: APuU4Z+dzTTwbAyUDJXtO0UUT17Cq54qbJ6RnbzcpgB2/wtNI+0mt4YY
	zSL/sOtnvD3Ft4k+cU6BXtf4bN/r4dj+kI9rFfLvrVKMObTnnoikmoJY
X-Gm-Gg: AYBFou0HVNAH8/mVBDc9HzhdG0RguOLCMwHaaXFKv/Sdzd98EEyaYC34g6fwXIkbCc9
	3GBBQVHWvVx9p/fER0c7JuoOPc88lymXiCGGXq2SLkAxTU/q1XXh8TMSlmy9X+45Ux0Njns/sNN
	r80DJ7spwokLqGOiaxTfVCnbYlYQAayT+oKf2Dj7TVuffAx0wAZDpNVRpxlNnvhFLhFj9vf/ZQo
	ZchjilKWt4LpvD6fkKoEQOmzneTcBed2wpM+dkFUnoUSPbk7qImTOfVmZENopjpxvkhrlm8XFdv
	MzaZNVCRhO/21XGtpcPihNu9HmfpjG1YNWf4soziDh/kN7n4it0OiSjaVm8YKvY0JJITAqhKE22
	/5GiuURBWpqwD/nCKnOdK+WDLbvW4ZPL8ENWgjFabJR0Slti9tt2Yarb18ZLkbWmH0uVuShwblb
	98xsxJnSTbZ/UesUPdnEpDXTYE/1cQTl8wmmSGCT/IoAAeZWjKUfMtFZH4CVzytdTgG0s9KbdY6
	/1zthf+ngCf9IjSW5akDhn/HM3xTXttU5pkbSX+pcUwYoB2Sv7P1HlELs5DAykzZ61DRtOuBpJx
	+P+P/k/gqIcXZiQFQ2VK5W/LS/Ze7SXp92U2A4R+Cf87h4libSwak2axheKmW9IvRHe/loVdp3r
	s0hBG6/7Pro0aObxWN/iVtgaPeRAFoSH2Eg2a3fReZt8+0x7TEMs3HC7TYb8ONkEaFzMJYT/Wip
	i5UUUm7PkCTtzwY3jlc96sis0UJHHuspICEArzKNhIBCW4e0iJzRUfxeGXqyDQF3FJHzPl+KHuc
	XnYuqC/jBhEWLY8M0eDMhi+zZCPMBostO3b+6t+1u55eS8=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_233206_491689_CB05D6F0 
X-CRM114-Status: GOOD (  16.55  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20





