Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C792606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iFAii1xf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYUcnqeZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=; b=iFAii1xfD1JTxCRW1vuE3PTuFF
	GrQthH8NUhVpuEHX40x4Su/rVnmFELfuS2mB2neUy7deVFQ6S5h+eHgAZciSI0xopIO2/c90Bde3m
	fe3cxSqevqdipNpGuSKFqDAqmaqDbu8CjcMRa6/1TE8kTXojd7fiKwtAC5eq5WTaCKySfuqauCmPD
	jSXsLMfR+FXzk1E7CotpkDPMP1kgnWdad3tQL0ZK+tgPUSqK22eHwAbYqbKBcLy1g6VuRlHx+H1r5
	uNFqKvcQdYPuJH+5uc52scoDDV7GYCkMsQwogJ+VD5tov74IlL4My8YIZSw5KmG2UQkE+kgWQ+QOA
	whkOXCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUhs-0000000HB5I-1kee;
	Sun, 15 Nov 2026 07:31:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUho-0000000HB49-3P7O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 07:31:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-49134c8509fso2480099f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=AYUcnqeZIIKnUOdR5VJZYQvaaFRk1X4LeQYbvme+qilr4CISLX3sjakG3BkI+PzYu0
         yvNAyiVZutysYOMwrZaeCVEAlpRNHPWuF5epQ6be+Uhb5eb1NzlZTjJW8monlU6/O79P
         rv+bXkHFqFoxWw+jZzCw0fLee/u4gthtywaDfKimohdF8jkzlBLB20AYGg9q4Iql1EhR
         fJ/GBNiT5ijKx0t99/aoYvV0ZvM5ZYiQ4qvA5taZX76EX3gMpLvmpi68VosR8uabK5bY
         480fh4btH13iYwaqE4/OiGURhttGZbyN5Qk362a8NUN28YvOa4oLz6XoboYRwLo/23/W
         NLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=RuHlOhRBzpXWjGv+ChF7Qk4b+Rm6AqkdtXIbDdA1cScKR54HZ3TFMGiw2ZTJQWRbyx
         7XNyrTO9+7AcynKvtYG/sgHMij8uZg/j0kkiLGZfrtDsvyG0qejNYVb+3K0XBy+vRHom
         mgBy2zNOUyGAL2WscqN59iAYlZHbAx0PUtOI1KlcYioSN8PYw3RjpBn1/LMbFbHyIJVb
         jbPJdiudt2sRCFsqrJMKPv9qxE6kGGX6cTKG2JeYwVco23KxHK73u2ib2EdbKKbW4CvA
         Qi7QqbKt1Iu2e4I5qpnbuNXEuonVnD2KKH6VYEL+zDRwqMiUnwUKqE81cZC+R6yfp+qD
         iTaQ==
X-Forwarded-Encrypted: i=1; AL+hErGd/IUHDt3M6FExZltInOPz29MewB8O90bSpqWEVh9YOW8q1K998YeiJmU6FX6UmmNb1+Ci6RQxFEedD8XvuG5/@lists.infradead.org
X-Gm-Message-State: APuU4Z8rM6a/OABTfNPFHydcjhvd6xJq0z05SKyPAmwVDCkuT2OtagoC
	nWSjmT5S5N0FpcdMlw33pAiO3qcub4G2y4Oy5e/ek8bI2Bg5BiVBQXOu
X-Gm-Gg: AYBFou3bT760i9tlpQcYu2eW3I2U/ge+mVjHFzZWWvcKH1NAe+kBeWl0wgyFvidrCgj
	a88NDhtyNwlQ9NRW4JvGXJX1Fpi9qRRnjuHPI88ZQNtk653IZ13wDvVUXvsQN5remiJY41IUQfJ
	grgbgimAfBZSP1le5HPXas74j10cvcL5R/4dynRwZUj1wvPxq/2mWiYntgO/1BOZuQ9u6BVRvIe
	UcPtMTgsN952iXEWXTJx45WPdCIbUdcuxauPa2Bg4M/U4BbBD7P+Q3BeE2bRNyOCPqDSKF2kyvC
	0m7A7FpF22oTAMK9vj4sdJb6wX9VF81HG4EUiQK7Qzn4e1uxakBmBCvmK4WlxlnBfCr3XBX5b/I
	BfxpD+5S0X3UfYhCVs53ebuVhYPmIcJnplpnIxVun5lDslX+GSY7jLE9xKOMdXssz8ooua/m12W
	WHd5Fux5xbS57eBG9+xj+powQK1xd7Rtg2Mq9O4b6PL2Y6OxwACNbn6BXvhdIgfGi/sq28Cq20n
	CaTaOoqMrv1VTWyhveR2ojoNDraox0mm7FbJz93m46xjgC0GHvzOFmcrFitMbtTqb/tKS39pj17
	nKeP3m5pqI+ON3KKIVKb0OgGilGmsD9XAQdCnMM4p69v/jweJ9232iQIqnQlNstqOHPpeC+KF3O
	HCoJ0rQWXA0zgmFSdeI4n2aAo0IckBg1JKsoNjn4832xYs8WzEJ0mSmRNACTquRDDfl9r8YYcCZ
	0rUUnPxVgA88PsEcNMWsdFHAPii0he0FXiDBGqz2mpepbV295n7/VRM7MYXO4Y5kFfO3LANKwZQ
	RoKiYfwSAD69YkVWLmAbVRb3Q==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_233117_596993_B37C4A50 
X-CRM114-Status: GOOD (  11.70  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej



