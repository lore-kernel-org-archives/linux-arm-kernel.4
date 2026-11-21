Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24099606A696
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u/Xp38tn;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r+MPzQBx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vFT5X4VScYFosTBP0L3XnNtdE1oB9AcZg2PDRicv4pI=; b=u/Xp38tn+hsoEm
	JSkgPOTrf8OGSI1LENlztA5A9ctTA2xYYvjfUc7AduT86a1mVsUpJb/dnXcTON34/uRrMVPLdSzh0
	Olx/OYmtw0bRt41BEOhh3hTeDe+bTbtRs7aoiKadP8mxpWmbIhbvUR7vaVKdIkv/5p0iDy8sz5Yxv
	iOl48vIo5KjswFoiVcOTzcQFi1fgryS2+MEaRMaeXh/9hGOndkdTCB5WcXkvP06r7n0/VaPBfzr7A
	m5FTU1KW3uAuFS/AFiXrz1xd6xtxK1jbqNLjORq4RD9M8dzWXTj+so0fIQagACDqasfBpZEezgNhf
	RYlMr7OP/AYBZB+jaHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuk8-00000000VGn-3qXO;
	Sat, 21 Nov 2026 23:43:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuk4-00000000VEu-0xlB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 23:43:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2653A16F2;
	Sat, 21 Nov 2026 15:43:32 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37C463F632;
	Sat, 21 Nov 2026 15:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304615; bh=kCb2vXk43N6EA15KnutMEDFVvCutj0Y3CtplbWRuKk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+MPzQBxYByHNiQNM7X4BWA7zmfy1JTT+yMVYj3ANPNiyreXPh+pRpWdhwB/QfHR+
	 Dzw0tLny6hLDVgXMf9Gti6xMb3hYv+p0dB84JtsYjizZEDaTDEF7qkFUxan7Zs4AtX
	 G0T0OQx2NzP7lkKM8I9ma3lxaXfBnIiVi7LHFTD8=
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
Subject: [PATCH v16 03/31] firmware: arm_scmi: Add centralized detection of truncated replies
Date: Sat, 21 Nov 2026 23:39:37 +0000
Message-ID: <20261121234005.1525419-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_154336_361479_E2F4E83D 
X-CRM114-Status: GOOD (  17.30  )
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

When an xfer is allocated with a very well known fixed reply size by
providing a non-zero rx_size parameter to xfer_get_init(), it becomes
possible to verify if the effectively received reply was truncated.

Add the logic to detect and report truncated replies.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 12 ++++++++++++
 drivers/firmware/arm_scmi/protocols.h |  8 ++++++++
 drivers/firmware/arm_scmi/raw_mode.c  |  1 +
 3 files changed, 21 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a9b0f704c39b..12c215d04d43 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1356,6 +1356,16 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
 		}
 	}
 
+	/* Check for truncated messages..it will be logged by the caller */
+	if (!ret && !xfer->hdr.status && xfer->expected_rx_len &&
+	    xfer->expected_rx_len != xfer->rx.len) {
+		dev_dbg(dev,
+			"Truncated reply - HDR:%08X  expected:%zd  received:%zd\n",
+			pack_scmi_header(&xfer->hdr), xfer->expected_rx_len,
+			xfer->rx.len);
+		xfer->hdr.status = SCMI_ERR_COMMS;
+	}
+
 	return ret;
 }
 
@@ -1616,6 +1626,8 @@ static int xfer_get_init(const struct scmi_protocol_handle *ph,
 
 	xfer->tx.len = tx_size;
 	xfer->rx.len = rx_size ? : info->desc->max_msg_size;
+	/* When a specific rx_size was specified, check for truncation */
+	xfer->expected_rx_len = rx_size ? : 0;
 	xfer->hdr.type = MSG_TYPE_COMMAND;
 	xfer->hdr.id = msg_id;
 	xfer->hdr.poll_completion = false;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index c15ec188291a..50b89c56e309 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -106,6 +106,13 @@ struct scmi_msg_hdr {
  * @rx: Receive message, the buffer should be pre-allocated to store
  *	message. If request-ACK protocol is used, we can reuse the same
  *	buffer for the rx path as we use for the tx path.
+ * @expected_rx_len: The expected length of the payload in the reply, excluding
+ *		     the status field. When set to a non-zero value this is used
+ *		     to evaluate if a reply had been possibly truncated due to a
+ *		     misconfigured transport: it is only set to some meaningful
+ *		     non-zero value for replies having a very well known fixed
+ *		     size, definitely not for variable-sized xfers with an RX
+ *		     len initialized to max_msg_size.
  * @done: command message transmit completion event
  * @async_done: pointer to delayed response message received event completion,
  *		or NULL when no delayed response is expected. Protected by
@@ -139,6 +146,7 @@ struct scmi_xfer {
 	struct scmi_msg_hdr hdr;
 	struct scmi_msg tx;
 	struct scmi_msg rx;
+	size_t expected_rx_len;
 	struct completion done;
 	struct completion *async_done;
 	bool pending;
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 7e42dd6cc2af..45206edff446 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -574,6 +574,7 @@ static int scmi_xfer_raw_get_init(struct scmi_raw_mode_info *raw, void *buf,
 	xfer->hdr.status = SCMI_SUCCESS;
 	xfer->tx.len = tx_size;
 	xfer->rx.len = raw->desc->max_msg_size;
+	xfer->expected_rx_len = 0;
 	/* Clear the whole TX buffer */
 	memset(xfer->tx.buf, 0x00, raw->desc->max_msg_size);
 	if (xfer->tx.len)
-- 
2.54.0


