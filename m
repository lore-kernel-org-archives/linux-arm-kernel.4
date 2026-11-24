Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD1606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lrxoTU+Y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PZoTVDeX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=80q8YD+7sXMXFl1ECfvCh2AR2uYXOG7FEJnScBZQu+E=; b=lrxoTU+Y/MHjLk
	nvp/Xc1KgX2DOGK9Rk2DyQOXpQ87VK6MSSbBbvzkd7UMr36a65chd1uxPF0AI4bL+/2bGMkecpvYA
	RSP0SbkHg5XDH1qaX+xmPRODl72ZaEz4ffiy57+igLSxOn7V3/WNmbwxVQDWjRDTTly1rUS0ED2IY
	z2XyYffoVEtodstJxgtjcEtLQ1FlgdCl3O+xj7LJpVUWbquO4fHzO/AetpnmbJD5fa72+E8vJxg+b
	KnWlXQwxuXQhiyiVebFP5JTfOAMvOhHjPerpNAyJ+ScdQ3V1WQzTQuDGxWcsP92zWXrP7tvxpDgun
	QwixODlZtga9K9IRb8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwWl-00000007cu2-3sTU;
	Tue, 24 Nov 2026 19:50:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwWi-00000007csn-48EI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:50:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2229516F3;
	Tue, 24 Nov 2026 11:50:01 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597AB3F763;
	Tue, 24 Nov 2026 11:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549804; bh=Y0MBG+9tAaJnrCVNc9NifzCluMxb+aEqtuevfolvhu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZoTVDeXQBHBNQY/osXgVd4HpvJwvqovP/XFHePZT8nGFZFqxWnm001xC7RIY477y
	 hD0+50Et8HCCSg1ZBt1r60YTg2KwysBE7pqyUxA7BaE35ZhOd9sZ+u52C3Upk3hKfv
	 9c/4qEcw57xjbMDkUNjGtG2kfvNFD6DIDyN3uPQ4=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v17 02/34] [RFC] firmware: arm_scmi: Additional iterators consistency checks
Date: Tue, 24 Nov 2026 19:48:08 +0000
Message-ID: <20261124194841.1147072-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115005_102672_AC012E54 
X-CRM114-Status: GOOD (  14.89  )
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

Add a few more consistency checks around the number of returned and
remaining items during the life of an iteration: this is useful to spot
prematurely terminated iterations that would produce shorter than expected
results.

Handling these anomalies in the platform multi-part replies within the
core SCMI iterators machinery avoids the need to address such issues
multiple times at the protocol layer.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
RFC because this is another fix that is potentially disrupting for any
non compliant SCMI platform deployed in the wild.
---
 drivers/firmware/arm_scmi/driver.c | 36 ++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 55d9cc487916..6dd249c08f5f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1852,7 +1852,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
 	struct scmi_iterator *i;
-	unsigned int n;
+	unsigned int n, i_start, i_max, i_returned;
 
 	if (!iter)
 		return -EINVAL;
@@ -1862,10 +1862,15 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	ph = i->ph;
 	st = &i->state;
 
+	/* Initialize iteration counters used to check consistency */
+	i_max = 0;
+	i_returned = 0;
+	i_start = start ? *start : 0;
+
 	/* Reinitialize state for next run */
 	st->num_returned = 0;
 	st->num_remaining = 0;
-	st->desc_index = start ? *start : 0;
+	st->desc_index = i_start;
 
 	do {
 		iops->prepare_message(i->msg, st->desc_index, i->priv);
@@ -1883,11 +1888,34 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 		if (ret)
 			return ret;
 
-		if (!st->num_returned && st->num_remaining) {
-			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
+		/*
+		 * Initialize max items expectation for this run based on
+		 * values returned on first message exchange: during the
+		 * following iterations consistency will be validated against
+		 * these parameters, so as to spot FW anomalies like sudden
+		 * termination or unplausible conditions.
+		 */
+		if (!i_max)
+			i_max = i_start + st->num_returned + st->num_remaining;
+
+		if ((!st->num_returned && st->num_remaining) ||
+		    (i_max != i_start + i_returned + st->num_returned + st->num_remaining)) {
+			dev_err(ph->dev,
+				"Inconsistent multi-part reply. max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
+				st->max_resources, i_max, i_start, i_returned,
+				st->num_returned, st->num_remaining,
+				st->desc_index);
 			return -EINVAL;
 		}
 
+		dev_dbg(ph->dev,
+			"Multi-part - max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
+			st->max_resources, i_max, i_start, i_returned,
+			st->num_returned, st->num_remaining, st->desc_index);
+
+		/* Account for last batch received */
+		i_returned += st->num_returned;
+
 		if (st->num_returned > st->max_resources - st->desc_index) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
-- 
2.54.0


