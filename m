Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B5606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 04:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W3w893SP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APLOwQsg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LLWhkWwyzjalnr3Z5HU+EI8soyzPleNcaIf48jvo+8k=; b=W3w893SPl2DofOlYVBnTGV6Wx3
	pMyl+wlv9eLs+WVKuWR1dk6tvAhsOUgDqnxYtSWbuk9BLthKwN88Fpf+U41xo5ilv5alcyHHBMxkt
	hVEJo8O7zZ9KDd/1a4Vi64D9ORdP0+aeEx5vLlE63bN2YDWyuLuriKCU4GA8v+z5NvF/pKfJe8LPi
	tnR5BoIWPpoZRgtQaLorW0IlnxP+pEtlrLciizfqusJrfkJ2RJnTCPWREpPyN8se/HWYTtyPZyX+E
	oVV46wi+gy+yn3YFuFW1zzvbrCDVLDPdRzp4rrW48ntGDvCleNmhntGLWwvbY14CXhhCFDghc5NyJ
	QhKD9xsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSS9v-0000000H4OG-2V23;
	Sun, 15 Nov 2026 04:48:07 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSS9s-0000000H4NX-2xn1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 04:48:06 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36dbde64409so3473774eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 20:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794718083; x=1795322883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLWhkWwyzjalnr3Z5HU+EI8soyzPleNcaIf48jvo+8k=;
        b=APLOwQsgbSxj7Qt/GIkind2XtdeFMpiBA46sZgnjS9GcEcHhZO8nKAcsUTQA5f/M+3
         mxTaTpDS92uGRSBrMcgcqbWbdtmvlcbydpzK4crZSijeYImE9rflcZvY25/fMLNgApqS
         BKLaY4VpjQDnCKGpMn45epdgXYWDjxtPRZL165p3HBXCMKlTl0IH9FOwlVXGNmv+UqLb
         IIhgCcSHWxw1zfH58JCxVNrGsqurlbi1GYfTCv/HRLNpiUBbg9G7th6tbo0rccLfTFP1
         sXl9dVbtPN+8M1m6v4A5qR1M/MAzW90fe943VTKaeLng3XR5/Am99za0z32Onq6tKTrA
         JxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794718083; x=1795322883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLWhkWwyzjalnr3Z5HU+EI8soyzPleNcaIf48jvo+8k=;
        b=z9vRbxcKanizwqCOzz0pGP3xTM8HaYhTggW/k4wkAoKiJYejJIHAdi2IZm0yfFvPk9
         BpOw/BBNR8L8tMVliJB9Tt6zRvQlAAyz5Ensf2L0gND8Z8aAV3Did/b6V1G2rvwEeCs5
         MxJdk59DPCboVBIDAouNzPvT8oA3kAQg/MfjkxxBdTYLoBQEb9Wi/SBAU6kOOfjCAlMN
         zMDFunRbXZuxc3xDJ5IWWd4s14kE8rnlpu0/1kldtgADWEkFH4eqBYEl3ruuz4N15zt+
         fKVroZ0TkDlu7DMSQAIJAuoy2m6aWr9Zx0s6Ot8HGRorurM8cAKw0EAvZ3DrdXROp60u
         y3SQ==
X-Forwarded-Encrypted: i=1; AL+hErHwVCRPwGMBbidE/m76QseOTG5DOLBg42wqInhmgRL4sAlVZIABkrVCFa1jCzM3Xp7kqpADgxbBr6oRWBOVLaXN@lists.infradead.org
X-Gm-Message-State: APuU4Z+G9Go1Uq4gQSfBITfsr0uMi8UvCrhVlZkq+ciSOl5asfhrTPlP
	tj+kJACIuBEiBkALnMqvwrF7Vs7kI0I619ALNzLd9kHMIlzT2VuxJC7/
