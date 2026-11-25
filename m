Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D1A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V3v6C7Hn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JS4RKgsg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvVr13+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=; b=V3v6C7HnzqbmkB
	vCDCY1uFJ5C5+bHXVmp4jFbzcoI7KXc36xEg1Ys6mvn7VtVQDA16GB9i6zIW0GPzoLVObAuCwjcS3
	S55bDVwbPms0EmHKpSGIglMqH0RU7Dqn5WFmEIsqJa1Qp1IKqqkkqmcMVWwvrIBSqpHieMhHjASqC
	CYBfVnFkxKwrrx23+nL8+6luwW6siWaOK6AhKliyyUOy7QNIu5cJbZX44EyQn5OVowZSq7nr/qd7S
	a1IaEFV/ryECk+xP5khZ0WDAP4j+mgxTkdX8rgN6gMQs6C9tMUhNyblwIFwYKB0YdI9k7mABuuwBB
	Mx7HROPgPpDTw9lWTvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lS-00000008Ox7-2JE0;
	Wed, 25 Nov 2026 04:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4l6-00000008Ol9-2rBZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 04:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=; b=JS4RKgsgXyGjADx+u/TFdUGsAw
	W8Rt5hIpRUMOccA3BrRASNqkZd5FlNx52SfFRyNJal4cwRfcdDLYMs9fwN57TOXPvV0HOu3gjtjDE
	27mmI2OFs8On2GWUVMvijG/Te8DzZO7kS495P4YTQ18K2+wyMxaecsZO/Mp2e2OG5AUOe997ed5/E
	4TMJqioQUqbsrk8j18qak7obXL9YH3D6Dnd9mrEtCZ3VRHlf9BFBXZ0zrPp8J7vVppW5rYzmK6yDw
	q/3eOsqHZO2TdXJjm+cZs8DwK2rE0vezMGg4Kp5DVDP0t+nRYoGmATlgL6wGluzK274dJjlQkmevk
	otH5QH/Q==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4l3-00000004pqh-2YZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso2745042a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581443; x=1796186243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=;
        b=lvVr13+apaPNo+5yoeLxqA+o+DFTxloZxn/4O/A1E00KA9EHs+dwICGcfYthDwkb6K
         XmDFkUwhP41B3MuGp5Alm+bOyHeR4mWa7V55TKBP7RQZv0CX86X7Z9KodLASlRmO/uFD
         TmlBDrpoP0Tf4624pePj+u4mFK8HiK//dfFxKEa6mq5kY/emoZzyAsTSkK+Oa0i+CBzS
         n/T4hdW7ePsmkdNcuS1I6j9VzOxfxdyHmHrV/f8YJivPc19Iu29527ais5vJ7bJ6Mt44
         wpA26J6wGP6KnXhYeVtQsi/fKzCmpjvC7n26my4B/eR5tWSHlXuBUlg4zK81dKX6rSl4
         HFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581443; x=1796186243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=;
        b=Ei9jeIEDcB8L7o9uZzA2DQlV7MQU+HA2SgWAfWGWVPmxPfmMtz7+z851556LB4JdGZ
         0OArDYodw52FVvCc+k+8+WonyUMwVmsgOppz+sO7jJ9ldspOXujERHtTpJljC/Ilqqau
         7srcyxMNdre9pnpdvY9s1Z/r+BDXZRWpJ+x8VQgXNXFcOvZQHhIwtSbTne8czUKa5NXB
         WgtAxEyc3Tvc/VqcJjWt+/TUqS1xxVEmL996v/OaxG/c0ed50WxlUH9K7dqUbdox7rEg
         CUMFqwoUCAW6Pb1G9c3m2R6QJp9aNSRRiisKYk73ju+4LJjVKw3XxwYrcCljb1KtaoeI
         OxmA==
X-Forwarded-Encrypted: i=1; AL+hErHSUk+hVfDF63ODbHsk4AADIkgWabqJ+BO2tL6zCZZ5m4YM/uSx9LQS6SNHJ2NzE4vWg+aHqU7v23fgerTCMb1+@lists.infradead.org
X-Gm-Message-State: APuU4Z+/U/O8AWR9AP4e7Rt5CjWEbWmZAGjSNKXAnVBBKHCFakoIvCZH
	gdiZfnwga6G0+XLHocC4eVa3JuoGD7oej2WuWXq7YCEcPTzeR1y3CIjf
