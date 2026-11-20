Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PIMt+JOy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iw0Bqh9w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8acJLKDDuAq49IKqU6CJftqIRFxZoq6oCQgLOqzp0Bg=; b=PIMt+JOySMoWbCQr4HIIXDsNkJ
	+NOyk+bKqrcC0p9jJCXgeAnR1hnUgKZARSyBCfF0D/5124hxWNot4Ndrx0gzt+1sT4ZJCkeb3Vce0
	+rCCpIYStwZiW8xd1MVsVviWjfUJEtcWOKIOq1OxcH26t2a6mn/ek3Vc6dvaS+BWghgWrX34/8hRL
	Tqdtar0cSII8g7CUBZvt+v6ajaa0tTq4nPTTz2ozZMBUCLYz3BsdDp2CMfNbqxBxiv1VNL8AnAeeR
	9eVKETz+1di7VevQ842Jakyui2DkzV4hP6Tv2DZogdarH1oajjZ/kb+ZAjvRi3Jo/sgZm+QlpC6vi
	FuyFyNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHYv-0000000E6qW-0XHb;
	Fri, 20 Nov 2026 05:53:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHYt-0000000E6qE-43Bq;
	Fri, 20 Nov 2026 05:53:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A44A60D4C;
	Fri, 20 Nov 2026 05:53:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795154006;
	b=GGMHMyavf4fMZPselc4WIMbgQHp6NAY6UGC+wEo3CpN+ZrePegbuQE5fYfHpausDum5E
	 EmUaZ76NWwaj7N28SWnIB0dAvky8OnJLOmvEUrN4mcdi8Rwp2MayqQLD+A1ugo7lZc0fR
	 YG3MTCBk6zbPJm20BlOwHtHrMoFOVckR5RWozvdeRIW1zegKa9d0eVhtGC6Fm6qezVUrQ
	 DTHgAi9wI9OyJ0DNMjWgZJEFpANH8guEXIg80OHhi3cY/Vn9y9k3dM8uQgLWA5PioDI1h
	 OGqpx0rHtXeuQLsr2HLNZVR46UPW/tQrwqIrZ2dbtyPuahB3yJyW0UdvcMEP7z4i/cQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795154006;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8acJLKDDuAq49IKqU6CJftqIRFxZoq6oCQgLOqzp0Bg=;
	b=vlXBCw5qXAsAmYP7N59br6of32YNVRu0tdAmtXyqr6Yo+CLAGYg9lTEdGfe0AGtPaoUj
	 1EMsLYubS411468xlfi24vbFyEdfzI2TFA2QDllp85WXLI30vbAFnV5oUi/lbl3zzgWcd
	 UFUPKL2wRci0P1R3x5XbN46b+I5rN5g89Y1EUZYoIZB/MbSIRRa0WAcAqL2zC3eBklb7Z
	 eHW/jHSJ9dSaI6eJ6KIppzLGFnm48U6VFVmy63Zc9JtLB8p1EQceQgHiQS5GUez8Eg/g6
	 top6ra0ex7lVIEhNmI7fWuzrSXyrIUIN0QNu6ywKkR1t2/4OPJcQ6yNup5NqZM/u/Og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5852F1F000C4;
	Fri, 20 Nov 2026 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795154006;
	bh=8acJLKDDuAq49IKqU6CJftqIRFxZoq6oCQgLOqzp0Bg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=iw0Bqh9wb8tTOidAb/HlGTBIGtJX44CNzW5JojcVGgFeKn7k5Q+6rY0J89QcWrlYV
	 1w0b5p9MRswDBhqP4wGFUTwU5LOTtz0QMPpIHo/ou5k4hOKLnfYGNOpgOVj7PtxGJB
	 QAjo5dZv+yjwJekN6U1Ea0RygS+SfxU6kPNik+7Xh//McOmWnJQZZgCSKwf15Jar7r
	 HyZiD7p/2lNBK0bOmRGZpPN/qEyWrhytwzCIDdnFpbpPkt0f/7UH4ep6QT7naNoJ3Q
	 fXaKfcr2W0bw3FRX/RcmyTt3RO6qHv7XOp2MBXuoJjBTdsDsp90eMYez0eWarWCeOr
	 z6MFRRce4qMKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D93A0496E5;
	Fri, 20 Nov 2026 05:53:25 +0000 (UTC)
From: Rong Chen via B4 Relay <devnull+rong.chen.amlogic.com@kernel.org>
Date: Fri, 20 Nov 2026 13:53:23 +0800
Subject: [PATCH] mmc: meson-gx: Add reset for Response Mode Error Mask
 (RMEM)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-a4_mmc-v1-1-5a84cbcdcace@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAFLg/2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMD3UST+NzcZN2UFJMkyyRjs+QkAwMloOKCotS0zAqwQdGxtbUAKoW
 1klgAAAA=
X-Change-ID: 20261120-a4_mmc-dd4b9b36cb00
To: Ulf Hansson <ulfh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rong Chen <rong.chen@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795154005; l=1328;
 i=rong.chen@amlogic.com; s=20261116; h=from:subject:message-id;
 bh=ldcBzSWY8qmDPf31J18ds1oMT+JS17QVuWgrGqm9XrQ=;
 b=vUz2tYdPH+vzuS5s+wTBf+hkZRqWYYUyOdbqg+YHDpmn5FeQ9cDaWszezykoMJ1UlbazSXAHf
 h8TBoKOe9beBd9UcK2PbvOvH2MvbmouhGCLdFdEwtpaXhSYmstq5V9C
X-Developer-Key: i=rong.chen@amlogic.com; a=ed25519;
 pk=vFtPE1jHKfpAuk10u/dq9u25ZzVsUM3t2Sew8vz0YWc=
X-Endpoint-Received: by B4 Relay for rong.chen@amlogic.com/20261116 with
 auth_id=1539
X-Original-From: Rong Chen <rong.chen@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rong.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rong Chen <rong.chen@amlogic.com>

For T7 and older SoC families, the RMEM has no effect. Starting from
the SoC family A4, RMEM acts as an interrupt mask for the device status
field received in R1/R1b responses.

By setting RMEM to zero, the device status is ignored, thereby
preventing controller hangs caused by spurious IRQs under specific
device states.

Signed-off-by: Rong Chen <rong.chen@amlogic.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 49df33bbd8e5..9d9b00b199b6 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -113,6 +113,7 @@
 #define SD_EMMC_CMD_RSP1 0x60
 #define SD_EMMC_CMD_RSP2 0x64
 #define SD_EMMC_CMD_RSP3 0x68
+#define SD_EMMC_CMD_RMEM 0x150
 
 #define SD_EMMC_RXD 0x94
 #define SD_EMMC_TXD 0x94
@@ -1086,6 +1087,9 @@ static void meson_mmc_cfg_init(struct meson_host *host)
 	cfg |= CFG_ERR_ABORT;
 
 	writel(cfg, host->regs + SD_EMMC_CFG);
+
+	/* ignore status in response */
+	writel(0x0, host->regs + SD_EMMC_CMD_RMEM);
 }
 
 static int meson_mmc_card_busy(struct mmc_host *mmc)

---
base-commit: d2616724e01132376c78872b8324f38659af9f28
change-id: 20261120-a4_mmc-dd4b9b36cb00

Best regards,
-- 
Rong Chen <rong.chen@amlogic.com>



