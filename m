Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kflsGsGD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ec+WklID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xNTHyL79nF9XXtIwSQd6Q/aKnFBBrPOZckjtVYsFR9k=; b=kflsGsGDl9/lPY
	5goesAPYyYMbZvuMf/KBiwiP4gspzTHLJCIKXU4Dgzp6Nn/IQ4f1p2h/QN0Z5xuTNcsqrohEaVpU+
	V0ULssVnS2D9TdHTguXPk+Q/HkfgSN5+6lutTa8Aq86fnh8AXqjl/bZF/OaiYhwcBfkEgPVA3GTzy
	MjBbmBLBU2Z3apa6NAFKVbVlKbS0cJ0H5i/sqB77ADHx693tlN1B7kHCqBMkoUiwxo21yEQCPL6/i
	UtWJspnIpF75pj0tgMpwiT5OX0Z+hFON2Y6L20tH6NciEMO9ueNGmdiNOWw3H71JAFU88viNDVPjz
	FpJ78dgWn9P87Nu+bpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwcA-0000000GLFU-0uam;
	Fri, 27 Nov 2026 14:07:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbz-0000000GLAa-2qdK;
	Fri, 27 Nov 2026 14:07:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23CE561D67;
	Fri, 27 Nov 2026 14:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25991F00A02;
	Fri, 27 Nov 2026 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788458;
	bh=xNTHyL79nF9XXtIwSQd6Q/aKnFBBrPOZckjtVYsFR9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ec+WklID7c6vdwHelKyWf8KfJiNtivMnHn7q/6WCnIfIpiDBPSuBTUlMC+j81rZCe
	 wLBhHEMX5LK1MIZx4ONBEY4Xca0H4t2gy2DX1Z6PRCzhiriiQz/ziSEfV5ZjMs7pVG
	 w16OKA91obxHvt6exXnXRy/t3a81/GcYVitVzGNfictbjXQL4zposrYH9yha5uOwkH
	 YTUARcq4uDGEZAyDXhXlhhrY1RRC/7jg5WPGdD+2Nj7G5pF7csBXgpYxGAZBKqhAfd
	 /DIi2ppunacNP9BuLQxSoITrweWYNSWiHnHQ5EWfuKMZDk5w4LcrbMocQ37WfL2yVx
	 F1MkYn3Te41lw==
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
Subject: [PATCH v3 12/12] pinctrl: realtek: rtd1625: Set dcycle_offset to NA for pins without duty-cycle support
Date: Fri, 27 Nov 2026 14:05:00 +0000
Message-ID: <20261127140602.2790001-13-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
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
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

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
2.56.1.839.g22a8290db9-goog


