Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TLliZSeU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oJVI0SNI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvSfJQ2N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=; b=TLliZSeUYHyjzl
	yTz6TNnjlYiVwMY6RXqKp0nx2+hRnyEcnxuCwwGzs4QzWeWopukmHC8iIuxmaagqX1Vf3q0XNTQaW
	0NEI8kA7kLpbRCjJBx5+11+29zM6qDAySZFmCZLbhjW1kvTKlhO6eexM/voPRRcTAXtpwdgVnJkQa
	FYyCyobsvyvhpU1yDVG0vPSXOsIWC2b+2q/1eS0p7HUxO4+bV6LJuXWMn0E7ZSdrzBazFesY+z1lj
	KwW4MyfU/Nu+HI4c7WjgunJByslxBYqya3IStpAqVNipFWH+FbhZFlgo8pIx3tj0ViuVh+gl4RTHW
	BG9oHJIh7NFlYsxAc9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVZ-000000013PN-04Z2;
	Mon, 09 Nov 2026 15:42:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVE-000000013AF-27ge
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 15:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=; b=oJVI0SNIU2/1jEweIqcl0D3Cll
	Y5hskGLCYE/9ufi+XPBIiaWTMEIfWYvM9yqa0CENPd16w4EdVRusN6tLKS5MOWhgP66RbnenltbBY
	oK0KILYftNgUNkNepR8dga0UBog2El84Jj2l/EFcqbnjV3kA2xTVffywZz7r94kxEi01FMgltSDPr
	7PNdGMSQ2hS7/+a2S78A52wy5FMnBLYFfkY/FPEZl+q6GagQ0VOION+HA8SrdMQ/aHZ8408e+Uevs
	D8eTyNZABR37PCN44ca2N11Q74/3CZUx0oo7bvDK/3XeGeypSlE4kNxTZOUlJP0Upx35oxzyONTCh
	x7rc+sdQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVA-00000006tRA-1Pwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so9934195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=PvSfJQ2NemtvonfqiZkFO7rBI2tn0GJg8MNb0uf2efkZ1tWX4Zd28rSrveAsGo2JwC
         eUayp6q7jHY850smoP9iOeumUSHMMcYLZH9qER4qr2v0XKh8eL4kG1ycyUSM38qyFl/z
         r6in1I2rA/iCrn2QGp+wY69RtcAun+dDhA6okxtAQirii4S7c9VlKwUfUO2g8BSfYVW+
         hgRQJzTOGirb2x0OvU26GXQ5aLVqPwXVfELCOXQmkGRHwvpxZ3KNT+eD4ADc7gtiLaNV
         o/Y5MbbSfCjUH59pmU21PUcynhFgzfJw+PkDwUkUkXauCTFxBKRFnyigzsvEQaADkH6o
         IXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=tnWGsEhRDaQTtr1tGyPiCCOzWDyEocAajT/9w8ylpSSAij/kLkLM9/e0NVJ8E9KgOi
         oOzcy84Ck8dHvc3iOL63J2TMGCCcmuastQ3gPInvWPbzxbPAYuQeV8j7Gq2GvX1chqWP
         djdUKFO1c/Afx0k17DVVpRBj2Lps5gIF6fMC/TZYhLz8ER5o2VrCIm9vUPZPDoYM8vaN
         x58p16bKvVIeQ3AA2ER2AOFMoKldkf6F3BQ3BaiDwVWi47oqYuG34IYOevH31JH2A9YI
         p28TbCJ+IAyVewvx5/8EkjhsoSgBlQwRp8a7pjl/2Wx+Q7099nvdfMMaDsqZtf7wMTup
         hCXw==
X-Forwarded-Encrypted: i=1; AL+hErFgON7MQiW9nNy9Xa0UHNo+YuaGitiKGbWbq7aBe6R058ImyfaoM09MRn4okcNzg645wkWsNiFyLjhJ+AlOAs7l@lists.infradead.org
X-Gm-Message-State: APuU4Z/rRoEZQTffntViqoNdVwom5WQXtUGdVRRU7shuYmCDj2XAKOOY
	S1AI0VU0X3HkvsZzNPfItwkPnkmuh7oVLNkPxzdzZn7/jRNV7VdOijHs
X-Gm-Gg: AYBFou17wmQJI4jf1o0+9Gixmb0RkMer415WuvpS+Nej4jXrDKhGAoFB963uywvY52v
	NfGxhTR6EFsnTy/Huo9w+1yuGw4QFYUaq6VspTMgJcpxEhOkYpGdTLcOx/fELu1s22UG+edGqyO
	TVHNXxASTGN3CpYJwwm2KGT/7qwa0Z48cvZY9piPIetExLOnD5uWc/fBm3b+tn5KF5EFsjHO4cu
	sFkjUntBDlDqTolkjlzv+/1lNoi8TxvZ6g1qLlyGu4O4RNR2zT5InbVNbZD17Y/cGbLDStaoNcc
	dB8tjx4KA/uzxNywOLlQ5Pr7MDQPOQ5FEhJEdJkiHrVn5Tj3fee3bMn5mIwgRjJ8oIZ1v3ftnYH
	gSWP0sqHYXeiQNfT6W94bh539AaPuqRbmdiOvwIXCjlGQo744/oiwpxRlkHPYBkqvSDx/qGgK9N
	4W+BqSw9IZi+Z6cT/yW2v9oVaDRWIYH/MDXqmz0Wf/jiH5EVEMFj9Q92xUy2F+SPycItGe8XdBC
	8s+zKevW3b/JnErJBPuMCDWqfSnEOKOA+uuoaAEZNkme+FWnnTFywrUHrdpqIoX/Bj6S5W5Ydfu
	iKiFSPH6eeFtCAauxl015FXlp9Dqb+EHZ20yCYxUtnDUQqZOOfPTlVTbgiMw6+FC0dG3ZUEsBaT
	40Q==
X-Received: by 2002:a05:600c:c114:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b963c7c6e3mr61028555e9.16.1794238902401;
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
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
Subject: [PATCH v2 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:20 +0100
Message-ID: <20261109154120.592392-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154144_340522_A83C3D1B 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: 0.1 (/)
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
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
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


