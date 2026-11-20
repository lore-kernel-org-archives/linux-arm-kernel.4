Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BE8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hxw3mWIb;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Xgf78nHB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=; b=Hxw3mWIbx/JecY
	AJwf9RCxXJtFnQsnAII+CqpeONMtr/4reteQpInTR+FFEvc6b9Sm5ZHXBfqM8HnlQxXWED9DuNyFz
	ZdLmmqO3naZ6n+5lJdrRcFWjM+faQ616vszGXCUxoLhHwej/e6oZIPzfPGiy9lKD5VJfSAZ/WOn4/
	m/WQpUvax4mklojpgiijTSmKZP9sIcyq4/UpgNqMEe9PyxbXeALN5qRv1h6YZY1Pm10MO2nkps7LB
	Z9+B1g8t8We6h5xk5cHmk8mUhviVO42JrNzlqbTPsxkgwYJO0saz6ZQa6EVTekW6Bm0cUnP/isUEF
	mtkCWojkna+oQHQFz66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNI-0000000FXoS-1aVv;
	Fri, 20 Nov 2026 16:22:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURND-0000000FXlu-1nAy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:22:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so665374f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191721; x=1795796521; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=Xgf78nHBDXFZd3H/Z0Xz4uITjzk2iMbQtd3vVZ5Q46VH56DQUeWn0NmJsd4KAlgQRP
         mtX08BC8bVHsHvWf/3DOdFGbNhlqftO9ivC7nImZpIs7ZD6hr6/KfrdWA1+4KcDfT9Eo
         PQPdDiW+vRMm1CtvM3MMLUqKEwTJEj0YLN/f5JhgixHxye0ZJBVI2diChXwmWvnKjWwT
         mRAiqJCWCGW35Bp8xoYprFh0FrurUllxyiHJ+ZOvnZ/Q6oIt+A5Q9Tjh4pGuOM1FRerZ
         YmW9svmQl2Rqqjlm2cnZlJbMt7DnoDJctHXUNbN7eE2BRqKAKVpaEF7jiNCYjJfQgnOK
         8cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191721; x=1795796521;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=uXQGHuHUPS8vXSys7SLYiol242wIh7XzSqjoRl30OSu5lnUt7KmcxX/jbLP7vEmEaR
         4ud6st3qGrOSWcUffhuh+XnJ+KSXou6QnplV+Vd4ZKRnu5W8c66C+h9+hWZ3qK6WbGL6
         Wx4ZyzUHziuHasSUBFn6+nrac1dr0ZV1B5COJ+Mjz7iNqxgi33iZkktML3YkNF0BFsi+
         ot2///8lcLk9RIIT15Phayl5yR4ed/WUA45o38yQTlHo8EPwF16XQLdDhW3M8+ENgpiR
         qWt36kqmCxHMXG7YpqKqC6Om7fCeeOf/AwZekVkLStWTSjGZZywPT/a3Ib2w076WNDeh
         762g==
X-Forwarded-Encrypted: i=1; AL+hErE99aTsfvg5NJCk8eRGYRbJwUSYolg2qSRTsu8iKdVIiWSpN+qK/lhWSKmyoOnAMrQphnZJa8gmpBUwuVT8hR6B@lists.infradead.org
X-Gm-Message-State: APuU4Z8P5+I/+qrJP6DYdQEhoAiripKM6H/LUlAwgxsyQ6sm0xM3T0p3
	B9ML5Isj6WMB0t1OnOC1eX1YC/t70djzvrc5DCVhS3Vtzqv05KgpQZTLx/whIR4crt4=
X-Gm-Gg: AYBFou3QU7doM+TPKTpdYolN+Fl4qrIpP0siN6aPE2I9sY6V1yWA3DJDD4JpzF1XbU/
	04FxLi438kixfvrM6LTVkxyQpYr8DNWhEUVJywGYuyo8cP3HfGbU7EP2UP6l0pJPviLnspRIrzH
	WWwGsMR4q8QRQevByvMsyf9FYeACc1yaqFjI4ZAGI2F6r2MGa4QK9m+mRCqBLOWAKnjQMfLQiNp
	Ps3OlNH3wz7K/18rhRR0xVOw4TAAkChJLRNIuSLvHDGnEhhWOWQuCaqZul/ZUN36gi4QiiuNuLC
	7FNCTVaDhvQPH1wKq9rLtWKNGyyZb1elN+RXUKt0Bl1CzcO6liVHXiOxYKihi9CrkBcFi6Zmnql
	hLGrfDvupcfCxAMc0yyzE4aknhCR+56DI8n6vhiOr+gYCnQ2ZeP03byIRg2PWnucp2KbVN4W4IR
	Z8KrhoQdIYnHF8ze9vypRjJmIfuJ7eqayDfA0NdiuPd9oBfqhT4EG4XJKFcXhUQufACMtM3czbD
	3d9sGklXFMfP4wM56g3MDFjj2CVmc7FbweaBfyXEzjK+cSLmCKTi8LsMJv3F+zAE3pguNUIAKVY
	cV3s0hhwWKZHWwGrnCeah6bL/Dksf3x3ONFSh6N1HIMx1WUp
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr77585875e9.25.1795191721065;
        Fri, 20 Nov 2026 08:22:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm129338075e9.15.2026.11.20.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v12 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.6006858658982158181.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=da1CAgmUNSJ5Vw/XW6Lz4OSgqJ+yn+Z+QoMk5bui0gM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxctdWw95f775+kf6Kd3uhXaOSe5//1wwaWVeY9QYX
 yM9mbu/o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOxMGf4nyRy6+VEnRlFq7fI
 GagKJv1//7Hkw7/YmsPPe/Y99eOVz2NkuJ8445EhV1vDy2cFLl7ntuvVZT55xxi3U6SLM/uNTEA
 fBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_082203_487271_B184082C 
X-CRM114-Status: GOOD (  19.11  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but at this stage it does not work with the current
> clock driver.
> 
> The clock controller registers its muxes with .fw_name parent data,
> which requires every internal clock name to be declared in the DT. As
> the DT does not declare them, all parent lookups fail: muxes end up
> registered as root clocks and most peripherals read a zero rate.
> 
> This conversion exposed a first issue with the WDT/WWDT parents which
> were actually missing in the clock driver. I am not using these clocks
> myself but it is worth fixing.
> 
> The second round of reviews raised another problem with the
> crystals. HXT and LXT are external crystal oscillators wired on the
> board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
> whereas LXT was not. The series now also takes the two crystal inputs
> from the DT: they get documented in the bindings, described in the
> boards and looked up by the driver (with a fallback for backward
> compatibility).
> 
> Finally, I was still unsatisfied by the clock tree because there were
> too many root clocks. Many "gates" were wrongly set aside from the
> downstream clocks they would gate, and SYSPLL was simply not parented at
> all (?).
> 
> The clock tree now looks much more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Looks good overall. just 2 tiny nitpick and we are good.

-- 
Jerome


