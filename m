Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iPKMEr3d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oPSz4ofl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xiIBMctQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=; b=iPKMEr3dAKpQhE
	kuljjBxoRWAG4PK9JNVUle0BO6iDiihm0J+YVRbfPePxFXxyCg3pYhtcZeUMHFxHCP1lwDtE7DeUb
	15AlDxwgDwi+O6gS1v1BdxstaZSOyXw9IlVlU5aQiWaLlRrxnWv8BbI2V3k3gAwYGUF0PtNTWDQXA
	+gD/BstG5CsLd1NWMASvFX28ocEw9AZ3pD7cemeyPiKuyFeBanVA9obY8+tnTFvOqyjx8Xir5k7gz
	fuiP4Kiscjpcb0zoDt97gvOI4tKEuaXcTzcJBA/SLwK/4IVkZimuuObjlB0c169SEDAm4PNlbhnQr
	4FdVXf5ug/YTKKD+PLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lD-00000008Ood-41Gu;
	Wed, 25 Nov 2026 04:37:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4l3-00000008Oiy-0m8Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 04:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=; b=oPSz4oflIp6ZKawwG3ygwShDqS
	5aSAPwhXrGYlhIbvIa7o8mJEkfPABV2A3aSu0pSDy2qz8zB3YhSyUqU0OHjJ9NdtQfdQlEcaXkNej
	wPAHkEoTE7RxYPSJBjrccOGfnk8T4LegGkEIsB0sI30TNzGdekKrJxrmoxvZho/T14peGfirjG1QD
	oEfbDYLwvAKz03IdFd5RkezsKVsvFswYSkeQ+mEY3Ywcd4A2QsfgzmNgbxEovbvXBpiRrQ1jhVwBl
	xKp3k6zML9JiiG7NivxwcNe4IE5/IezEmDo3sybhjVHdzr2PkOylmLOLkaRshKOgESqJUelIj+jdD
	NIDIFpBw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4l0-00000004ppX-1Jxb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f04bea9a93so46349365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581439; x=1796186239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=xiIBMctQOra4pU1LlYFD5CbuQHel7B71Tp8ii6J9lGd8MRBqi7y0z1+fb0OjRhm8cV
         iinIDiU6CK+3ItXHO3/6iJPu/zDnbhqS28ga6lFoaiX0f0M6XfaCoM5aDbLJfhgTBUiA
         k7uUrQ+HLpxk60JWmslPqjWYsaCycHuFN7X/bmCHLLTdyvVa9kDerXfyWIBmG98ADBLB
         km+TJawof9r7Ob/71ZFHPVz33dNK8oiadsw2OK+9zZXzFyEdMAFlX8tE1/IRKduvhXch
         u4fbDAMkWD9fGOb9y1o+2uGAZ6PruAModVL7+YNvaUZgwEAhK/lqzzUk5y6QLn2abd/C
         ygjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581439; x=1796186239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=rXvRwMnOp6j02znWg9nBoekqx9xut4fcDCo04CgPLoWBEQy/VvIPd5yRIre0xsGD18
         bb96g46BmUsbYcs4TYDxhCd5jIFUqHEM7GIo3+yPInyuxws4cumYltmHB8OqY7yruhQF
         1QH5fuilo4Z7AtHiHqEBp0QzJfq/q3Wcx6SGKEW852gglBaOWoiEU+rWqj3PmO3dHl7c
         gAxF2hUBQM8mmRv/EDQ24bDN+uR+9QBVE5DFlYRVCP0O18v2raqLvmz/BJoOqirvpP0t
         +kJ2s9TnvzdzsgJpb5VdxQjYekZGXxEKL0+SYZAYxzPh0GwlNGEelFK+qL4VdDnRuI80
         GBYQ==
X-Forwarded-Encrypted: i=1; AL+hErGfTgWDD1i4iBvur2VYLIaMv4LEET1bh1kgoYAZDVzdXTwv0Fs5r+dM/SpBirbAerfpENEAVOxhpuW5z4QQHDuu@lists.infradead.org
X-Gm-Message-State: APuU4Z8lOVfIstGIyUonGA3NAJ7+TKR5LPBGkRDCcxnM4/7ofrBa0esN
	Swlw/5LP5mT/bN0cRmwtkIY5AOwgJxeiSKceMDXixC0sOxd3gBKJO4yp
X-Gm-Gg: AZFdTZegWfzznw57zILDwQt5khdc2iiyvp+34l7MZVgU81JwX8KdClc7p4PeXRMt+2o
	a8aSUweLEjBRvKq6HEa1kTtoD228qlVuRrJJO+3D9lYLcYzuPrdZSldnol1BT8fsKll8qFClcZD
	FFCkcxr/5YDL7prz9d9dK7fcjHcJ84uuMov19VRA3AS8lvzbl7o2PGwJy0UpJuKm0cl2fu/whir
	bNEJKUUNIKBZWWfjHTPaxLjux/D025HeiEA8bdZlN5Zj3N7AY0UxAcc9UDMSbQiMzO85wwdWNSX
	qgkL3JFVVCn0MyX+CFFuV5JMPWwQEPTSlfOF/SHiMeqxg7FIzs5LKGxxBo2QSAGBINsg6uhusJw
	6CWXeDCrJsIMTNLhB/lKivleGlHZulGlouAtBYVXBClHsVENdv6lZ/gL9SrKDTx7nvPYU6jCamp
	NsMtUEOgcZvfixk1ZnX+F88FVlcDMDDI4gfiiRxgLSQD85j4dNrYBP9ump/K/UjpV1zIvdp3Gio
	GEUaUdueVX9CQcE4B1tn2wREcisQUujC6hptzUnjHfk7H45uR3gO1ILOrixQKr5D7ijsaRL/B3q
	blWaDKrtSFDn+GMP4QCOQnddG6k=
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr182475285ad.2.1795581439561;
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm78614345ad.54.2026.11.24.20.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
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
Subject: [PATCH v5 1/8] phy: core: Add common helper to add phy phandle device link
Date: Wed, 25 Nov 2026 12:36:32 +0800
Message-ID: <20261125043639.249525-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043722_400513_E0008D30 
X-CRM114-Status: GOOD (  16.26  )
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

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 46 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 597e6b234f5e..b7550ca37e66 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,27 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Associate the phy with the device
+ * @dev: the device consuming the PHY
+ * @phy: the PHY supplied to @dev
+ *
+ * Add a device link with @dev as the consumer and @phy as the
+ * PHY supplier.
+ */
+static void phy_add_device_link(struct device *dev, struct phy *phy)
+{
+	struct device_link *link;
+
+	if (!phy)
+		return;
+
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+}
+
 /**
  * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
  * @args: of_phandle_args to the phy
@@ -805,7 +826,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	mutex_lock(&phy_provider_mutex);
 	if (dev->of_node) {
@@ -833,10 +853,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -912,7 +929,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -927,10 +943,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -982,7 +995,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1006,10 +1018,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -1059,7 +1068,6 @@ EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1073,10 +1081,8 @@ struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 
 	*ptr = phy;
 	devres_add(dev, ptr);
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
-- 
2.56.1


