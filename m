Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AD606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n8bI0cy2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A8QZP/XF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qv7BxFg9sJmxV34KjiW/8ih8V/dt/aWZUBW21SLTsFE=; b=n8bI0cy2REuT9r
	RtyUVYIY+ctG2gaJACtZzL5R5V1tJ4NYx3MPafris86BfzOaCf2SAvsJopHNzOTbu7XMBf2IwqJSZ
	1CzPLzzo4G16u8apKz5gk1TER0hMgj5VJ9e/OeuJ+xrsGfSHRArmSk1C1TcSllely8yf41rzr+RqN
	izI0ihzf1NV1pjI+u9cBHEWDVWEdYB5A/n3An9IWWcpGSYHVsJVkr2tP6HIOYMXwDxNFBlPsxjDYE
	gchEdqtMHA95gnLTCCil8XfkNGBSaytp2Cl3i0xYgf4M+k206YArZk2mTe98JbBAfk1CUbafZGO5H
	lv+FBVB06CAnWulNlAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYp-00000007eLf-30fX;
	Tue, 24 Nov 2026 19:52:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwY7-00000007dwb-2VUy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:51:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4627497;
	Tue, 24 Nov 2026 11:51:27 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE573F763;
	Tue, 24 Nov 2026 11:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549890; bh=2jEg9O97PNUqbVJbj1N0o3Mql/Mz8uT3lWycx5BKbh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8QZP/XFYb4+JTTZutHT8NnhtJfL5iHN+S4qrhMfrwaUxkrIBDWn6xdh0jdfCi5P0
	 dF9/zljw0IKYL170rwt65M92SULGw0ObE5mMnX7rdqOIKwkAj52ZgyhkM0GJ8U/rOQ
	 NjuAHYVlbt2oyvUHYXPGbN1ku0uQ+5qjH3nbwf7Y=
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v17 22/34] firmware: arm_scmi: Invoke proper protocol cleanup on failure
Date: Tue, 24 Nov 2026 19:48:28 +0000
Message-ID: <20261124194841.1147072-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115131_685383_F3568750 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

After a failure in the protocol initialization phase, invoke if provided
the protocol deinitialization routines.

Fixes: 48dc16e2e52c ("firmware: arm_scmi: Extend protocol registration interfaces")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-12cc0795-af8e-4d0c-8f6a-780a6728de7a
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 00a3484006d9..123050335969 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2353,7 +2353,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
 			GFP_KERNEL);
 	if (ret != proto->id)
-		goto clean;
+		goto deinit;
 
 	/*
 	 * Warn but ignore events registration errors since we do not want
@@ -2374,6 +2374,9 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 
 	return pi;
 
+deinit:
+	if (pi->proto->instance_deinit)
+		pi->proto->instance_deinit(&pi->ph);
 clean:
 	/* Take care to put the protocol module's owner before releasing all */
 	scmi_protocol_put(proto);
-- 
2.54.0


