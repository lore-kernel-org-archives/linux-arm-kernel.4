Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BDB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uOzSIYxS;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YCQfi5AT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=; b=uOzSIYxSaba8wZKQRprqhglHhn
	JxTgzDneySE7aXkd0f2DdUMYt/5az9C2WRRCGFqgnDT/bVM+T6j/Czuts6R9t4laLGuMcR0Lut57+
	MTj4962q5s7UXz2GgmPrChOLXS+ilx/J03BPqFCU2/O7uQOrmpFyikw9snfGCZa4KtNs+OiK9IcFh
	LPnwJLKBMtnIx+I/XQMjcDIKiC4sCT6hYC7e0LLclPuK1ctEgYUe9EEcZl5sqfdRdQOncn/tMPP+B
	c4QbJerga54GnGiDqXgxdY1nvw5vqCedqIhhkzt9YQmhDxyUsjbgS/oCMpKdFNZF2YIkxDGt64OYn
	mSrfPA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7eH-0000000DB8T-2AII;
	Thu, 19 Nov 2026 19:18:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7eC-0000000DB7P-27w1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:18:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so126527a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795115894; x=1795720694; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
        b=YCQfi5AT0vXrA1rVY3c49xu0HxsxqpjH7Eqw9+K7q+X55LsNyKyvAGkxNYULFSnOth
         QfKy/7KrHp9kJoawWnNSxvmJdnDGIJfwaUSEFJeoq8PtcAcYvjmWD2+ZzT6vDj6OvCKI
         d4vQuR20TTK6LHaMaFsYuahs3PgmqPMmOMXU82w1k4g9JyQdsyBBY75aliuuxZ25opir
         b8AKybGFw2Y1u8KjlShRUvK6pP3NDhf+d2Ns3vkH+NHjuJECsJSI19GMxuhK+enaQl+x
         E5NEGyOn3da+DnLElkxFDcHthkX9knk5qHuqaY0J6re9keTHNcOoLViPMJtB9F+Wh623
         pWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115894; x=1795720694;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
        b=GP0Z9Hf+yeT486gp22gYg0P9garmXw49ar+beiDdcKqG19xacgfyVmrZa6q5uvTCRr
         ulJ9SY9YLID6J43ZjX8D61YTijZCTJ74dCUu6i2t3PUrCfpzxjPK/cMX6zNGWUfj9zJa
         j+hNE3GJSUjyy2vYacOz9IedL9IhUgwQzlRZq8sfvco8az/wI7WN/OYKrfXmVx+umACv
         TWt2ppKTPj3cOqt1bHBv1DXBYryD0NorvyWw+aUiPoBv/Wx9kx9KbdvSr65rmN5vytJ6
         AmxzFw8SNmdudSC31cis/wiqxh3AWysh9h+PxEeqCLF9zRoBDsnonPkJZDfejjmIzMoC
         /EBQ==
X-Forwarded-Encrypted: i=1; AL+hErE2o9XI2Sst152eR5hkCopjD3zf7eYzPYq0YHSRSSxxU95lQ5+QdowWDai2eqr9tVPEUsjoCGSL0NxXyOCjqmcK@lists.infradead.org
X-Gm-Message-State: APuU4Z8iy/iA6Cab5TZxSKiTbPHpO9wDAqqIGwavBOlSVGnA+1kCrX0O
	jfCsXkOddLife7WA6QzjXYiQ1t7d8NJVKVluiLa2sD2lR2PVi4GWon2iAQFeEzxgtSA=
