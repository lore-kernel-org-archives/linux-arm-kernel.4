Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D3A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yf9kfhhV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MXr6jeQQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVGKCHDs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yC0KWfjZslDYmreM0nokc8PEJN6eo4m1n8xq79uDONU=; b=yf9kfhhV1glcvt
	6tKoGBo4U3ZwH6XTEx1h+0PS3l/pH7WfjCHE7feXxN0ez2nvQBawbyXmKv2G523U1C3obGF8IPGTK
	WVYyylPIA+ZO8ZDaarHdP7ByIKCIx/oXNT0OZgwj5dpR5nprhyr2yU+21i+sDK9RkOvK7JyABDStz
	p5ZEW51ff8e1wwCiOrFbZjo4gWWuLfvrgoUc2iuzONPmsNIhTUe0rod0bAr1O5lNz5OaP7iaHQmgO
	ejxAYdygGbDxcqlsuOHEzMEb/hquGqevmzWv5jHH6uMyXgtL3IO++GVz54+Fx922+14DHmIiYoJGv
	VYx8aDXChhnx9ednvv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lS-00000008Oxo-3piL;
	Wed, 25 Nov 2026 04:37:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lE-00000008OoY-1hHH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 04:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yC0KWfjZslDYmreM0nokc8PEJN6eo4m1n8xq79uDONU=; b=MXr6jeQQH+3Ttus4zvtsQkhsR6
	eYenaVtppBO49kz7ZoYvtndW5VbruCcrifDY43/MHIL7R/uvv1dXwWm4MMnAzV5og7W7CyPd0KZdC
	ENb78CW4bGxE+CK41j16I2oGwUuelww46G/EqJxCkbl4Fkt6/wKof581//gOyQs2b4wOwsgknTMHU
	G+nO0f+2z09reiPomSHwQq+lhprt/JtQsvWr1PEmqHOOphPBZOP4Hd1mhLuYeViDjdzxk+om5RYLV
	NloyPlH6lUz+GMyd11mLxp1tHEc3T30Qz/KniunLahBOO+VUVl77oozroch/6WNPyorV8i3ClSaw3
	jw2cmC+A==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lA-00000003gzU-1xz5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso2390685a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581449; x=1796186249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC0KWfjZslDYmreM0nokc8PEJN6eo4m1n8xq79uDONU=;
        b=wVGKCHDsbUmw1sj3cBr5tDJ98zV0aPWmKvShnqyRIpoRrqVhvH5RhbxDnhG+Y2I9d1
         Wx5ZPJhn9rdEbeEbgt8eUG8Z2kuGN9W9Exn2swCtLDy2TYskIOjnXZtwneV2mt/iHT1s
         xgRWREoLqAzn9/g5mHuuqT6j/E2mHQ+mRHav9VJGQb7usij/NTOAmq3jY1KLEKOLZ/Vf
         2uQ1pgumatxHfF6d87BChTYjV6ZR8M5vOS3O6kMGskYkKzY1jI4sKrp9vkeluT9nAk/Z
         OlvZy2QskQWb/H5V12/pKnKR2kuk+AxtlEEtxOt8rj5NN2t3AC7pp7PeWarXoDTbOmrz
         bwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581449; x=1796186249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yC0KWfjZslDYmreM0nokc8PEJN6eo4m1n8xq79uDONU=;
        b=ZscF1OVBEdbOEJ04O8SNDLlskeEdSSIMJajQGesei0mKc/Rf376UfBIlCy3bgW8+HQ
         C/OnwrSUPBudJDHUARFiRzIkOPMrUUx/hSsUnHr/8gB5L5dvT3fXRxpbQpC/q1GPC00b
         kRzj1FHQ/K4Mmb1mMNBe2V9kBSq1VM1KUUzd0RVJjj0s25lSyGKeLFQs5i8FGUpk+QXi
         KhrCj1AEigw9eMwxuc70rQZ/8DqCUXOhpddJKIZzd2SNNnlHdnGWNStngpZDm4m8Q8B4
         C1S2FTmCKdT4ku58iznVNujo0JuOcD6jsOU0qJcqbcJxVDprbOdGk6rYKcPBGEAnytDY
         hfiQ==
X-Forwarded-Encrypted: i=1; AL+hErHDGe8wJ1nE+x3vrzYSKIHCMDXMK142RJj+5V4Vlij4SABAJwqxd3VGBXpgMxrf8Hu0ie8xiszKkKVEIUbNAN/j@lists.infradead.org
X-Gm-Message-State: APuU4Z/hPtXYPsmOxZ00M2KADsaCkR/sWyL8jPq4idvnoAiqc7aWtJZZ
	RbgiBqLdkWluYFCi60Ce+eRCRWIaSYqDKDxReYBvsREVUE2xJ29m5Nbw
