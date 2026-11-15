Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rpf6YKFP;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=maYAFS7L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aY1FUVzzYUMqybTrHy9jtFlDRFG7VeirsrOfiyiEqu4=; b=rpf6YKFPG8hHuW
	33JYx+HNkjxaTr3c6sGS1oyqlDDfrbrVBWDMQkq00/PEOUJBQRiJkmSJ6OnFV5T2I3cxcvyg+W4lu
	thA85fKlhtjNhqZP6PYXDUdme/Gb5QIXhMBW1JdLwj+/BF0CJnyerbJonakGokKpfE9WivxMHXSkj
	Uo1pbtPlN5byc7ue3pl9aPv80vSP102R96NvoNQKi982amjYZdPhOnvWjsyBk3AnN1DMJD2MJf+bW
	HhMuYHw4GH+Ua4rwGLKPMb1HXU5XXAVttsROhPojisZ3GH7TAQZZWE2eHhvFQZ7Ud5Ui117K8eYOI
	XopCpgz7E5u8AjVG+IJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6T-0000000HQfD-0Vwc;
	Sun, 15 Nov 2026 11:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6L-0000000HQcO-032U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85B911576;
	Sun, 15 Nov 2026 03:08:45 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D5BD3F632;
	Sun, 15 Nov 2026 03:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794740928; bh=8XYAIqtuEIboOHoTpgs3rKIeXDomMa1zPXW7EouXHw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=maYAFS7LKNSu9ZvS5gAJjVprCUwxmdczl1rZA/MGPT8Vw37dJhphmswHpCfvc6zjY
	 uhEe8tEuqXrJrbdWyuYXNlBPIuxsTsR5DC7vFdyxKb9rt7IQe7Mqikqr7yQBLdyEbF
	 jc0th20yALxZoMiQgGIH0C4xBml4/5h+uCCZGmTU=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 3/3] powercap: arm_scmi: Refactor scmi_zones_register error path
Date: Sun, 15 Nov 2026 11:05:46 +0000
Message-ID: <20261115110546.2344308-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115110546.2344308-1-cristian.marussi@arm.com>
References: <20261115110546.2344308-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_030849_089081_91A282A6 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -4.4 (----)
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

Refactor and simplify scmi_zones_register error path by using
cleanup handlers.

No functional change.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index dbc9871fc1e2..6346037c889d 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 ARM Ltd.
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/math.h>
 #include <linux/limits.h>
@@ -368,11 +369,12 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
 static int scmi_zones_register(struct device *dev,
 			       struct scmi_powercap_root *pr)
 {
-	int ret = 0;
 	unsigned int sp = 0, reg_zones = 0;
-	struct scmi_powercap_zone *spz, **zones_stack;
+	struct scmi_powercap_zone *spz;
+	int ret = 0;
 
-	zones_stack = kzalloc_objs(spz, pr->num_zones);
+	struct scmi_powercap_zone **zones_stack __free(kfree) =
+		kzalloc_objs(spz, pr->num_zones);
 	if (!zones_stack)
 		return -ENOMEM;
 
@@ -396,9 +398,7 @@ static int scmi_zones_register(struct device *dev,
 					parent->invalid ? "hole" : "cycle",
 					parent->info->id);
 				scmi_powercap_unregister_all_zones(pr);
-				ret = -EINVAL;
-				reg_zones = 0;
-				goto out;
+				return -EINVAL;
 			}
 			zones_stack[sp++] = spz;
 			spz = parent;
@@ -407,16 +407,14 @@ static int scmi_zones_register(struct device *dev,
 			if (!ret) {
 				reg_zones++;
 			} else if (sp) {
-				/* Failed to register a non-leaf zone.
-				 * Bail-out.
-				 */
+				/* Failed to register a non-leaf zone. Bail-out. */
 				dev_err(dev,
 					"Failed to register non-leaf zone ID %u - ret:%d\n",
 					spz->info->id, ret);
 				scmi_powercap_unregister_all_zones(pr);
-				reg_zones = 0;
-				goto out;
+				return ret;
 			}
+
 			/* Pick next zone to process */
 			if (sp)
 				spz = zones_stack[--sp];
@@ -426,13 +424,11 @@ static int scmi_zones_register(struct device *dev,
 							       node);
 		}
 	}
-	ret = 0;
 
-out:
-	kfree(zones_stack);
+	/* If we get here any previous error was on a leaf zone, so ignored */
 	dev_info(dev, "Registered %d SCMI Powercap domains !\n", reg_zones);
 
-	return ret;
+	return 0;
 }
 
 static int scmi_powercap_probe(struct scmi_device *sdev)
-- 
2.54.0