X-Gm-Gg: AYBFou1U696BANEf4YGMvtW3B22p2NDXDeUkp/sbhlwyvCKAbCB3bNRHcQuEDHDqmdg
	qNGVNzQs7wmGwBEUXuTGqTlnkQ6SMYDx83Gcei05IoqKV+jRSj0Xm5q4dZ8S0x4S8QfRgiLTzR4
	x3x2nfIny7Mj6mzEmETQENQZpkC9KFPpRJhzqdumVAV550OMlymTfDENki6WBt3aNq62MAoNuc1
	cTt5DXRxjenJHX5p8l3dOiIBT+zu/wFP9rGbf+dnwapyGLk7tLtJ+oCH83wcisyR8eKBQm8nXd9
	9+lLrxuwscAqug15xQljYz/IqSMPcAncaDpWeKqpsl0vTtcEMtT66Mp8rbUACJVMMrTVVFsROHL
	26GB4BHMkHJ+rlmbPDNP6tYYi+cf3LyKilvYcif38EUdlTTUTB0cLCXc6NC9GimEt7o0IlRax8H
	oo/aS5A2GTp9luM9YTI+bBl8tGXqBu4m6i+vrilgt5HSeO+HlGd4mqhAiPsPAnL6oT6s52uRlPb
	zm+WGJX3twrerPvs9uUyOUlZZcnjxF/eYPg3aH5v0WcO5YiX8rrW70gyroIz4ESRnuGHrU/0jDU
	NxzTOVZFHWL9BwlYDxXahUy0jO06eAl27pLO8EA=
X-Received: by 2002:a05:7301:d189:b0:376:2ddd:2ab1 with SMTP id 5a478bee46e88-37963660405mr7150743eec.4.1794718083366;
        Sat, 14 Nov 2026 20:48:03 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm22624099eec.14.2026.11.14.20.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 20:48:02 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sun, 15 Nov 2026 12:47:53 +0800
Message-ID: <20261115044755.395888-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_204804_808907_319C08B5 
X-CRM114-Status: GOOD (  16.27  )
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

The DP PHY is optional: the Rockchip RK3288/RK3399 eDP controllers use the
built-in PHY of the Analogix DP controller, which is programmed through
the GRF registers, so their DT nodes have no "phys"/"phy-names"
properties. devm_phy_get() therefore returns -ENODEV and the driver logs
a misleading "no DP phy configured" error before falling back to a NULL
phy.

Use devm_phy_optional_get() instead, which returns NULL when the PHY is
absent and propagates any other error, and drop the open-coded -ENODEV/
-ENOSYS handling and the spurious error message.

The behaviour is unchanged for both CONFIG_GENERIC_PHY settings, because
the real implementation never returns -ENOSYS:

- CONFIG_GENERIC_PHY=n: devm_phy_optional_get() is a stub returning NULL
  (devm_phy_get() returns -ENOSYS, which the old code mapped to NULL).
- CONFIG_GENERIC_PHY=y, no PHY described in DT: devm_phy_optional_get()
  converts -ENODEV to NULL, exactly like the old code, which mapped
  -ENODEV to NULL in its open-coded check.
- CONFIG_GENERIC_PHY=y, any other error: still propagated, as before.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
Changes in v4:
  - Rework the commit message to explain why the behaviour is unchanged
    for both CONFIG_GENERIC_PHY settings, with one bullet per case, as
    requested by Luca Ceresoli.
  - Link to v3: https://lore.kernel.org/dri-devel/20261110023721.2014061-1-jerrysteve1101@gmail.com/

Changes in v3:
  - Add missing changelog entries and reference links
  - Link to v2: https://lore.kernel.org/dri-devel/20261013134659.335829-1-jerrysteve1101@gmail.com/

Changes in v2:
  - Added comments to explain the changes made.
  - Link to v1: https://lore.kernel.org/dri-devel/20260924020417.868588-1-jerrysteve1101@gmail.com/

 .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..637b1bff0f6c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->phy = devm_phy_get(dp->dev, "dp");
-	if (IS_ERR(dp->phy)) {
-		dev_err(dp->dev, "no DP phy configured\n");
-		ret = PTR_ERR(dp->phy);
-		if (ret) {
-			/*
-			 * phy itself is not enabled, so we can move forward
-			 * assigning NULL to phy pointer.
-			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
-				dp->phy = NULL;
-			else
-				return ERR_PTR(ret);
-		}
-	}
+	/*
+	 * RK3288/RK3399 use Analogix DP controller built-in PHY,
+	 * no extra PHY configuration is required.
+	 */
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.56.0