X-Gm-Gg: AYBFou2ZsNj/AOx/gweAV6LmEpr9pyOL9jyLcKmU3PtPn5q3p++yE8+UifP8oKbJyuf
	cboue6PSM0C1IP1lM8xsjZ0y1/kGQFC2Nc5w9vVK5jUAFuPVaA2lWfOBSQ70iCTZipLIubL0X5s
	JEe5EZXyZZBSCjQiYXpCuLB4pU8bYcMBFbzGmMLy0nQVIwJP9pGJI+Gaen0z0EDrWuP1oIPjL4Q
	nPwUaWhJwT0y9DNwdmKSPxgDuBbJn9ZiqI1HmLE/NSJSnwhZopwHxDUfKMYXprQKVxBzc9FZRFr
	ppS+U3hRS2EdgvYc61VcNAx3PbPdeVdVA3TLvF2AlrT5mUH1Jw0Lmryy9NUY6CfcVbu/9Y2U8zO
	v27+x+WKz808o+KjVCoD8N/kLyLksqOoJ2378jn9tljKzwlsbgh1Vpz4WA/9FviU3pj3K1d6mLS
	UvbeO4XKOS1wU37G1vJ2/AZ8eT0ZWgH5b69QlyRJ15DZfigZEZkKTcj7CVR6ZCR7136fkqasrQY
	+covEBCw2iFu/dmcg9Yo8AyvwyG3hIymeGdeakJul5W2DTxBOYUq5TJZoX4x6smRI9yzKixvixr
	HkCXrqmrkKO26D/utsqXVKFzt4n1Duo/U3RwNF5hMP8C9EIZdowKpMk3pPGLBaTqRfOeBTqJAjI
	/+kS60+TCPz0mYmnZMyZZo0/dQB19BC0ZeS7hWKE=
X-Received: by 2002:a05:6402:540a:b0:6b1:c5c3:9624 with SMTP id 4fb4d7f45d1cf-6ba37e75559mr319355a12.22.1795115894304;
        Thu, 19 Nov 2026 11:18:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm217651a12.8.2026.11.19.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:18:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 19 Nov 2026 19:18:12 +0000
Subject: [PATCH] phy: exynos5-usbdrd: gs101: re-init PIPE3 on orientation
 change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-gs101-usb-phy-orientation-v1-1-bf3c4bbf328e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHNL/2oC/x3MwQqDMAyA4VeRnA00pYjbq8gOrkvbXKo0Thziu
 xt2/A/ff4JyE1Z4dic03kVlqRbUdxDLXDOjfKzBOz8Q0QOzkiP86hvX8sPFcN3mzRSGEOOYKCT
 nHZhfGyc5/u/pdV036x4sgmsAAAA=
X-Change-ID: 20261119-gs101-usb-phy-orientation-44cc8f14f020
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_111819_617734_2E2B11E8 
X-CRM114-Status: GOOD (  21.65  )
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

The SS lane mux on gs101 is programmed only when the PIPE3 phy is
initialized, based on the Type-C orientation known at that time.
The orientation switch callback just stores the new orientation and
relies on the USB controller to exit and re-initialize the phy, which
only happens if DWC3 enters runtime suspend.

If a cable is connected during boot, the phy is initialized before the
TCPC reports the orientation (e.g. ~4.0s vs. ~5.3s on Pixel 6), so the
lanes are programmed for TYPEC_ORIENTATION_NONE, i.e. as if reversed.
DWC3 doesn't runtime suspend while the cable stays connected (and
runtime PM is forbidden by default anyway), so the phy is never
re-initialized and the link comes up in high-speed only.

Re-run the PIPE3 init from the orientation switch callback if the
PIPE3 phy is initialized and its lanes are programmed for the other
orientation. Rewriting the lane mux registers alone isn't sufficient,
the link still comes up in high-speed only with that. Re-initialize
before signalling VBUS valid, so that DWC3 only sees VBUS once the
lanes are right. A failure is only logged, so that the TCPM still
configures the USB role.

Mark the PIPE3 phy as initialized in the same critical section that
programs the lanes, so that an orientation change can't get lost in
between.

Also stop storing TYPEC_ORIENTATION_NONE on unplug, so that the stored
orientation always describes the lanes: while the PIPE3 phy is
initialized, they stay programmed for it, and when the phy is
initialized again after phy_exit(), which gates its power, they are
programmed from it. This avoids re-initializing the PIPE3 phy when a
cable is plugged in again in the same orientation and the phy stayed
initialized.

