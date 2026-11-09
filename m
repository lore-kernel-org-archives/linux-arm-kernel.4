Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F7606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M1TL4L24;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B8GPbBGY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7hFGzs8/EjS5J+ZEjXgE0CN5N4nDlz9StHFWpagMJ84=; b=M1TL4L24MB9QN/
	Ml+bGX8aqG/j6FWuZwvBoHRUy/jOuadh7MaZbHjey8/FR2LSU8Fd2dIrZyd1F4/8X6ODol5EMSopu
	e9sHbfsb/6AjLFSho1HUYmjCoQPBDGaEU/llH5IHpwOGhTgQrw+wOJYEjGEZm5RxGMwcnIMea8gCC
	3Hg2qgpzBOntcpGZ+/9I6CbM/HvZTaMHnywF8I62vHH1SU1AaPSkRFi+ZpK7P9Neimy5ukrsb1TKY
	ZZRLJ9VL4rgyLMDvJvDUw6rOxCb7eFTqkscf4UEsLIuQuzUu9ql9vW2EwNWv+q+CSMgYhOgWReuBP
	OYCvDpsJ2DtIBZL2PgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLSw-00000000BAG-1CtS;
	Mon, 09 Nov 2026 09:15:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLSu-00000000B9U-0b4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6337A15A1;
	Mon,  9 Nov 2026 01:14:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8270C3F85F;
	Mon,  9 Nov 2026 01:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215699; bh=tM023w741zmn+KvUuwcT5+Ut+cy8bbmEpDN3iWfwXsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8GPbBGYNt6s4hGdWxyRdCaZxZz7tRftP2NtYI10mCXuCkjLlko88wPUlv6YvarHB
	 o0kJR/VA5wDeWNCbcf3Irc5oPOukottJfuymIXuBiExHU/CyNgvG7LCNIW3PZfZlQ+
	 DCseAtUHi6Qc5e7SDNLaAD+P+6Cbp0y9qV4wRxHc=
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
Subject: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state parsing
Date: Mon,  9 Nov 2026 09:11:47 +0000
Message-ID: <20261109091221.2532706-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011500_252429_B3B8A9CD 
X-CRM114-Status: UNSURE (   9.82  )
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

Add checks in the core multi-part iterators support to detect generally
malformed and incosistent multi-part replies.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
 drivers/firmware/arm_scmi/protocols.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 05092301db29..55d9cc487916 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1873,11 +1873,21 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 		if (ret)
 			return ret;
 
+		if (i->t->rx.len < SCMI_MULTIPART_REPLY_MIN_SZ) {
+			dev_err(ph->dev, "Invalid multi-part reply.\n");
+			return -EINVAL;
+		}
+
 		st->rx_len = i->t->rx.len;
 		ret = iops->update_state(st, i->resp, i->priv);
 		if (ret)
 			return ret;
 
+		if (!st->num_returned && st->num_remaining) {
+			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
+			return -EINVAL;
+		}
+
 		if (st->num_returned > st->max_resources - st->desc_index) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 8583159059e6..b295006ef1fd 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -33,6 +33,12 @@
 
 #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
 
+/*
+ * Common minimum size currently required by all the existing standard and
+ * vendor protocols.
+ */
+#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
+
 enum scmi_common_cmd {
 	PROTOCOL_VERSION = 0x0,
 	PROTOCOL_ATTRIBUTES = 0x1,
-- 
2.54.0


