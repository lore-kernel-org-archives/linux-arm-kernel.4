Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0915606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rRJzrHng;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=p2fn5iyI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s8pBft0CdYm72gM2FDBjkmUGraVLk92qFzft6iRlcsc=; b=rRJzrHngZK1ATa
	IxC6iLHZ4TnxbZtTdma38KWUZ35gCC2d+O03oOC8Yq0E13reDzOuU/QPjF3xmycWzHJoVmyrpSP2U
	nw3GmVV87fKABfLy9f3BfUwpFwMLKsLmAyvWL2kWWblniy9Xx4a3OSzWoKnV0gIYXY9xXF+Vd1++C
	JshYeEwiDp4WybD74boQVduWAMDwtnAHctG1pBvjMo6fveW5CV76xaOwOZB8281OTRiD7uJIFIKSx
	jrBxtibEVsPU/MgJmgCFj2N4RV87UqVnoN+BaqiP/P2wki1tR3tYQjGp5MjH9d5aA/pzNOHMlKZZr
	Hq3BCasUQMB4TZTs35iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6Q-0000000HQe7-3bXe;
	Sun, 15 Nov 2026 11:08:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6K-0000000HQby-1q0y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F21B153B;
	Sun, 15 Nov 2026 03:08:44 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED0BC3F632;
	Sun, 15 Nov 2026 03:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794740927; bh=dmQn6Bh6dp5f3+dq/JzrJw2D9XEMlAuy1xwcIOAHdWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p2fn5iyI/EaJzeJ/7OO8DNYKSn8PfCdxfAK8TIqTT/HdPzlaO879ZqYjWMeKs7zQl
	 Yga/urQEr2c++AKAz4KkOE+pjOWnuk4ocnoN3ZSx3Z+fSceCfMamV1cBCfi7T6LvIQ
	 ZqgXWlvRGuT4riHTSzYuw+vpns17+IA/EbtI3/J4=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 2/3] powercap: arm_scmi: Reject zones hierarchy containing cycles or holes
Date: Sun, 15 Nov 2026 11:05:45 +0000
Message-ID: <20261115110546.2344308-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115110546.2344308-1-cristian.marussi@arm.com>
References: <20261115110546.2344308-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_030848_561395_07080F96 
X-CRM114-Status: GOOD (  15.54  )
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

While walking the hierarchy of powercap zones received from the SCMI server
bailout with an error if any cycle or hole is detected in the received set
of zones which has to represent a tree or a forest.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6466cd8d-c2b1-43da-8141-bf8bf49a17b1
Closes: https://sashiko.dev/#/bug/linux-4895c0ac-74f4-4860-a006-9f5ef7b0a012
Fixes: 3e767d6850f8 ("powercap: arm_scmi: Remove recursion while parsing zones")
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index e2270476a98c..dbc9871fc1e2 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -22,6 +22,7 @@ static const struct scmi_powercap_proto_ops *powercap_ops;
 struct scmi_powercap_zone {
 	bool registered;
 	bool invalid;
+	bool visited;
 	unsigned int height;
 	struct device *dev;
 	struct scmi_protocol_handle *ph;
@@ -316,6 +317,7 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
 			spz->info->name, parent ? parent->info->name : "ROOT",
 			spz->height);
 	} else {
+		spz->invalid = true;
 		list_del(&spz->node);
 		ret = PTR_ERR(z);
 		dev_err(spz->dev,
@@ -379,8 +381,25 @@ static int scmi_zones_register(struct device *dev,
 	while (spz) {
 		struct scmi_powercap_zone *parent;
 
+		spz->visited = true;
 		parent = scmi_powercap_get_parent_zone(spz);
 		if (parent && !parent->registered) {
+			/*
+			 * An un-registered parent node is never visited twice:
+			 * when that happens it is either a cycle or a hole, i.e.
+			 * the attempt to walk again through a node which was already
+			 * removed from @scmi_zones since it previously failed to
+			 * register.
+			 */
+			if (parent->visited) {
+				dev_err(dev, "Found a %s in zone ID %u\n",
+					parent->invalid ? "hole" : "cycle",
+					parent->info->id);
+				scmi_powercap_unregister_all_zones(pr);
+				ret = -EINVAL;
+				reg_zones = 0;
+				goto out;
+			}
 			zones_stack[sp++] = spz;
 			spz = parent;
 		} else {
@@ -392,8 +411,8 @@ static int scmi_zones_register(struct device *dev,
 				 * Bail-out.
 				 */
 				dev_err(dev,
-					"Failed to register non-leaf zone - ret:%d\n",
-					ret);
+					"Failed to register non-leaf zone ID %u - ret:%d\n",
+					spz->info->id, ret);
 				scmi_powercap_unregister_all_zones(pr);
 				reg_zones = 0;
 				goto out;
-- 
2.54.0


