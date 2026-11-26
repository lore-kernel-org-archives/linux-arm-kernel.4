Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E12606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qthsTWMy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UmW6o2Gf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y6L4WI3l3y6EKkCBdb+Q/hnuzyHnQuZbp5Sliq/f6MU=; b=qthsTWMylbKgLuVoTa1uZnJio5
	hC2DAjQ+P9A2caNR2p8nxSL+vxVDY2e4sVLOmMRPvr47jd7Zy4ooH/U89WMLT2nMaxkjlj3qw0nib
	DW69tCCoROIdu9MgDFPLi+rWSeWqykjPwHuim3sD0rTgW6v6Lp/XlBCOs5SX7j2woidjLB1sVZvNJ
	tOXQQFWEg1P4/HwXpmyFVB43x2xgR2iS1VT+VYEf5gF6/FxlO3ZLQo/wpB5yZXWZJNpYwI6IJ54eA
	gJ+llaGS6E9NURw2fk1d69bAVG403AGehdhJeoPYzg0nDZSQIpQVoLHLfbBrGHbqxSFG6nN/by2WA
	sGJxUR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbqm-0000000DoxJ-2ziV;
	Thu, 26 Nov 2026 15:57:32 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbqj-0000000DowY-2THW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:57:30 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3282db206d3so3198836eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 07:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708649; x=1796313449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6L4WI3l3y6EKkCBdb+Q/hnuzyHnQuZbp5Sliq/f6MU=;
        b=UmW6o2Gf/ob4AZakBghMQBNrPVtCQrSJFsXqW+ktieS4mm9AoZS9oKqYcJ9BlYiwia
         m22J//O6edJs5OlS5pbCI+GOF+RaW4KOsxd+Fjl1Y0hOSblJVarCa7Cv1K1UJBFbjPBs
         S/09Rb4Bx3oeZDp9V3ShjLxROkFw9jLCNxUOO32UjiBADLs7PO4lhsPgy+N9jNfVymn1
         gaRlotl+bGUp0dMaJY2BnDRZd9HiDGxtRwYW6RBriH73HRO+yUCxtbh2YLqXYpkQcGZy
         +faE55OVGwPJ6hwbUdUbt/sX4rCzCFC1f7RA8bPW0Nc0WamJHW/zDM/ZLupni8kGMrMP
         /UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708649; x=1796313449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6L4WI3l3y6EKkCBdb+Q/hnuzyHnQuZbp5Sliq/f6MU=;
        b=mUPTs0G1LEipO8ElE/0XicdLGHC78kRfej95D7kjaDsozN0b5iWz+cGVnMXeIlCp9F
         jdpbeI2cgYt+IASzunX7h/DCZ+ultmxpzM9Cve655QHujSeUFvc32YBYACzgEMMGTzgt
         6mXm5WrktRNXw+OI5u1RU74a4UEOU+RvDquAGVQydBL8gPyQQYBew7hXvBBoVWYnH+XB
         P2nb7lojGQCIR0xczF5TL+odwMF1hrVqudKX2RdbOQBT63pHpfWP6lpO6STCUcwzKtzE
         +lqJOBr84V4yBP4rDJsZMbjWNcS/qnuHhcqplQ5HryH3A1eoWObxGb3H+xIBSuTkB5fT
         /qyg==
X-Forwarded-Encrypted: i=1; AL+hErHkR66tLyIx5JQJ4qJ0GrUsULnk0J2fRpYTtVO4Bu/ldVX+a9UGtawWwOs5KklBOKGvfioGHLDDhAz+5bxurJrg@lists.infradead.org
X-Gm-Message-State: APuU4Z/5wxyrLtK+MO/TmmEpMMXrcNkctYL3cQzDEDBHGVpuU3i3bdZW
	vG1qhZMrpVjVdec1SUHzpow5qMWmNSHngeVsC9R8AXl5kH8+yIhvwoM=
