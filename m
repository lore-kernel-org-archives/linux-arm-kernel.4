Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ze+qefnn;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tcSY8gbI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=; b=ze+qefnn0HY6iI
	mpRntIzjSdp1WYE4hFchPiyOvVQxVKELTpxstqfm5nVIEpvVpyEzf2gmWGibL2+wpb8jM4DEdnSB0
	ZaIY+/lMevskdOk3DMMr7YGFin7yrnKBhpmLLC1vePFaIDSeNm9UEDe5NEUW3pt3OEAN4vUxKCwUc
	KLX4ad8u5myS5DKLTsOauuzv7XcGJTENX2tgN90HgiLCUdqhI5GRNzGr85EWI2jifcQDNKo42Cs3X
	sRJZwCnHaQSfRnf5BXaTwEDQ7gkxo1Dw7vhbNW5In3V3drks7jlAeiiPCRUBYkqAOAAjds8LmCoK1
	VNXGVBKShbVQUJve6xtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyro-0000000EalZ-1vaQ;
	Fri, 13 Nov 2026 21:31:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrg-0000000Eahc-2z8e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:31:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-49d64a88222so421020f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605479; x=1795210279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
        b=tcSY8gbIUXmp+ektmijJaxcjknkfBk5lgVnTKrMkdnKc71xM2wgwGVPhVaMJiepcvM
         +vhjEiSdwU0penFXIBclxz1OzzaEDfCfsaLCVvSUp3Xak4ddBjgyO50cN04EV2fjfvkk
         t4d+fGu6pTTrkECBKatitPPj/BcBKrlzcdzYQbW+WU7nN8/GlhCMsroxdCXxAwKX2nU7
         k3U9qdd90lERlH/9oTT1lq8WXQ9i72GwyZnk8nnU+cuYF7NlkSj+M0taYeMy7pwh2uyH
         CNg+fV+IA82j5x84MyaJ+QQY/eU187nRpQ19ErbkibieaclqBY3Xd8eCYC3/9avcOZ81
         8XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605479; x=1795210279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
        b=eLyHBfFpNkcHarD1ZAuNg+oeLSg/kThpDnTessOxMTt009ILirt93bZqnNLvxpYsuW
         i0vw8rR3o2L/6h7BQbYvgazLeMOE7owzqPnecZy/hXLrj0jKS8yowGeJe617lvopYGNM
         2ztEzcIP87aX/rwxtDoHQstpfojm6mBhOGpAv4oeAyGV8zi6SsCrx66CE01mJKVrz08c
         wcy/jvYKfSAugAyOyFEVRZCrAB2D1mYQXNr+GhQtJDTw+gXf0/jA1Fwp4jcPqB3Wkwq5
         PZUZnGTTcI+tvAL8twMNFkAHISnWLd5BxtZ+3gqCAh/fJ7XiK4sXQzJ09GHY+zsgt5/o
         JYqw==
X-Forwarded-Encrypted: i=1; AL+hErFOEuqdksI9ele2F4oYhyHV73ScwUupUIpFLAqF54mYSj+w7QajLnGiXdPu0wP9QOeZtdJovhg7CQFMzhzn8siH@lists.infradead.org
X-Gm-Message-State: APuU4Z/r6QdmrazLKGZeKORfGFBL0xItAEwg+xMxOD7uLGir1xotIsvc
	3HYumg0khsG/DC1IPsPUlKm6Gk3VPyTJGPaNxVfloZwdKLr8HqmZn1//EMbZG61OMUk=
