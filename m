Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F55606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MPioGAeL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IU0cyVf3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=; b=MPioGAeLjCPv2a
	W5r2jaPLL+2mnMXiiNMcsCgS/Ch2bK3Q2ohnr53vNmfy+1+pfKc0Tq0ONJEtSxBPw+nfEn6QbzRN5
	aJkh0IzFSzRD7GIlpM17BQ0m3KqG6shncfDOznAEyGfdDyxO+xFpby6myOyOS19R6TwV1dX7PwAxD
	lnQvDBYObShcmNQ4DYiCv/zlCHulzLEQF1ctQ6irrMTnHBVIzFm2Fo6w+olOOTecqN6ZM46UkxP9o
	7XYWX6PDwfNieoN6NYxCdHzJ9a53CCiba1yMwdE3SD66uKKOS/RhSpR5LHNzajm2X/aqGYOlkcEhA
	nf3AxRlW+/5H3K4BiTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBGp-00000001QZM-2wV0;
	Sun, 22 Nov 2026 17:22:31 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBGn-00000001QYD-1blZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:22:31 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1386909a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 09:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=IU0cyVf3T+UTdTzNbZcbQ8a1kWgqmhig62QgtpHbmU505eoTj6dkPMKXKEjqjNW/RT
         EOM/kSprluulV2Io9v4AHYgTsEM90yKl6udUtEAAr68YnKpOzR23z1pEhdEakhYHmpuj
         N6r4P8bBAAIX960gGRzhnMjI+tmTUt91u3g7vwU5BnrDWMFl4EHsZOWi4BhT6oRMDrLX
         R1JJ6VFzgxlGExyOtzGwg+niRXPFuLAw8OoaPmXu6M38SZODEukk1sK1WPwlZxQDvzOE
         8AI1g6Ha+rRJYKLy2RMkEOQdaPFF+TmRwIeAcfb1mDOgDsYmJbpD+/rdJN1d2AIiatAZ
         Rwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=ig4qqAr6u52F4UZg0PhY3NwI1YSXcXRggL1p0QrI36A7iJbRGTtvziwWJdvnqsDzZa
         OH4mSFtvPrJ+G9RyCoQw4ZuHOtLdh9/x3eq5eFC5dv+BBrWc6jjjsgl6IOGLaHYMCEIl
         rEPtqHdErPVbBsC1EYNDIOpeMK6lJ5CL2sf3KdKuga+WPmecSk3YsOEH+jR5TLTXUHBH
         yJbmd5xnt/IfRJdhXFU/vj1yDKNPvlaCLtvT5rrj96cMUT46tDFL4/9g0mgIy+e1S31z
         vpairABvlqG0ezy0eHqYHmNWJpeAOxykmMOEUd8n9dXW6oqtqaROAJhkqr2eYU3wB4DA
         KI2g==
X-Forwarded-Encrypted: i=1; AL+hErEmEeLTZ8PCN7JNCfJ6Rpvhn+94kdF8WtLaYJ2zKwwfkBu/FJOPjRYKzskXezDBnJR6YcMGqIDsPDVZ8i8YTNbH@lists.infradead.org
X-Gm-Message-State: APuU4Z9W4cH9hQS3bHkTiQyf7EhY2EfiiO0zoNE7VO2CK5fbGlPXeMOw
	j7PAazeZ6lrMylQZP3/jRVHG8EucEIal0FgfgzcJhCICCyVq8RmJg1dw
X-Gm-Gg: AZFdTZeaweE3NcDA6mBVOCNN0b9uHLtT0V3ErzCwZaFFyp+6rRlrr80qSfyqSkpV4F7
	x41iATfOyfsTFgmnx2mauyjYmlonIR7Eig0mLj5ns70i0EgwEnHTw6H5CgRRK+xZ+NQR1nryxMK
	2JD2QRFuU0SFbDcIpmk12LvJMYqAqRoMMhXiKuPel5kJ1NBWShhmthH0SCFuL3i/zj+/2QRUZ3Q
	9woonWGdZT966NKAArqsJ9Dl++nssW7bSZfishUx9L1NOz+tt0zCZ4FtdsBsVnNy5GGPZByLO13
	FgiWmzqFjUCKXu7ToMRSifn54l0TGFXfcq3JCYxdcXJlzA/l/JzR5vvN9O4dGUxhWUw73TzeoeF
	Rq1OgrX25M5dyCon7Ix3swZY3JPTl2trYOVPZzNztmtNVNfGUqeh0w2tDkm60MfXdLdmEV+Izei
	eyTBMGn2SS84MNu8oLr/b87lzPnd1hj5WdmlAoMdwa1v9iT5NMqgGASU10NwuFOb546+ieHxcvV
	TBg+HWcQ9pACe5bCUfr/hkkFBBw05syfLjy/v1GvNkvqp8b+oogW8wlW8HHTFBxazZastyW9t6i
	udjAKWQ612ZFbZmxf7t5Lj2R3Rg8MSuo/N4EwJAico8cuJO2ZFpGici/RVbVeb18JCBmT3i2KiY
	xAaY=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_092229_424809_A11D68AE 
X-CRM114-Status: GOOD (  17.01  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)

