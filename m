Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F41606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZo0GmzL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyvcwBct
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=; b=tZo0GmzLN5CO0c
	ApXJmnYifMgvVTgbaHwbhoGhX0qOncEi+GF7GBqwdpB/6UY4W27vQ+G5gagkPmkODGVpdOHC3+J/T
	kM0bFtYai9zCVTluZrD+ixmqANh8NS0fChwyEEzWP38ZYiSzuUMJ6UVqaQWTSmFUvAJ+pYKpPBC+v
	1RzfyzsLjX8ePzTmz/XEv0wg1H2vA1Ry3pM8sRJfqMV9Z5dyd2YPNY0RYleUn+Cn+U1bUxSTRqqmp
	O8u7SsyNnETJa0gU0BZytmm/mdu9Hr0pIAzc6LnBYO7pLv4H/6ubPLJJYmfCOaXKMu4Q9jrE6WTt4
	vbk2ljckTwm1FYwegAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhr-0000000F3Mb-1znw;
	Sat, 07 Nov 2026 16:55:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhn-0000000F3Fq-25TC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492f563d1c6so429607f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070549; x=1794675349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=EyvcwBctnT1lABSPFa2hJsTwCeDCZBoXBOzWSwBpUGXGXgfG9g8AKBpZmP37Wf5qdO
         Z6mRV1OuAd6lWzseEVIFMRE0xeHeD1XIIvwfH0L+SE18XQcdlSUll/4luCXxep0Z4heU
         8+KY404D0JVMaDb+FbD0DPEA9gzHnJAXRwZxMrMVDh3kj6rHRuW6ZoqqgZ4L8esOYLtx
         k2Y95BjM/dywnBzpAss/2CQcO3tKpSwr7AsgTHjvaW4xuWdErgnx7g48/qXtt6lX7lyp
         VUrZHZ8IpWhbq0CHvp18QgeRVeFmkBlaD+TFiV+nl7R3l1rGK8BuHsVh9e3RrYIrtD5E
         Y4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070549; x=1794675349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=VHq7Jq/FS/zLN5hGKTHRwJh6FCb5YuAK5r0WRTcAP2sHmEBBbie+eCronwFkyKp5uN
         p9mfc4k2ny7F6hG1MK+lJtLlSGwWd1oYL7gV2xnsxwcyTrl2nDuXPoGGVf4QO+Ei60ug
         pUJsLDuHfGm83MPkxjpRtEELxMyvzMkNUjhenlGQP0petrOcxpMOfHi/q/m4S2bDpaBB
         58OtFs6XAWsvFupAfSCKUcxm9stejDmLR4NHgNcV0QHkroYRzDOzNRQHObgPmbOJyUAf
         q+v/swn1aKWZnNxsSwE5+MCuLbmh5C38t6tl5vZyLvTYC1LvSNYWSfwTOOwTuu/fQNap
         3uVg==
X-Forwarded-Encrypted: i=1; AL+hErGW4kD/KGImCTfUdl8Lwytdz+MglanEc88meKrQOEKiEMNp6GPEn2/Vf8mEi/dmPKud8rEHHIAA/kAkMRvZlttu@lists.infradead.org
X-Gm-Message-State: APuU4Z+MQN2r9zX5XbifQNygQYT2eJEXz6I5CY8nVjUvs77mWRhs+e8n
	yJujQcyoXnO/6fLphQG38nQjMDE9nRAZyjeN6GdFmcqMiFDWh3liQspy
X-Gm-Gg: AYBFou3RSXhsKq/5dPQwJrWweiRC1zKQElPg7uGZzqYzfngG1WNyIjcLbdzFHC7sNVg
	fyFD3Wyjr3hX0YAUeQYjrf0+UUwWQ+1j4g11GiuDmMJKbxROQGEbdqspEj7vmR3Oy0SGys9WXb9
	8QW+4FnonvusU9FcHVqv5uZeklNmeLeguROxGheZb61OIH+TAVAAlZ1R/5ntDUMsvEhtpuyAzjc
	80yMCFScGnHNi8QKmITCZFbCHngze4VfL9l2t7qtTwOE+9Xpq2YbKo/rDDiGDWjNEV9D82Kj7Hl
	IoE/jE1YNn2Bu9e6ZkjgY5CcoaTrGByNxy4GQbSDdNzVSrGuuBU5s0Sd9CGWagh+8ESKI2TDhrQ
	XSTn6QSvVKMh+2g15ufX/oVfGAEjBn1Jnxo6Y/h+0xrcarOBeIA/70mw0un27JCL08EDWhkQJoc
	jtQne29fdhRNvD13GFKU00hUqCF9GZXSvbxpXXSotY12Hfv0Gd9PVjcjdFHiuFhB4Yw/vHtZeQM
	kEPJpvAGZSBO+9vjrfP1MDluhDKPuQg73qXH+GBBAn+yQSBSNSiHhMJ58A32Hq2KOFLQoD7MTeh
	Fisg21lhGRMzFbDSLNccRrs+Ojy0q4bkGg==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr13284591f8f.5.1794070549260;
        Sat, 07 Nov 2026 08:55:49 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:48 -0800 (PST)
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
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:26 +0100
Message-ID: <20261107165527.576383-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085551_547710_916D31A2 
X-CRM114-Status: GOOD (  12.27  )
X-Spam-Score: -1.9 (-)
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

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0