X-Gm-Gg: AZFdTZfH1h/0yzQUCat62DAMFCVVXOoCl8MUQGRCk+UEGOSPpXYQKaY4m2cwgNyg06D
	a2FbHxxvCjbSZsIuDBRS7pvw9LYzqPx9WNKx4yMMbVKTVkBPFKFlt7FyacpkHB9mATgAjGCaXsE
	ecvUfgVsKr1jsvoT1YDcYxA8Zr/RAtGi6eeC8fFFLzRERshUdhE0gkUltECZ02erS7pQo+EmQEd
	JVN39jyOXfqx/8WUIFHnNBOH4wPtla/DM1R+MyjxMR+OwTzLCMHE9prmtLd15CcfndMqwp5Ar6N
	TWLn5s6nNgr3KBr2oPwjdtHLqojX7gJhfEtEByy/NhDy+HkE3vTwz9Lhy0pr7h4ELypseXhHAAx
	+eARDNJVNsSOnajzT6SDvDFncxU6H9OvkIbEcwTiJUt/rkQlS/n/m9VUDpsKI2WtfYZ7bgppWv+
	ZrwLTrzBCPF07JXuiEbR4v+cPgak6Y1KhhJ8+pv/GLLLTSg+Z/ckqYzf+qhcw5/PKHzIHEJMIRk
	YvflafWcPVWMbhdhwMTwoqYD0+d+73BWUKn5aayz8O/p+HUK3yRqCTxJcvo5UqCbl347M0LGrKH
	LawhrI4VDP5wCiqRL1N212KKml8=
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr13992683a91.31.1795581449240;
        Tue, 24 Nov 2026 20:37:29 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm9985129a91.14.2026.11.24.20.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:28 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/8] phy: core: Add phy bulk data helper functions
Date: Wed, 25 Nov 2026 12:36:35 +0800
Message-ID: <20261125043639.249525-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043732_633629_4346FE54 
X-CRM114-Status: GOOD (  24.91  )
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

Add several helper functions that allow drivers to get several phy
consumers in one operation. If any of the phy cannot be acquired then
any phys that were got will be put before returning to the caller.

This can relieve the driver owners' life who needs to handle many phys,
as well as each phy error reporting.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 301 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  38 +++++
 2 files changed, 339 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 5004d28b167a..87a317a144b4 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1100,6 +1100,307 @@ struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
 
