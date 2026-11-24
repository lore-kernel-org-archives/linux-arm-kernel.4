Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D72606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNSwKCNO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Li1HQ431
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yNyKWZOKL+pL6ans6rni0y3A9ZwAY/enEa6bOoRGTiY=; b=BNSwKCNOmnxqUw
	iyZnH7J8HjwC5QF/TWhP1TxNZmyjuBsZRiQDEUJHwp9i5cvOeTHstCnQWdTmWJKrIV/pC7hVR0DCF
	RslfF1ughTTfxp54KyO2UVNo9Xo8GxmDRgAQZp6ejCqQciThUCYLkNl+xKPau9L00PZLoO/YHMha+
	Hfi9NRIt9AsP/zjFoHpHtpsMX150j7zz3DvCXTt0EdQJzfEal/qYSpiesK+k1VaBkg30ITWOqyT+9
	2eHg33kDlMV8wLXvi+o9kucH6KJQIqCYBGEOi6Zh1kkkSWjXoR5HDSRtjFCtNOeBjREP9AZoJ0SdG
	WZQcsuj3qhkYH7NtW4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwX4-00000007d2r-0kwr;
	Tue, 24 Nov 2026 19:50:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwWo-00000007cvT-0uuo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:50:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D39116F8;
	Tue, 24 Nov 2026 11:50:05 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653393F763;
	Tue, 24 Nov 2026 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549808; bh=CHkShNmAafdRmkE3fj+tkXnVfpPqAB5vDKfdzNp4PA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Li1HQ431u6djcBCNqeK4cnYE7nZopfvrxGyoZok43KxAzv0oAZHp+rXbw92S5PKym
	 +Osc6Jdt4Nfn6q8no18XoipZ6SVJJ1629hhEv8WQucPw98B03ZHdJWDJEDf6wzsSYl
	 8LMhcTx7xqmEoo4rBFYV2yaQpDrM9Im8LYkBcs/Y=
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
Subject: [PATCH v17 03/34] firmware: arm_scmi: Make Clock attributes size deterministic
Date: Tue, 24 Nov 2026 19:48:09 +0000
Message-ID: <20261124194841.1147072-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115010_310744_5EDEA2DA 
X-CRM114-Status: GOOD (  11.67  )
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

SCMI Clock protocol CLOCK_ATTRIBUTES command varied in its reply payload
size together with the specification evolution.

Between Clock version 0x10000 and 0x20000 one trailing field was added.
The current implementation used the maximum possible payload size across
any protocol version as the rx_size paramenter passed to xfer_get_init:
such solution works fine but inhibits any possible centralized check on
the size of the received reply.

Size the requested reply strictly according to the expected protocol
version.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 6b5d50b35a48..ed93970c3b87 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -362,10 +362,14 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 	u32 attributes;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_clock_attributes *attr;
+	size_t rx_size = sizeof(*attr);
 	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
 
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
+		rx_size -= sizeof(attr->clock_enable_latency);
+
 	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
-				      sizeof(clk_id), sizeof(*attr), &t);
+				      sizeof(clk_id), rx_size, &t);
 	if (ret)
 		return ret;
 
@@ -1002,12 +1006,16 @@ scmi_clock_config_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_clock_attributes *resp;
+	size_t rx_size = sizeof(*resp);
 
 	if (!enabled)
 		return -EINVAL;
 
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
+		rx_size -= sizeof(resp->clock_enable_latency);
+
 	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
-				      sizeof(clk_id), sizeof(*resp), &t);
+				      sizeof(clk_id), rx_size, &t);
 	if (ret)
 		return ret;
 
-- 
2.54.0


