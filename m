Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C1606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2bny0wU/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpCzmyI+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=; b=2bny0wU/1WuncL6foe8/U7leuc
	DGbFlIwdgo8NjIOELZycMe7j1BtlcEzIdH5llR1RND8uaTLSPDuD7zyn83m8Sb9QJJnDLrI1w4vDn
	XJfvnimVg52dtMBGy/23tkbimG9UZuuloRwTMtLGwXLMD3bPP/OmxeRvnuvV0HXLars+xZ545XHnh
	viSn6rEt1L0Kt4R4/UQXJEUwXrrqA/UnGUl89FtslsPSN7HIVrQlUr/kUlGpGg22fWDBYMQRJwGoH
	YQMA7tMy0APcR6qQv/xEKwvAvcw4HFrPuXOMjqa9uAkLKTF4lQgB8XWp6LL2oFY46BCs+pSytNg+1
	bhPQfTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5E1-00000006IOc-0JpN;
	Wed, 11 Nov 2026 10:06:41 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Dx-00000006IOC-1ytH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:06:39 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1931ff67a29so4547024c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391597; x=1794996397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
        b=DpCzmyI+lfxyk9Mi86EjMuRaWmiKTwv5N7ZkiAcqmGoYu3qf3nlUEmhiccVGYx9nZO
         5yXdfo/FqJWWG5OjiSEKSiEBRCvpqr9ukmtbR4AAxSwMiornzv0hoy3nbE2u+qIJs+96
         OU0wbKK+HnBy0/PkFPqg1RqRNe7GvU82cRJPmnpj9xQr3Bg4rgIVewbNhmhmAsbBdbeC
         YkRmL4fjNhJSgdtQBSFti5oy0pgCTJZDWbO5kVMtKD2ZnaSIaLh1v2mWxiffM9Wdy+rv
         GoI6x8NYKlcF11wernmBWxOn/6Nxqjd37jGwWRUy50ghzyay/meSsv8RW8IINBjyfZlc
         rwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391597; x=1794996397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
        b=dIxCLPdkHO1i+BLy08Wyqqsz7JMA0qX8rC9OXGojmawjr40R92eI7EZSel5oZjEj9Q
         Iw1jEEwautqmky2l1CwYeZgl8BYnYg/I1m6cL7+xDSel9JVR2R4j+K766l+1WprnF0dN
         mJM73SA3WjPuQtoJSqTGIoAUE5IV7Ki6vWpfFmR+syEwgkk46ErcJ0z7WN8L4iKTLWO8
         mh9R4Dv9gFl/lMYgJ/nEQGPOHVw5rbTwNjhzgXrHgqBFGo7y7B+1h/ePEddL/7AuIYf1
         Alaie+/m/ridXQTWHpHwn2RdEPYcVrZGxIdIYZO/xABsh7tmSNj8VODAGiJGdi6hoV5y
         cqcQ==
X-Forwarded-Encrypted: i=1; AL+hErFs5HdjWsb0WAFSOFR2VJ2xl4TEek7HgNZ0o3DlwoRevxK+A+Iqa9vVRCUSp/oghcpoEFMOxAV+1Rz4yakWOkbs@lists.infradead.org
X-Gm-Message-State: APuU4Z+y6l7dZW2MjcCGKk9xGFWwH+55X+yC4Z8kherqHAQapIm2lBwu
	KTrPRwGvem+iEVnuAKS/NecBO49AVnX9V6ybOoMzCG5CORh9gILkuflS
X-Gm-Gg: AYBFou1aJgQjzbFPCe2Vhftf+jYovQL+jOOsOTGPySLO+x4JnhAzmr9BmcdvMo9nnB9
	OaFW2s8PmSAoypnJMmoChRkpKVKYgMYzPJmzHiHtAdQZsoHIyB1vlpbXB5FPAo+VPL+1i9A5q5M
	of0olV/Tb+p7fFKnv1x+xdgb59Nr6M3uTymvUdfUr53WRRI+UYKxLAy9/hs9NOcivH6/bo3V4vq
	/wkkekxYBLTHaR0NZjmXRoXpefNYmnXs6B3gBL1LyZD9ztL7hOrDUtoe4FACA+RKMtiZufawV+i
	OrKzDyW92dyjVJgdY58dYqpY5hR6xDIL1wUdEjViqlRWyUrCpNos883Kxejs1hAzq4iTx17GAzE
	DfIbnrMY6rYTftMWma6E0JQEn0E08evgpQOtxNL0x4yJnJALxRVc3b3JM6u+3OIWEMBVy4mTXGI
	Ghe7gvkR41ulIXa4JXqeQn8ao75vTPbeQvCACin6lx0iXloocjB0pitO7qTWe74RA1juQIw9Sg8
	zPhjy2cIoCMPZCKLwhmZlTDSDZMXXzQiLT41KYvCVvI3xlVWOFnBnp2uxIElwQPTmeolKC/wNHh
	0u/fRhns39OEi53izOUx0lR23TyeTQlpXJ2UyfMB58jT3whU6MPa14Nl5rs1VxCRhw5b1Zl3XXd
	BgHyM2zXTOqZxeZOWuAeVNWV1N/GDh6Ld4QBInr9+UkBR
X-Received: by 2002:a05:7022:107:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b3c024be7cmr2489625c88.3.1794391596498;
        Wed, 11 Nov 2026 02:06:36 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:36 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel-i2s: Fix clock and slot width handling
Date: Wed, 11 Nov 2026 17:06:14 +0700
Message-ID: <20261111100616.31211-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_020637_537982_85C8637C 
X-CRM114-Status: UNSURE (   8.47  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies peripheral clock handling and fixes the
I2SC_WS slot width configuration in the Atmel I2S driver.

Link v1: 
https://lore.kernel.org/all/20261111042746.14714-1-phucduc.bui@gmail.com/

Changes in v2:
 - Move the devm_request_irq() call below clock initialization and
   dev->regmap setup, as suggested by Sashiko.
 - Add a patch to fix I2SC_WS slot width configuration, based on
   the SAMA5D2 Series datasheet (Inter-IC Sound Controller).
https://ww1.microchip.com/downloads/en/DeviceDoc/DS60001476B.pdf

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
  ASoC: atmel-i2s: Fix I2SC_WS slot width configuration

 sound/soc/atmel/atmel-i2s.c | 45 +++++++++++++------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

-- 
2.43.0


