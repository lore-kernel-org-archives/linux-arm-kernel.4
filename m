Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56757606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fJhCpNyS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rhrjmgRs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKXhvxJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=; b=fJhCpNyS9Gjhg+
	kFzP5D5hx6tdoO44rEq1XFcqHLTwo3wXzev9rX5gpg0khgEBo6TUxnu02FYY6sC1i0UEX6pBwI2jk
	+45JlzZpakj7dtJt5K3FsGt1rC8wmY5+jfYexRttYYAcDWLBlzWtfv4ygIV0bLNfVFhEvNFGw6BIG
	ka5nrVXNOnZA6ER1mIfreoblGCUClgur1y4Z3onN4b1+FkyuEx+ry2E2pS3VP3IMu6y5vlN/2APVX
	zZLA3b3hqKJM8AJAFMzBcDdb2II0/k4q5GtdyAH7DQme9/lg9FufwD1GeNiG75ZhTtRRW6tGvOjre
	S+wW1MGJYwSiA0aUYc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lW-00000008P0P-1m1B;
	Wed, 25 Nov 2026 04:37:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lG-00000008OqG-3S2b
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 04:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=; b=rhrjmgRsVzBAKBrSZ3RwvFd49l
	3fWhlnfzBstp/jc/nmc3JTKLDAOADLKhcJRuBSYMERrjSUmmBKGxVO12CJ492cXeZNXPtxvOfV6xn
	ErBQ5zowDdMib/HOw9BsrscLaH8tjlTZ/sxUHSsaUl346qiMHgAbiBDM1Y/v/r2mBckrrwFReKAyN
	4noN5j4yVP3xAwMTUhIoariNcaSJg1neFXg0sIzifwQ36Mzs/V1THgRW5bNheatlSoblghdv7VppI
	dVW7diILDGBw8nAczF0duHVVEoykg16XkPixEXRUju2O/vXBIZ6H9YUUBk0guu40nxeCvRY7w6Ro4
	GaDYm/8Q==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lD-00000004pvC-0lTa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:37 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so3183973b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581452; x=1796186252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
        b=aKXhvxJtX7N7I8kvn/b2Nhwrqg7Vf+QB7NgGZMMB2WF+8hi9/dmqs+pHm3M8dUcDL5
         P9zawTA6oHRShW1T4fyw8E1yoDtRhUdDviKnjeD2zK/Yr7y5UkFLpmln2CV19ZRMFmSl
         B2IAUr/DtK6a+XXXJmNGwDOh1Z9Ij0C/Wfu2ad3s7pCIzmSlKc8dofBWtD7t2EBhIKY4
         YrX/X0s/8JIW5RL8t5je5LlQ+3YLc0jQh9ddVng+aIKI9zSp8wrklqzrCSpT8PEJ19no
         bnDln8T7tQ2RcfSje7e7G7fpn4YhJB6+UPga+GECvsAYleNOlruJQzHQxgtpRvLUTuGC
         7BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581452; x=1796186252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
        b=Ms/jZh5ofW1x5vAj/fj3gqJ88MLoe369oxnzH+5fq1LdQtCIRlG2LGBbtDh7t2sfec
         0DUOb6yrcnW5EhqlS9RiksWvWIRcBVrx9fIUYb2feh8D7lBeRSEkG9mN3LBSy3cemMKS
         u32wJ3kZ+zNpfLguBlwRk+TeThhCyueAHFo1FnMvTOxs0ukMLV0yGBdwS1swPkabVmkL
         Bm5Yj23tbXKvf/tDpkzRrVNyJJgLIJsVRvRZNLDc1nrtMchHohw0dsE3Jm9DzZApTBOd
         IiF86eTEMgA6LArVTbG5GVcfNp8EuFarhmCeAxL7UP92lA/1dJgw3jb+yMtGWcmt47y4
         Mjig==
X-Forwarded-Encrypted: i=1; AL+hErGw0meblvV4mOWBfKqCrE2eaf362Q8gpPZu9UV1wYQzYkOkBDckg8KsoVIXjIHr6Wzno8+fO9rQT6qgGBCCti1h@lists.infradead.org
X-Gm-Message-State: APuU4Z+35ZRMfIKDSVJ7b+58e37l1SaWxL/mES3H0/cNqAsl32eQ8uoV
	lP4REWwk9c0ltbttcEAoYTHfqYf06SrSJyfGJ20fE3/Wp6eTJHovFclX
