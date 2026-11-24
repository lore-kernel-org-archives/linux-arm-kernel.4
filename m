Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D17606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K0h2PACW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DlPx3Trw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vtM2MEBmduOcZZltNQ7NOe1dSUbwO9go+8cdTtGYRPE=; b=K0h2PACWA/uVvm
	9R0+Xaz+qrrNzAyOa+n8aAN/vcRPXeYW3KmkLZtoLj+bKg7MXza3inSeXyH6mZTjptZ3wrvwSsbjM
	/5RP85eDP1+8Ur+olQkGJ4bvJQqrI0nAFGhYYPZJ5F70fgJf8SjKnH8XugrpzEMbD7O0t0O2prIQp
	kT8l0Algj7wuenTGr5cuInbREL+2mGKsl3seHSzxm36Oyzwd/WisF/IL/b9xirP5VR5X3egOXd8/e
	Iiw5O3yRkka0Lkh7gA3Gx3OtDHsWOwZYVdMcDcAK1Yy48+wDZT1N3B0NdwfDiRsSv3BooVjppn7hk
	Q+8YnIwwxgw7c9mwgTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwWl-00000007ctr-3Uco;
	Tue, 24 Nov 2026 19:50:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwWf-00000007cqj-02pT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:50:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6B0497;
	Tue, 24 Nov 2026 11:49:56 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AA433F763;
	Tue, 24 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549799; bh=hg/2DnWI8gLzOZWWZXz8Xss4EyuZZ/xSdaUsIAEYlfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DlPx3Trwn1iTMVbnYyz6mM1lIeiMM4jHxEOV8dD8d0lCfio3OjH6AO00g3bOTQD0k
	 wD21GqXNXhBdtDqgiGkTyvMr04RCz0kABbNngGTnMQkRH1NG3yg5DhPP9I5dMwsV2I
	 s9YlzM6XovU6v5daRzOQbXvDmGNKc8h4rtq0fdAk=
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
Subject: [PATCH v17 01/34] firmware: arm_scmi: Harden iterators state parsing
Date: Tue, 24 Nov 2026 19:48:07 +0000
Message-ID: <20261124194841.1147072-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115001_093524_0244CBCD 
X-CRM114-Status: GOOD (  10.08  )
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
malformed and inconsistent multi-part replies.

Fixes: 36b6ea0fc6bc ("firmware: arm_scmi: Add iterators for multi-part commands")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
 drivers/firmware/arm_scmi/protocols.h |  7 +++++++
 2 files changed, 17 insertions(+)

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
index 8583159059e6..c15ec188291a 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -33,6 +33,13 @@
 
 #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
 
+/*
+ * Common minimum size required by all the existing standard and vendor
+ * protocols to hold number of returned and remaining items in a multi-part
+ * reply.
+ */
+#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
+
 enum scmi_common_cmd {
 	PROTOCOL_VERSION = 0x0,
 	PROTOCOL_ATTRIBUTES = 0x1,
-- 
2.54.0


