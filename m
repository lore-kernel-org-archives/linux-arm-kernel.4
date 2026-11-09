Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C32606EE8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ATh3+8v3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1GhxGlQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=; b=ATh3+8v3U8JLV9
	ySRkTJtHd1L8TaP2BJpQRjpb4RfN9I0ynhZzEldyOHxjlTEPZn/hsQUid6yee8NgXOrYaI2anKaWg
	MmFwNaFR0g3O8r5+y9larrC+5LLXArUEhwVBlvm5SNr5k46RxjnTsWiUDXZD1j0qgm4VwEvx94cY9
	IlMNLek7Pc7rFSOSwbVDwNsTojpgp2h5/vUJGxIeuoWkDcNFImsQkzsnQtelngE+eSHGePmP73MVQ
	LTbWGrTCkAZQ84PIL+IMACgmpbgfAVLQ6LRixm/vGtk51d76FP00weHTtYhiCmycyJQLaWnDlT3tB
	pLlSxr51A63inuMGqb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVJ-000000013Dh-0PnX;
	Mon, 09 Nov 2026 15:41:55 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV9-0000000137v-0RqV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:47 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7340535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238901; x=1794843701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=b1GhxGlQyB+4iGdbiGInsJVfUxqM48BzLiNuRAYEMH3ywWye8wldcJmmcykpp3B2DV
         jtL6H5mKfFj9UdLoSpueKeNjOibhS+niDqhix/XbcKWLt6AfU+LYD20YCZ+wdLxRYw+b
         wU7RYJQ9hMR9zUHs/tn2Ga8h9WltQ5W2Ypm6FxMby7At9bQhgF8Myjm2BDt+fvn1JN+h
         FnKHYYyCNFW7KFxeStB/KAnaE7l42bkcOfTphC8ylmjI/EKaRk4E9XpqNuBMVsFllP5w
         jNweAi9+4Yq9cxDn2/bYn557WcpAhMDRFr3FI9ZJfXYcORlNTqe5dyhd44r5kAtJwCcG
         GNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238901; x=1794843701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=BLF8yxXPJEdOgm0jHmxCR/sMFg4snNoSW3611aYDxtoEa4EJRcKXmy/tP1vpGUaR3w
         qij9alECmX7RzlkzlSe35XhaOuTDeNs4P1DROVxD/Z8pL85nWEtM3FHEpI1Kru2t1fUc
         Cq6a0zJ277RPDmHEOfFZAL0JyLw58h/l6qY+SU5Wm/sekjILIrSKjH4WbQS0Q8hHE2fg
         /13fnxO5iRXHo8oOHAyQfJmGzWEYPLBx1aMbOiK/VkJuw5ybmnfnbrLCbC1Me422VVBX
         TSf0EFL2WLxfFeLXai8AMj8Hu7mI3L5d1uqezWuMgfWuHwhEmp+PFhgtZ3SKjAoVzxJV
         6Z4A==
X-Forwarded-Encrypted: i=1; AL+hErHmIm2QfyeTXhRm5zFiWfdakDNs6VMWva3+HLpQmR/SgyTDpXgq7u1mpZxb/bLsudJjOjZ/36pdrYBE5ehFlHuz@lists.infradead.org
X-Gm-Message-State: APuU4Z/jxQFlrTg0YT7jJg2RdrEG+2kz95rxWgee6utY+z0r3XDm7QlP
	TwiWNIBFT8k/TLWRLwLykYmtC5yvQFkFO7EmyGMlyADbPWpRRXJua3B9
X-Gm-Gg: AYBFou1DRMmSeJZimMWfQW21udgvlqBufc3+OxZH44x+Bu8uxScGjxoiLmZFgbHpgyG
	WiN3uiyXOcqu5h1bHZixaGsyQbpTqOoJ/VyXp56K1bShMPj/7t9h7IejBWdhc1OPHRh0If2HMrm
	zB8BDgbW+Gikm57wgOdfDF/I59nD+FOk6o0AdeF29AQBhiksDeePMj/9CXw/Bs/bUfwq6DTMKa7
	LvM+7tXFv8BiIRqI+X7nG/uy5qHMrHas97AWEzuFMPmr8lnpouhm2Y5k5PXqt0oskFiYTq1pu3b
	Cv2eWZPkF2a6tgUlm44TCTcdHFlli7ccSSZkoLX7kX/PrUrgLBOCSy//RppXGg1HlbKbE1QbCEr
	OsKXJYWymCZJogzWD0k4UpeVCgSO7cQJ5ty2RMhDq/rq6z9r9HScyhdM/f+6g94Tnd8FTesvKUb
	3RsE4qP4/V9uDzeQzU8ofEDlFc9bFbkt3CZi0aR0Y4RJaebvKiB4mwfgl6zswGrvSZUyJpnEjhY
	otot0CaEj3hSrM37rnmnNTXKR6w9emCPBZhT1GwaLhfCquCxOYhylNX5HpZ5nONmmMgWplDHrA4
	BrTED8nYYwwv8h8fDdBaXAWcSQK3F2WXRXpC+E25lOI4tdqCeIgQ82dpjjQYiOb9g2XlZo7igoU
	g0w==
X-Received: by 2002:a05:600c:4e92:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4b94d76c213mr90091485e9.3.1794238900743;
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:18 +0100
Message-ID: <20261109154120.592392-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074145_714943_43D7C9CD 
X-CRM114-Status: GOOD (  12.32  )
X-Spam-Score: -1.8 (-)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  However, SND_MESON_AXG_PDM does not.

axg-pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-pdm.c:(.text+0xc4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_PDM unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 2cfc123eea74 ("ASoC: meson: add axg pdm input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d0f60f8af2b5..4b06a9e7c72a 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -92,6 +92,7 @@ config SND_MESON_AXG_SPDIFIN
 
 config SND_MESON_AXG_PDM
 	tristate "Amlogic AXG PDM Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_DMIC
 	imply COMMON_CLK_AXG_AUDIO
 	help
-- 
2.43.0


