Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5300C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slxSVxHq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=b0Pa1QP0;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zakirKc/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=; b=slxSVxHqJlf3RE
	nPg/15MlkYiwRc6xhiBjX8r2ybPGoNsbWo9VEVWtDuLwRGoI5H1IxWUIvGiWWGhLjiVrexODXMw7w
	vn6K3mFRHmDFckUMANptgKPVFHNvxrZSghKrW/TF7BdM3z/+RHgUwzTE+zqTN7aHw3m4/o7tuNiNO
	9aAaOnA1On7j5U7FgMJAT5vN4400ccIQ/PAtdxBq1eSm7Wh+ILRy8IfBy+kz/C8E3XL/uQRwMYVGZ
	4ZHeRb/ka6kU11aZ68wE3mcgJ5zt+MauPCeLyeSCGn5cUgzzdEDGcnV1QyIWcegnEKBH9Ah3sh+bk
	g0oZsbA6trJSM8Xb2Vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzq-00000003jw0-0jhn;
	Mon, 23 Nov 2026 14:26:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzd-00000003jln-3qug
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=; b=b0Pa1QP0bFcmiAechIubnOktnp
	4CjkJHRApAXhUyuHduWbdnoZ4wlSLnoQ5qXAd3MAfIDYPGGH/NtfQhxv2ucucdlh3xP2NimA6QeHT
	2EV+EZuu6Iiraok6OSWKFUlGnZLPNujQRH4ZEeQ45aiCPD7REqi9VeJLkl2GwxhV74a2sRSGwmIjP
	1JT/9lbfXd8W6PYG5kW0qL5cn9uEOz+v0Pgnl5SqTlvmoiS09kxqw5eOSyVSvVFUySu3iFBzp4BMu
	49ZbC2PN1N3dC+J+geqaQTUL6jZnRJ9EvzYkgOIhrPodd7XczYe1CK9AC2mk40voWrVzhfrISzJLe
	gshCfGUA==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzY-00000003EcB-0aoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:26:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso565297066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443956; x=1796048756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=;
        b=zakirKc/NHQ+4xekvq9XWwbUjVcpkzB7CwzJRFFEUmfHBAkB8+i4/f6IUJ9ceNv1kT
         osidYf2viUcyNZBx92qjPQGv9MGmGA8m571inQT9TdP/Klxd1nc7xkfiHjkrvTsZTyTi
         UvZ/RDkixSWNr4jo3du4HCKf6R4KgiP9qCJ5pT4NiAY8khGBlqqIAceKisd6F7kuQiTz
         6NCXHjSQnLXZ0hWjmLbHO28vLoeDh/HmpK8hcDRcy+4oepTiQ/5J+jAiIno3l1Fgi71M
         q3N80jEVuh/rgBZ+HVd90Q/zsq2xoWHNSXkNFUcBHp4gbpIiwsqaopjejPEZ7mxv3mJB
         s0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443956; x=1796048756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=;
        b=CIHqllfMOGZI4B+O+4fyqrGUl3g68h+u2lhZldU9PfGbLunr3YNOvFMflNcn5lKups
         FM/5nltwEUqudTLeGbj2FRUP+z1/BxdXe5pbKyCq9rfDXWxKQmxxKgdY1nqxisrbVrFX
         XYeEnnkM+pE/xC5mMt6FQ8VO0Uebsi1Tj80zY8jlwU5YQB3iuaBy2tfgFgf/UkfUTCvR
         Nao9KyngUdqMnqxAYzUFZ5ucwpwkH04EZIcNjjp/93p6l7bCBSmCzijNbUe+9RlTpFdC
         ccHPI/0w7ADMA/h5C+vydQt+hT936DBx1PRtA31FcYBx2aVQHnPdVLmVihLSerxKIYLy
         7DpQ==
X-Forwarded-Encrypted: i=1; AL+hErHBRbO47AfV9PbOFZm+HEIgDdsn0QQ49buLFc40sA7kPSqzFzl+XkZtl3XknyK9KgtG4FJVGnTwdC5P3gkbxbY0@lists.infradead.org
X-Gm-Message-State: APuU4Z9Dd7mE2pRWRmcBcwdhnkGKEFCP8N0bTA3g6NU0tFPZVVCye/lg
	sYCCjZePUFEvxflKFMc2vhhsg5O7a0boC2VtNkm95NWGhFjZiVwS5oZIIHkx4f54y4E=
X-Gm-Gg: AZFdTZfknIugEqWGMSs2dMzvQKejzhtADJBS5bxAlY25vk90wJr4DUJzbeEo6wmfyP1
	HXwkTAixz7227tYtpWX+vdwQo2M2J7OjnIK6yUGoF06Lz/vvMEu97XlR2G+PaU+mozhufntviAA
	OVPoizftLCL/0HgxIeWExQ4O0X3ucRpmwl9vvbTF5QHTFuon0XoCnxNQuo05xfqjlkcDiEOP1JU
	fHUsbdAwH8FAfp+r26WEQ27qRcdviMOSLRsL8VY9rM+m4DksXtzQGbyZSxrSSz7G/OO0P/uiZf8
	C+9lEpcfREMgTjLzyalM4yMvDlJtMbvT7H1uTKEfIBLtGDDu3kajekyqitCyZzY9bunhzwnqipA
	rXEsX06oa6MFd+eA8bEW0YleG50Tt0sHMAXIoikQxy/IewTx1IDOK+Gs6/0mStACFNwCOsHm/wR
	9kvuCqUjqLzGZrmERp/SFK864odmqt4BoivGPhHt7WCeSMxlFCmRKkihLhNcNcD+jFyt1jUDe8t
	AZ14n8vt9se8GWZc0qOT+wrsmFFlaHu+3gyjzlA9DWutGH5WAwqyBNq9H5oo//Mrr+SALhMEnQx
	yXwXLc9WcLscYmWG3q07yUSXjzVhkVxvJh6mhM4OdFig45wjAde2qy5uMvT7tiiQKtEKlw34+eZ
	VBS5cRlm6azKzv0jTDw==
X-Received: by 2002:a17:906:8cc:b0:c50:933a:e12f with SMTP id a640c23a62f3a-c513a8669bamr567298066b.27.1795443956033;
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 14:25:54 +0000
Subject: [PATCH v2 1/2] phy: exynos5-usbdrd: gs101: re-init PIPE3 on
 orientation change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-gs101-usb-phy-orientation-v2-1-3361fa5f7543@linaro.org>
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
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
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142601_867428_3D352BCB 
X-CRM114-Status: GOOD (  22.67  )
X-Spam-Score: -0.2 (/)
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

Cc: <stable@vger.kernel.org> # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Cc: <stable@vger.kernel.org> # 6.15.x
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

-- 
2.56.1.750.gf70dc682cf-goog