X-Gm-Gg: AZFdTZfruIssK/5o0mWyhe861/xD2fpNPgfiN+BcKjZIlknksd4vklqJFRk2UCOElwb
	s/V73f3X10Wu/fI23vEB7RygP+tzzJ4LNak/EecBcY4tS7c1nFzMav8yATaCxIeIL7xfs/MXmgB
	K/wpQmKwkdhvLaHpjxI7wbRTlqWjtckuXfXbCupcP9XHDVf+Mlb9B4faHIXmtni0jV1hp+ICoez
	EuXiw9eo/M/UAhvzvdPZjtiX5QsJhVZZqiktTmHapFrJGf/631EGedWq3APT2J+A/VMeCMsuzFI
	cg0UpLI9gAaQhSZ5a88xmTlf4ldG6zqu8avWqiEm0jFRPLDowYDbbWfTH4vTBPaMscG+KfXTxIl
	T7C/M1+2xP/wC3ByxKYDQxNVf2+eZ6WmTFdCRan4yV3tNjkmBeAzdvtkv6Lzxly5S94Az0QyGO2
	A4URpt/wrYCv1BJqa9VItj7dFLB5/Ui1pedmKcK8Y7/YcdvFm9JBctKVTrU51F9rmGZlLjAY6MF
	OtyxnrOUG5AtiazlePaFjxAeSWM4XE4ulKIsst1lQOU3jsMZPz1RhxxD6ffgowR67zHRT/btzST
	6Ko2Tbod0gr3ecm3WLetXJmL+h9LgPUhqqeMoOrQFFVqFcpz
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr16931812a91.33.1795581443120;
        Tue, 24 Nov 2026 20:37:23 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm26615594a91.1.2026.11.24.20.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:22 -0800 (PST)
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
Subject: [PATCH v5 2/8] phy: core: Add common helper for get phy phandle by index
Date: Wed, 25 Nov 2026 12:36:33 +0800
Message-ID: <20261125043639.249525-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043725_903334_6045350B 
X-CRM114-Status: GOOD (  18.81  )
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

Two phy helpers use index to get phy phandle of a device node,
add a common function for the future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 57 ++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index b7550ca37e66..efbd7e139dce 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -697,38 +697,55 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	return phy;
 }
 
+/**
+ * _of_phy_get_by_index() - lookup and obtain a reference to a phy using a
+ * device_node by index.
+ * @np: device_node for which to get the phy
+ * @index: index of the phy from device's point of view
+ *
+ * Returns: the phy device, after getting a refcount to it; or
+ * -ENODEV if there is no such phy. The caller is responsible for
+ * calling of_phy_put() to release that count.
+ */
+static struct phy *_of_phy_get_by_index(struct device_node *np, int index)
+{
+	struct phy *phy;
+
+	phy = _of_phy_get(np, index);
+	if (IS_ERR(phy))
+		return phy;
+
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		return phy;
+	}
+
+	get_device(&phy->dev);
+
+	return phy;
+}
+
 /**
  * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns: the phy driver, after getting a refcount to it; or
+ * Returns: the phy device, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
 struct phy *of_phy_get(struct device_node *np, const char *con_id)
 {
-	struct phy *phy = NULL;
+	struct phy *phy;
 	int index = 0;
 
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
 	mutex_lock(&phy_provider_mutex);
-
-	phy = _of_phy_get(np, index);
-	if (IS_ERR(phy))
-		goto out_unlock;
-
-	if (!try_module_get(phy->ops->owner)) {
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
-	}
-
-	get_device(&phy->dev);
-
-out_unlock:
+	phy = _of_phy_get_by_index(np, index);
 	mutex_unlock(&phy_provider_mutex);
+
 	return phy;
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
@@ -1001,20 +1018,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_lock(&phy_provider_mutex);
-	phy = _of_phy_get(np, index);
+	phy = _of_phy_get_by_index(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
 		goto out_unlock;
 	}
 
-	if (!try_module_get(phy->ops->owner)) {
-		devres_free(ptr);
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
-	}
-
-	get_device(&phy->dev);
-
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-- 
2.56.1


