Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D64606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lh9IPLHI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6lvy8Sr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ozleJ+L+uNTLaGMigNL/2EmL/Gas2wcTiKBPcA8A+ng=; b=lh9IPLHIG+Q1AA
	vvzn7QHaNeyESSlSuMA1w15f/5U1WQx3SlmgbG0vDvk4MI8stViQnjuJfIj6y+L9XkO/UopuYZ0oL
	oBekQ8T7vUUZ4QlKvfbqwk4oTfQ2Ef1AEO520epKYMh1XCNfnpg4kFEwrhq5Ytr+zcK6hyToPCMVQ
	dSjAFRqf0zutj6kdmQkGBcnVXpCa9gIEBGhuzvQRsAK+8Ir8jNQuKUQRr2Y6XwzIQ+XYT3pGFVRxo
	h1/Co7VmdPt5Q50MlCAhHMVhe9xIqfRllQchNpfhZKENQhsAUX3ZtiCD4qK36cfY47ki50g1wQs1n
	IEOSQuX2fFwETN7gZBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96k-0000000DQsr-1nCy;
	Thu, 19 Nov 2026 20:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96i-0000000DQro-46AJ;
	Thu, 19 Nov 2026 20:51:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA3CB40B05;
	Thu, 19 Nov 2026 20:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97C51F000C0;
	Thu, 19 Nov 2026 20:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121508;
	bh=ozleJ+L+uNTLaGMigNL/2EmL/Gas2wcTiKBPcA8A+ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b6lvy8SrMm1caN0nwEFipqehaDace7R5FngazPpcN8ApF8n2IWLmcxHhA5Fnl1a+u
	 lD0jQnMmVwXbAcsatXZUh723s23r7zFfmyj6AJiqDEbosc9UpKnghaS5g/HgzoZYjb
	 QVPvSK9k2/chgan4mu/4p4e8S/tvjkLaW5/m+KqiZexAxDOx8UsP3AMIy4S1yqYZhg
	 EUnUHyYSB32BTIgHyQQowruyw194Kclm7GjLrlIBZZ7bliRF3+IZgAi8hqgEyFqOLd
	 ne+oCuBIJal3q4MHYjibt2rEM4ADrDPLv574FsMKgn9gsU4EjQ3knS4Wy4oR4RoQ6m
	 c6J8eXZXNBOow==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	James Tai <james.tai@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Tzuyi Chang <tychang@realtek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 12/12] pinctrl: realtek: rtd1625: Set dcycle_offset to NA for pins without duty-cycle support
Date: Thu, 19 Nov 2026 20:49:08 +0000
Message-ID: <20261119205013.2563811-13-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In rtd1625_main2_sconfigs[], pins gpio_86 through gpio_91 do not support
clock duty-cycle adjustment (dcycle_maskbits is 0), but specify 0
instead of NA for dcycle_offset.  Because rtd_pconf_parse_conf() tests
sconfig_desc->dcycle_offset == NA to determine whether duty-cycle
configuration is supported, an offset of 0 causes it to compute
GENMASK(0 - 1, 0) and corrupt the pad control register.

Set dcycle_offset to NA for gpio_86 through gpio_91.

Fixes: e309dbd523b8 ("pinctrl: realtek: add rtd1625 pinctrl driver")
Closes: https://sashiko.dev/#/bug/linux-8a8f690f-15e7-4dbd-a3a2-87bc00edf7b9
Cc: stable@vger.kernel.org
Reviewed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: Collect Yu-Chun's Reviewed-by

 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1625.c b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
index 88f2be37f743..f6e038e4bbdd 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1625.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
@@ -2993,12 +2993,12 @@ static const struct rtd_pin_sconfig_desc rtd1625_main2_sconfigs[] = {
 	RTK_PIN_SCONFIG(gpio_65, 0x34, 16, 3, 19, 3, 22, 3),
 	RTK_PIN_SCONFIG(gpio_66, 0x38, 3, 3, 6, 3, 9, 3),
 	RTK_PIN_SCONFIG(gpio_67, 0x38, 16, 3, 19, 3, 22, 3),
-	RTK_PIN_SCONFIG(gpio_86, 0x3c, 0, 0, 14, 4, 18, 4),
-	RTK_PIN_SCONFIG(gpio_87, 0x3c, 0, 0, 24, 4, 28, 4),
-	RTK_PIN_SCONFIG(gpio_88, 0x40, 0, 0, 2, 4, 6, 4),
-	RTK_PIN_SCONFIG(gpio_89, 0x40, 0, 0, 12, 4, 16, 4),
-	RTK_PIN_SCONFIG(gpio_90, 0x40, 0, 0, 22, 4, 26, 4),
-	RTK_PIN_SCONFIG(gpio_91, 0x44, 0, 0, 2, 4, 6, 4),
+	RTK_PIN_SCONFIG(gpio_86, 0x3c, NA, 0, 14, 4, 18, 4),
+	RTK_PIN_SCONFIG(gpio_87, 0x3c, NA, 0, 24, 4, 28, 4),
+	RTK_PIN_SCONFIG(gpio_88, 0x40, NA, 0, 2, 4, 6, 4),
+	RTK_PIN_SCONFIG(gpio_89, 0x40, NA, 0, 12, 4, 16, 4),
+	RTK_PIN_SCONFIG(gpio_90, 0x40, NA, 0, 22, 4, 26, 4),
+	RTK_PIN_SCONFIG(gpio_91, 0x44, NA, 0, 2, 4, 6, 4),
 	RTK_PIN_SCONFIG(hif_clk, 0x44, 13, 3, 16, 3, 19, 3),
 	RTK_PIN_SCONFIG(hif_data, 0x48, 3, 3, 6, 3, 9, 3),
 	RTK_PIN_SCONFIG(hif_en, 0x48, 16, 3, 19, 3, 22, 3),
-- 
2.56.1.750.gf70dc682cf-goog


