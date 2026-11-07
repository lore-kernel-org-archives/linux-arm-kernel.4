Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA4606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBCDZRgF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIWhKP5H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=; b=UBCDZRgFPf887A
	/29EAY0xg4mgomBdOyKVXlLxFYrAXJRdkfv8JImnLrkBGt+pKD982kQfNPfqCICfsq1JagB4z0hTN
	tyHOqylNaIMYQ5N0KYbFpMvbkGPoeIfOylDXe2BN1kLtUWajakogNRprrby4gC06Agto/8hQ5vxq6
	AedIp3jqvIoELcqCb9FlBX28MzWrqwrCMSDdfP9L5zU5ORD5h5OFQzUbrepk9nhYLPdf6b4OGpW8d
	DwMvf3ORALr43rodyaiGzPZ5WyM3ySbbP+XzZG6CVQdCU4d10rJLUY2cMLVO0wxAXxaH4Ry4x4U9G
	MRcGy8/gKNROM7B4M+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhv-0000000F3Rr-2sHS;
	Sat, 07 Nov 2026 16:55:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhq-0000000F3Hi-1075
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-490c1d337d8so1037249f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070552; x=1794675352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=IIWhKP5H7xHES5XkK3LcIgoTVf5Sk5rMrB6vaR9RpIPMOxe9ZhB4BiJX74UWoguLfH
         fQF5jSkWCfe3g/EO2YfxSNRMbhVjv+5yqLm/gz9G+SzosnQyIa1uCtwmCiKxAfghjveR
         7YTSbBJr4wSxCPnYY2E7xaK93S1ILX/NmcI+jop6XxHCNNqZh0tq74IcSE8ZjOmXfjd3
         ge9HPwfEQ2DVEozIYu37PikKti/qUG+9n/yKDE7McUEedBmD7yc7sSNKG/4JZppedmuK
         cTwnaFAKBgmmGen7bBEkOjPXp7B5GkJVd0CXEH4/YZLKF2szzxHGd0ZzpBEQWqvqmIcY
         5B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070552; x=1794675352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=X25KWnbimWJRBd9E5hREaRI2yiAA6n0JEjN4o/MppZHamdXhqUomiYw3R4DSuvcPgo
         +jO/tRUSjoVvH4JbJDgyxu9uRrEUwPgSBV/hF+qXeymx9Ku3FLykdsUxDyAtARUNrPkx
         hOdaV71VevVa2ws1m+ZsXyEmwVJBLpZVXd/ZCZlpeOgv2PF0W8H16wGJcNNQvDp0u+Qf
         EHzr238zLJALzRy50HFDP7U/2hYyHZDaElziWl1zPCCd1fiO0qNfHxGeN2vrAgM/Q7e5
         pftFfUEvon98H84GLfCwX/yZSKKiwd51aM4ZtOkOqi7qlP7UB9jjsa7GOINFPJyx4C38
         WoeA==
X-Forwarded-Encrypted: i=1; AL+hErFuggCTQ/f9NN205dtYBieOyP4arcm6szOvTwQIbDpnSH+dJOsZ8cXFpJo1FBmr/vBgBxpm0D0K1oKYT83yg3p+@lists.infradead.org
X-Gm-Message-State: APuU4Z/IhrFzL6CQ3b6BDJRrnIliR+pVHipjRLLx3aU+ncgcMCFrVM/m
	dIUoFo6IR0KYdCclfMAzsHLKWgKNuIJv8dGLcg3NvtnwZqFo8ElCYdjZ
X-Gm-Gg: AYBFou0mRlI8DG37Z9KbFStW2ssHyR+jMczn+evKn6WucxHnWGJyVxL+QoHwPR5LUOj
	5QwHKa3JAVGa+xgwft89hPPt/C2qjwdv1y1c4W9YIMP1Ew7tvqU+bJklOQWmQkQi7Gkr0Gt1Sfv
	Zjfz0WshLyraF80F6cwCUCf6xU1TPsRlWTijNs4j9Y4WAKFJKe72u/VqLfNUc8f3zLUYJL2xTW+
	DB0PO/Vh2zBmdl33xmoHl9X4Z1my23CQGwWHKrxYuW2clhT2QogpmWq6Tz9hr/1JS8FwhaiOgid
	I0RHWTJqSUQNQIN1K3dPmzdoquC8blNn00w2P7JGStREt9qfOBdFRxjUm7UjxvzXtAZ/1UjFsyT
	o3/4SmoCTEHAaAnExtbND6ek/JOUcBUItgo6hEEyBwc28cZdoNwVkOfhDPrj8CO/X7hQw3MowT4
	u7Io+4ZkFSwlB6pDLY4RSo7kFR5e3Z3KUKPxNx3Pz6OnBKj5SXEzJ82vCPl+vhPmSwGYOL8/luS
	ymEy4t381Fv+UiE5cc39LdBb98ipr72Ih1pFSJaMuw6opFNN+e2mruBK13fMaWk+65NEFVVJsat
	fBNNgZZ2/P8O5nEnACQaxzxJBUh6pvQu4RWvI+8DvBo81xlrf3PJkmo=
X-Received: by 2002:a05:6000:1a8a:b0:48f:bbf3:cf52 with SMTP id ffacd0b85a97d-4927ff37842mr12135105f8f.52.1794070551891;
        Sat, 07 Nov 2026 08:55:51 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:50 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:27 +0100
Message-ID: <20261107165527.576383-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085554_310662_45C6BE61 
X-CRM114-Status: GOOD (  11.54  )
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

axg-spdifout calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifout.c:(.text+0x9c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFOUT unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFOUT=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 53eb4b7aaa04 ("ASoC: meson: add axg spdif output")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 10c7d59a5ad1..272639dd8eaf 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -76,6 +76,7 @@ config SND_MESON_AXG_SOUND_CARD
 
 config SND_MESON_AXG_SPDIFOUT
 	tristate "Amlogic AXG SPDIF Output Support"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	imply SND_SOC_SPDIF
 	imply COMMON_CLK_AXG_AUDIO
-- 
2.43.0