+/**
+ * of_phy_get_count() - Get the number of phys of a device node
+ * @np: device_node for which to get the phy
+ *
+ * Return: the phy count if successful, %0 if no phy handle is found,
+ * negative error value if error occurs.
+ */
+static int of_phy_get_count(const struct device_node *np)
+{
+	int count;
+
+	count = of_count_phandle_with_args(np, "phys", "#phy-cells");
+
+	if (count == -ENOENT)
+		return 0;
+
+	return count;
+}
+
+/**
+ * phy_bulk_put() - release a set of PHYs
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+static void phy_bulk_put(struct device *dev, int num_phys,
+			 struct phy_bulk_data *phys)
+{
+	while (num_phys--) {
+		phy_put(dev, phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+
+/**
+ * of_phy_bulk_put() - release a set of PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+static void of_phy_bulk_put(int num_phys, struct phy_bulk_data *phys)
+{
+	while (num_phys--) {
+		of_phy_put(phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+
+static int of_phy_bulk_get_by_index(struct device_node *np, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].id = NULL;
+		phys[i].phy = NULL;
+	}
+
+	mutex_lock(&phy_provider_mutex);
+
+	for (i = 0; i < num_phys; i++) {
+		of_property_read_string_index(np, "phy-names", i, &phys[i].id);
+
+		phys[i].phy = _of_phy_get_by_index(np, i);
+
+		if (IS_ERR(phys[i].phy)) {
+			ret = PTR_ERR(phys[i].phy);
+			break;
+		}
+	}
+
+	mutex_unlock(&phy_provider_mutex);
+
+	if (ret)
+		of_phy_bulk_put(i, phys);
+
+	return ret;
+}
+
+/**
+ * phy_bulk_get() - lookup and obtain references to multiple PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets each PHY using phy_get(). This supports both device tree lookups and
+ * non-device-tree lookups registered with phy_create_lookup(). The caller must
+ * call phy_bulk_put() to release the PHY references.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+static int phy_bulk_get(struct device *dev, int num_phys,
+			struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].phy = phy_get(dev, phys[i].id);
+
+		ret = PTR_ERR_OR_ZERO(phys[i].phy);
+		if (ret) {
+			phys[i].phy = NULL;
+
+			dev_err_probe(dev, ret, "Failed to get phy: (%s)\n",
+				      phys[i].id);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	phy_bulk_put(dev, i, phys);
+
+	return ret;
+}
+
+/**
+ * of_phy_bulk_get_all() - obtain all PHYs from a device node
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets every PHY referenced by the phys property in index order. PHY names are
+ * read from phy-names when present.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+static int of_phy_bulk_get_all(struct device_node *np,
+			       struct phy_bulk_data **phys)
+{
+	struct phy_bulk_data *phy_bulk;
+	int num_phys;
+	int ret;
+
+	num_phys = of_phy_get_count(np);
+	if (num_phys <= 0)
+		return num_phys;
+
+	phy_bulk = kmalloc_objs(*phy_bulk, num_phys);
+	if (!phy_bulk)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_by_index(np, num_phys, phy_bulk);
+	if (ret) {
+		kfree(phy_bulk);
+		return ret;
+	}
+
+	*phys = phy_bulk;
+
+	return num_phys;
+}
+
+/**
+ * phy_bulk_put_all() - release and free PHYs
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to release and free
+ */
+static void phy_bulk_put_all(struct device *dev, int num_phys,
+			     struct phy_bulk_data *phys)
+{
+	if (IS_ERR_OR_NULL(phys))
+		return;
+
+	phy_bulk_put(dev, num_phys, phys);
+	kfree(phys);
+}
+
+/**
+ * phy_bulk_init() - initialize multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to initialize
+ *
+ * Initializes the PHYs in array order. If an initialization fails, all PHYs
+ * initialized by this call are exited in reverse order.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = 0; i < num_phys; i++) {
+		ret = phy_init(phys[i].phy);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		phy_exit(phys[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_init);
+
+/**
+ * phy_bulk_exit() - exit multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to exit
+ *
+ * Exits the PHYs in reverse array order. If error occurs, all exited
+ * phys are inited again.
+ *
+ * Return: %0 if successful, or negative error code if one fails.
+ */
+int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = num_phys - 1; i >= 0; i--) {
+		ret = phy_exit(phys[i].phy);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (++i < num_phys)
+		phy_init(phys[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_exit);
+
+/**
+ * phy_bulk_power_on() - power on multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to power on
+ *
+ * Powers on the PHYs in array order. If a power-on operation fails, all PHYs
+ * powered on by this call are powered off in reverse order.
+ *
+ * Return: %0 if successful, or negative error code if one fails.
+ */
+int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = 0; i < num_phys; i++) {
+		ret = phy_power_on(phys[i].phy);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		phy_power_off(phys[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_power_on);
+
+/**
+ * phy_bulk_power_off() - power off multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to power off
+ *
+ * Power off the PHYs in reverse order. If a powers off fails, already
+ * power-off phys are powered on again.
+ *
+ * Return: %0 if successful, the first negative error code otherwise
+ */
+int phy_bulk_power_off(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = num_phys - 1; i >= 0; i--) {
+		ret = phy_power_off(phys[i].phy);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (++i < num_phys)
+		phy_power_on(phys[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_power_off);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c480d6cb42c5..c170d9aeeeb4 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -83,6 +83,18 @@ union phy_configure_opts {
 	struct phy_configure_opts_hdmi		hdmi;
 };
 
+/**
+ * struct phy_bulk_data - Data used for bulk phy operations.
+ *
+ * @id: phy consumer ID
+ */
+struct phy_bulk_data {
+	const char	*id;
+
+	/* private: Internal use */
+	struct phy	*phy;
+};
+
 /**
  * struct phy_ops - set of function pointers for performing phy operations
  * @init: operation to be performed for initializing phy
@@ -313,6 +325,12 @@ void devm_of_phy_provider_unregister(struct device *dev,
 	struct phy_provider *phy_provider);
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+
+int phy_bulk_init(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_off(int num_phys, struct phy_bulk_data *phys);
+
 #else
 static inline int phy_pm_runtime_get(struct phy *phy)
 {
@@ -584,6 +602,26 @@ phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id)
 }
 static inline void phy_remove_lookup(struct phy *phy, const char *con_id,
 				     const char *dev_id) { }
+
+static inline int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
+{
+	return 0;
+}
+
+static inline int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys)
+{
+	return 0;
+}
+
+static inline int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys)
+{
+	return 0;
+}
+
+static inline int phy_bulk_power_off(int num_phys, struct phy_bulk_data *phys)
+{
+	return 0;
+}
 #endif
 
 #endif /* __DRIVERS_PHY_H */
-- 
2.56.1