X-Gm-Gg: AZFdTZdYxHyypKMuwuTxiWHTlaf0LdAi1F1i0ws604X0o9dyCjNw07WVezLs3HtK2v/
	KTWlpoSPiN2ZFaaamwNU9VLKZS1GxOz9I0PuuVAHRE2OcV1KsjeQFcsbYpT9fwqzJRBmeoaYjz4
	/9J/qXZU8xRzxixRzKnZprXJ2mw5JdCACx8ZiWjLksnKtglzUZBb8WpdyjZglLPkhbyLctLQSdC
	ZOKiCDyxQmfapDuPlcsr10aJquMzavSoeFqCQiS/FAqw42YvUKxKZI9dNxBN36hqgxaouQAERTn
	12i/iVs9f72dfxvKU1ZQsY/3fQbfrqCLOC9RC3118HfcTQ0FKDYmFDCSAK84BEHaFq1WnEsSteq
	DQzwP0/5Vu+IJrmlljrwsL0B7vCw6dlF7Wl3GagtltpxqURdSLoUK0zMTI8uGHyaVOmYvAxsdqO
	g+uo1Lw+ZjXQVIOm1YW4duURq9q6vqS1EPouY0crU9Wc039e1yDEAE7lleZoWakvp+NuY8JqTYX
	Gm+9bqV/yHDjTSGcjvaT5Q9Olf9ob+FwKCY1iYgcBD4sm4zeh3du+yGe1ZRpGwFNOku0872jbys
	Xe0Zxey8CcA6v2zIgywbGxBmJqJ7g0smagnHu/zgKAO7F6Vf
X-Received: by 2002:a05:6a00:4107:b0:89f:ed19:f0ba with SMTP id d2e1a72fcca58-8c7dd9d67bbmr11654419b3a.23.1795581452525;
        Tue, 24 Nov 2026 20:37:32 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1e2f3sm7882825b3a.54.2026.11.24.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:32 -0800 (PST)
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
Subject: [PATCH v5 5/8] phy: core: Add managed phy bulk data helper functions
Date: Wed, 25 Nov 2026 12:36:36 +0800
Message-ID: <20261125043639.249525-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043735_363027_DADB2735 
X-CRM114-Status: GOOD (  20.07  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device managed variants of the phy bulk helper functions. So
the driver can benefit from automatically managed phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 139 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  31 +++++++++
 2 files changed, 170 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 87a317a144b4..eeba1b899c20 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1281,6 +1281,145 @@ static void phy_bulk_put_all(struct device *dev, int num_phys,
 	kfree(phys);
 }
 
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	int num_phys;
+};
+
+static void devm_phy_bulk_release(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get() - managed lookup of multiple PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets the PHYs using phy_bulk_get() and associates the references with
+ * @dev. The references are automatically released on driver detach.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = phy_bulk_get(dev, num_phys, phys);
+	if (ret) {
+		devres_free(devres);
+		return ret;
+	}
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
+	devres_add(dev, devres);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get);
+
+static int devm_phy_bulk_match(struct device *dev, void *res, void *match_data)
+{
+	struct phy_bulk_devres *devres = res;
+
+	return devres->phys == match_data;
+}
+
+static void devm_phy_bulk_release_all(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put_all(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get_all() - managed lookup of all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * The function calls devm_of_phy_bulk_get_all() directly, but sets the
+ * @np parameter to dev_of_node(dev).
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get_all);
+
+/**
+ * devm_of_phy_bulk_get_all() - managed lookup of all PHYs from a device node
+ * @dev: device that requests the PHYs
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets all PHYs from the specified device node, associates the allocated array
+ * and PHY references with @dev, and creates a device link for each PHY. They
+ * are automatically released on driver detach.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_all(np, &devres->phys);
+	if (ret > 0) {
+		for (int i = 0; i < ret; i++)
+			phy_add_device_link(dev, devres->phys[i].phy);
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get_all);
+
+/**
+ * devm_phy_bulk_put_all() - release the multiple PHY
+ * @dev: device that wants to release this phy
+ * @phy: the phy bulk data returned by devm_phy_bulk_get_all()
+ *
+ * destroys the devres associated with this phy bulk data and invokes
+ * phy_bulk_put to release the phy.
+ */
+void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy)
+{
+	int r;
+
+	if (!phy)
+		return;
+
+	r = devres_release(dev, devm_phy_bulk_release_all,
+			   devm_phy_bulk_match, phy);
+	dev_WARN_ONCE(dev, r, "couldn't find PHY resource\n");
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_put_all);
+
 /**
  * phy_bulk_init() - initialize multiple PHYs
  * @num_phys: number of entries in the phys array
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c170d9aeeeb4..a51b3c283efd 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -326,6 +326,13 @@ void devm_of_phy_provider_unregister(struct device *dev,
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys);
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
+void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 int phy_bulk_init(int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys);
@@ -603,6 +610,30 @@ phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id)
 static inline void phy_remove_lookup(struct phy *phy, const char *con_id,
 				     const char *dev_id) { }
 
+static inline int devm_phy_bulk_get(struct device *dev, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_of_phy_bulk_get_all(struct device *dev,
+					   struct device_node *np,
+					   struct phy_bulk_data **phys)
+{
+	return 0;
+}
+
+static inline int devm_phy_bulk_get_all(struct device *dev,
+					struct phy_bulk_data **phys)
+{
+	return 0;
+}
+
+static inline void devm_phy_bulk_put_all(struct device *dev,
+					 struct phy_bulk_data *phy)
+{
+}
+
 static inline int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
 {
 	return 0;
-- 
2.56.1