X-Gm-Gg: AYBFou2t5QAC3Tkzmz/jQ+7fgMiUkwEi4jJz682WeW4ddvmsjXOwJ4m54jbDgqYUTgl
	/kWc1VG1Qgdp3Y848FvuNW40Z//sfXF1zVBR00arTvA9Hqfy/D4YxqlfOsdHcaR/Vvblcc+tcA8
	OUJggsPGBKpf+gmTgnkxpSa1XbxalmgPyVuwv5TuQ/mmi9RfpyA5Hq/+6G6wBAIckoCClSGKWW1
	l0bRsO+cMQInmvmw6UFxpgC7YTqV+D1s+/Xvr1A8YBjg9yVjxJTEHvnTuj60YEUS+n/IrBdaOyl
	I7gx4jsyWz6HZ0ygYURcrjyHc8Ee2IFdWQUJ7nWEcICYjdXZSNQ0VUoh2L4MrLMYe2q9WIj8V2f
	gv/YzTqstwj3HZJQ4Q7qvHEOWfN5mExBYM9qEkf/S/2PdbrH8Z7z3z3GK/XomY5eKaRyYgqmZfa
	uAkZiW99NG+7O6AAnArsgP4BgTCNGErs53s5/t109ODg3W8XKs9m8TehqiDjgn0UbKcZWyQ6LDt
	uK9H3yyBklygsImgCOxLLlFfYpq7TuB8474KpCMkBFYlj95HY83x9ZpYAMxBBDV6Ez5PK4/Dw3b
	hxXnO17WPDCLQBFi8t/c3O3CShuEOFS9ntiUpk5KPWu60oSfthyv4PGbPN3Vv8N8JwfDVqPCo33
	NWHx8NLqQwTTjI+v553NNBkI2ig==
X-Received: by 2002:a05:6000:4305:b0:49b:d8e6:1723 with SMTP id ffacd0b85a97d-49c6d452d42mr9891966f8f.2.1794605478667;
        Fri, 13 Nov 2026 13:31:18 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:18 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:50 +0100
Subject: [PATCH v3 4/4] ARM: OMAP2+: ti81xx: use non-scalable voltage
 domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=1792;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=IKFwMoPwqeJrJOd6paqyhsFrEgkIZs2drKUuLxdD8no=;
 b=AERHNgcVKZvhpwIQt1j4A6/AX353m/5rBEbtNJaMMfUtPJAmy0ZnFJTKThqFJVvq3htmRF3v/
 p2RyPKtI4iJBfzcDoXyR3witwvXGXrcp/sEgpjcxpBju2m8aSdYnfkN
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_133120_779295_5795C854 
X-CRM114-Status: GOOD (  14.38  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
domains are marked scalable and reference OMAP3 Voltage Controller and
Voltage Processor instances, which do not exist on DM814x/DM816x, and
no PMIC data is registered for these SoCs either.

As a result, omap_voltage_late_init() tries to set them up on every
boot and bails out early with:

  omap_voltage_late_init: Could not get sys clk.

Adding a "sys_ck" clock alias would only push the failure further into
omap_vc_init_channel() and omap_vp_init(), which then complain about
missing PMIC data.

TI81xx has no voltage scaling support in mainline, so, as done for
AM35xx in commit ddf536d0d7e1 ("ARM: OMAP: AM3517/3505: fix crash on
boot due to incorrect voltagedomain data"), register the non-scalable
voltage domains instead. They still provide the "mpu_iva", "core" and
"wkup" domains needed by the powerdomain data, and
omap_voltage_late_init() now skips them.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/voltagedomains3xxx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/voltagedomains3xxx_data.c b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
index e98a3f289c27..478f5eb2a17f 100644
--- a/arch/arm/mach-omap2/voltagedomains3xxx_data.c
+++ b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
@@ -119,7 +119,7 @@ void __init omap3xxx_voltagedomains_init(void)
 	omap3_voltdm_mpu.vc_param = &omap3_mpu_vc_data;
 	omap3_voltdm_core.vc_param = &omap3_core_vc_data;
 
-	if (soc_is_am35xx())
+	if (soc_is_am35xx() || soc_is_ti81xx())
 		voltdms = voltagedomains_am35xx;
 	else
 		voltdms = voltagedomains_omap3;

-- 
2.56.1