X-Gm-Gg: AZFdTZcVA9+hrroYXxzkwW3nOF5gQ39ti+85/DHmPUBCJgRrcprlOZZ4WvOQDq7Q1zl
	8bPLXo1GGmmMwmNzAmlUxm3+munvVnjEGJeAJQBnHsM/R4J80WlIgS/9w5lpdbDXJoz6ELeMj80
	gP9+5TuVTkS9Rtk0nHwdpnz0iTnmaSsPuMLy1bsKNXtVuUBtoV8BQKqoDO4eNoZRoLC2CB3WI07
	CX0ky410Ug4McupJGF/niuIMKcZYZnOQXA3jgv47XFyZOqShWAFsR1hHqunKH2ZxB07eiExduam
	Ghvk4mIUoKgqzm+Lu9losezzJnLgvlHRJaTXzdX3N18ioV+T732QrOqbUejdk65GpyuIxb37aHa
	dVf6dWtXEK7ZllewUNmb7Sy0QI1cFIwC1OFFHYLSvEtQbd1Zaz9n7897Ix1Wx7MM/hH+I4rB91n
	VNqmYTGzlIuxuns9KYyUQYH9kdz7Uvm87Q8AsmckhBKYw+FNGvI8H1bgjs7P0KaQKfx6b5TVM91
	B4X4HJbgjei+Pl9VNp5jS2dw+WhDLRrFOYsG/37gO9aSuV0thcm1KIjlrtlPyZnzDGLxEg7Slh/
	X0PC32Yhxq4o1jA7bfktnqJgHzW3RjnC5toLceiESRJzUPEri7lFbwawwbRpVwWrfTk=
X-Received: by 2002:a05:7301:1601:b0:386:c990:c5a with SMTP id 5a478bee46e88-386c9900e99mr6979601eec.40.1795708648478;
        Thu, 26 Nov 2026 07:57:28 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm67017063eec.12.2026.11.26.07.57.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:57:28 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] coresight: tpda: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 23:57:22 +0800
Message-ID: <20261126-coresight-v2-e1077abdea61@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_075729_774626_5BFBC469 
X-CRM114-Status: GOOD (  14.72  )
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

tpda_probe() gets the platform data before allocating driver data,
mapping the registers, reserving a trace ID and allocating a device
name. Failure at any of these steps leaves the destination fwnodes of
the output connections referenced because the core has yet to take
ownership of the platform data.

Allocate the name before reserving the trace ID, then get the platform
data immediately before registration. Return the ID if either the
platform data lookup or registration fails.

Codex helped check trace ID ownership and draft the probe changes.

Fixes: 5b7916625c01 ("Coresight: Add TPDA link driver")
Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
v2: Add the TPDA fix identified during review of the TPDM patch.

v1: https://lore.kernel.org/all/rc-b1-20261110-vc-178-2d9055f946c8@gmail.com/
Review: https://lore.kernel.org/all/e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org/

Compile-tested: arm64, GCC 14.2.0, W=1, coresight-tpda.o.
The baseline and patched objects built without warnings.
No hardware or runtime tests were performed.

 drivers/hwtracing/coresight/coresight-tpda.c | 29 +++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 63a97931246302f74c0d2fb5e70f43d31f0475b9..62e15fc9b6ec9ad7801257ff706778abd2487fa3 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -566,11 +566,6 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc desc = { 0 };
 	void __iomem *base;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	adev->dev.platform_data = pdata;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -585,13 +580,21 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->spinlock);
 
+	desc.name = coresight_alloc_device_name("tpda", dev);
+	if (!desc.name)
+		return -ENOMEM;
+
 	ret = tpda_init_default_data(drvdata);
 	if (ret)
 		return ret;
 
-	desc.name = coresight_alloc_device_name("tpda", dev);
-	if (!desc.name)
-		return -ENOMEM;
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto err_put_id;
+	}
+	adev->dev.platform_data = pdata;
+
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
 	desc.ops = &tpda_cs_ops;
@@ -600,13 +603,19 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err_put_id;
+	}
 
 	pm_runtime_put(&adev->dev);
 
 	dev_dbg(drvdata->dev, "TPDA initialized\n");
 	return 0;
+
+err_put_id:
+	coresight_trace_id_put_system_id(drvdata->atid);
+	return ret;
 }
 
 static void tpda_remove(struct amba_device *adev)

base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8