Cc: stable@vger.kernel.org # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Cc: stable@vger.kernel.org # 6.15.x
Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2186b745d58f..ccaf0f27c4c8 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -509,6 +509,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @regulators: regulators for phy
  * @sw: TypeC orientation switch handle
  * @orientation: TypeC connector orientation - normal or flipped
+ * @pipe3_initialized: gs101 PIPE3 phy is initialized (and not isolated)
  */
 struct exynos5_usbdrd_phy {
 	struct device *dev;
@@ -532,6 +533,7 @@ struct exynos5_usbdrd_phy {
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+	bool pipe3_initialized;
 };
 
 static inline
@@ -1713,6 +1715,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	u32 reg;
 	int ret;
 
+	lockdep_assert_held(&phy_drd->phy_mutex);
+
 	exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
 
 	/* force aux off */
@@ -1737,7 +1741,17 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (ret)
 		return ret;
 
-	return exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	ret = exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set this while still holding phy_mutex, so that the orientation
+	 * switch callback can't miss an orientation change.
+	 */
+	phy_drd->pipe3_initialized = true;
+
+	return 0;
 }
 
 static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
@@ -1783,6 +1797,9 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 		ret = exynos850_usbdrd_phy_exit(phy);
 		if (ret)
 			return ret;
+	} else {
+		scoped_guard(mutex, &phy_drd->phy_mutex)
+			phy_drd->pipe3_initialized = false;
 	}
 
 	exynos5_usbdrd_phy_isol(inst, true);
@@ -1880,8 +1897,48 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 
 	scoped_guard(mutex, &phy_drd->phy_mutex) {
 		void __iomem * const regs_base = phy_drd->reg_phy;
+		bool reinit_pipe3 = false;
 		unsigned int reg;
 
+		/*
+		 * The SS lanes are configured during PIPE3 init, for
+		 * TYPEC_ORIENTATION_NORMAL or else as reversed. If the PIPE3
+		 * phy is initialized already (e.g. the orientation is only
+		 * known after the USB controller probed) and the lanes have
+		 * to change, initialize it again, before signalling VBUS valid
+		 * to the controller. Rewriting the lane mux alone isn't enough
+		 * for the SS link to come up.
+		 *
+		 * TYPEC_ORIENTATION_NONE (unplug) isn't stored: while the PIPE3
+		 * phy is initialized, phy_drd->orientation is what the lanes are
+		 * programmed for, otherwise it is what the next PIPE3 init will
+		 * program.
+		 *
+		 * Don't return an error, so that the Type-C port manager still
+		 * configures the USB role.
+		 */
+		if (orientation != TYPEC_ORIENTATION_NONE) {
+			bool was_normal = (phy_drd->orientation ==
+					   TYPEC_ORIENTATION_NORMAL);
+			bool is_normal = (orientation ==
+					  TYPEC_ORIENTATION_NORMAL);
+
+			reinit_pipe3 = (phy_drd->pipe3_initialized &&
+					is_normal != was_normal);
+			phy_drd->orientation = orientation;
+		}
+
+		if (reinit_pipe3) {
+			const struct exynos5_usbdrd_phy_config *cfg =
+				phy_drd->phys[EXYNOS5_DRDPHY_PIPE3].phy_cfg;
+
+			ret = cfg->phy_init(phy_drd);
+			if (ret)
+				dev_warn(phy_drd->dev,
+					 "Failed to reconfigure SS lanes: %d\n",
+					 ret);
+		}
+
 		if (orientation == TYPEC_ORIENTATION_NONE) {
 			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
 			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
@@ -1900,8 +1957,6 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
 			writel(reg, regs_base + EXYNOS850_DRD_HSP);
 		}
-
-		phy_drd->orientation = orientation;
 	}
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-gs101-usb-phy-orientation-44cc8f14f020

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


