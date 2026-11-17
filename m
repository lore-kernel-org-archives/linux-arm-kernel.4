Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tjKRuMfM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ry3P135U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=; b=tjKRuMfMAWrrQRUExLA+sFJuUO
	MZm3bMSyJO2FMMMM+4a1yGejKsL5Bf+sblDdGrrTXF9tkn8yZ+0fFTopzvJVSln1mVhdM3YsNGZJL
	SNGns7aweasJfTe/QPdfFwQxfx6vH1OgZhQFF6IZ4oJPiFcdtOAZydDBXWnIXb7+GhncLTafP0noJ
	zYh5/fgX95GMKwYRLOLdZkdYEdi93S5LV2r7sTp/Gfkz9KYQeOH1q3xUGyWOSQsQ1MF5zmYsFijX3
	yp/VdfZUB5VA/uY4p519wCcund1m0w8WIGU+eUsK2Oy8wu6s2eMweTmZvXCwbUjAPAbCgwroZUhcm
	4hqDZ5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNM6-00000006hCI-1txx;
	Tue, 17 Nov 2026 17:52:30 +0000
Received: from mail-dl2-x06.google.com ([2607:f8b0:4864:38::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNM1-00000006hAy-2n4Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:52:26 +0000
Received: by mail-dl2-x06.google.com with SMTP id a92af1059eb24-1b3a6a69818so8151c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937945; x=1795542745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
        b=Ry3P135U8sVS9neSCx9AgoAgTpp5qXbT25Jdocn3lptdy9UZyeDt3GjVrkynG3Ebhp
         FexF1QNtgpzZl5HQ+12ffSK2GJZ1vKPw9+DwaATY4kf1Up4jJpjJueH5Twb2H4L77WGx
         veTc2dAj3bNLCZiJSp/MMuHGScgQQvds1ybFW0ASPxNCIIxJrXFRnuLHru8D1hhVlho1
         OwVjhibBJbLCUO+B3eCQ5beEH0L8YzVbOgTLhm8gpMk355k7U0ak4rQdYNo+Ddh1Z0/1
         reIX/AKVcTHYPHLbS5NeXYUIWBnCXBnR/cNqlWvnCLlXpEkbYzYxhk5nYgbTze3h+dRz
         4fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937945; x=1795542745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
        b=Xv3Akmrygh88rUb5fGZ8HuSe7vu7+iRnG42zwbWeGZ4FkPOzI1trlQ2a9rnlCxhcAZ
         90rjYYvhLYpcyK9ME5cNs6JTPVW5L0bpCWb74g7K6OCPlb0MKPuvOQcPGAsFM3LJsSia
         j/fql633YgDmYJAYJ+QhxvYqozBDBW4omfhJqP1rlizyHeKkEPSWOk5ujCNNe5wTlTsA
         CxNQMOGK/bDR0HbkdbqEmabdjWSLQB3R8odOb8gKNbsNsBJno//t1x75XCK0/Anyigno
         s653aUMrYfGZ1uG9DsKvhlkJISKKA0D0K1yFs6Q1lazoIjAkBddpGAhpSJZ0sgEZ1X9g
         HYqw==
X-Forwarded-Encrypted: i=1; AL+hErEr/DEJpDULsr7GMiwk1OpCQ3qqUrrZi7yuYDx2+uev9knOOcrihL1epvefUXNHgqHO6GeL/6l2XJ15IMPCXKOw@lists.infradead.org
X-Gm-Message-State: APuU4Z95xHvUtO//ytGB9sXG4gETIXnP67j2BC0eVSrL96kyR1YCNKfv
	mfRMW9KPae/y8Yx15JsD1EFyVXbak0Nf3maUkDXNmsXRtTpRIonfOCV0
X-Gm-Gg: AYBFou15LcgK0T5jI+zDv5pty/D8fv2Rt8DU43mhJLOOSWW2lUoG5wStVXMo+SlCty8
	e9dDGsVi1XyzOPlu6dhLo4SYqJ5QRZdSvQoB2ENNDDcTuqN0CgLDJ4KQgOBhE08k2y69K/sZBxF
	lB2u5CPu9rtCRUG1jAXOgf/CNIoAmwKJIQAwuQnGEmKAhUHqHK8tPCbfXagTmKXjWkudFSdUBM8
	4+nniOPvUvwfseaxLlgX5ksTcvqEBCjzXXxlPlpEB3qgtC0fZlOfN7ONkrgrztSjuDyVXwn/Eqr
	fFBM4JBfPfe0PyuRHMwEN3K/kCdJnTerQX7oroJikO4Flskabh1TrusEtRAKER57jtYd3DbRD3g
	6C9EQSNYBRaJtDocpdyeT5GtvTZTcU7OQrAdTgjH+rA65iJJQNQhaVFVjasj7lE0d7B8QW3q9DC
	jX0bBPpON1upPO3KT1PkNpedB4FASBih7/bTzLiUppr3iVVlQPP3qJG+DCk7+pxzK5uba4HQFfU
	zHY3+nzVTvNQpD2tx91+RNSSF35ZlT+u4hG0t+opbnCnaqFhgjJWCji2iLdkuGXiQKh5omyLD0H
	x1T40e9VvxmABQmxxrKfjOBhMrKVWw7Zr5OeOZrSbxFat9o1kSDX5fuprsvfpM8XQzPu74jrsxA
	pYGIV
X-Received: by 2002:a05:701a:cccb:10b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b543d32f1cmr240596c88.33.1794937944414;
        Tue, 17 Nov 2026 09:52:24 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm38272460c88.13.2026.11.17.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:52:23 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v5] net: pcs: xpcs: make supported_interfaces authoritative
Date: Wed, 18 Nov 2026 01:52:15 +0800
Message-ID: <20261117175215.3015703-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_095225_740258_23642A57 
X-CRM114-Status: GOOD (  18.32  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
SGMII and QSGMII in hardware, but does not implement the C73,
10GBASE-R or 2500BASE-X modes that the Synopsys compat table
advertises.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, build a platform mask with the three modes
  supported by RK3568 (1000BASE-X, SGMII, QSGMII) and intersect it
  with the core's supported_interfaces using phy_interface_and().
  This narrows the mask inherited from the generic compat table so it
  reflects the actual SoC capabilities.

Note that QSGMII is currently filtered out (a no-op) because the core's
compat table does not support it yet, which demonstrates the intended
filtering behavior of this intersection.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
Changes since v4:
- replace DECLARE_PHY_INTERFACE_MASK_ZERO with DECLARE_PHY_INTERFACE_MASK and initialize it to { 0, }.

Links:
- https://lore.kernel.org/all/20261029094916.3127193-2-coiaprant@gmail.com/ (v1)
- https://lore.kernel.org/all/20261029102728.3189359-2-coiaprant@gmail.com/ (v2)
- https://lore.kernel.org/all/20261102212506.3348537-1-coiaprant@gmail.com/ (v3)
- https://lore.kernel.org/all/20261110160554.918652-1-coiaprant@gmail.com/ (v4)

 drivers/net/pcs/pcs-xpcs-rk.c | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index ad187fba4e9d..e0057545329a 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -480,6 +480,7 @@ MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
 
 struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
 {
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces) = { 0, };
 	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
@@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
+	phy_interface_and(xpcs->pcs.supported_interfaces, xpcs->pcs.supported_interfaces,
+			  supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3


