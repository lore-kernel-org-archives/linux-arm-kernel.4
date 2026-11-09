Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D47606EE83
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VBO1mM1t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DTSDGA7Z;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WGsaCd4o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PjsDcIwG04TmODXdDk875Fbl6S3uxlA1cenk9DEJCXo=; b=VBO1mM1tGzsEZL
	5URAlozSa8tvdm2I2yjjNlPcGA9aNsuXtFUYyyMu9/HJ8g9ZJyISH464gqDbsgz5afmfy8QTkQGVD
	4Ipkf6MF/o10V3qCohketrFHR4p0bjsNwjPi6fGq2VBHkx/uNjASOUR9HS+sydyjByeJkgl3PZRRl
	mDdescb1vfyN549lVSeHB7zbSdwI1V9lAJ0vGmw0LhqqOMrzm43aE8jjHeT/iDKQVDz3Hd7ABpmOG
	w8RO+FITR8rPxUq8VsvvEB7TFIdO2lCnwFFzFbsnH1CqDRAA9FKxOJlzAdVE046bzCcfh5tEJd3CK
	Ac1evOZK+QYMhF+rn7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUP-00000000Cuv-0OQ3;
	Mon, 09 Nov 2026 09:16:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUN-00000000CrH-2uI5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 09:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PjsDcIwG04TmODXdDk875Fbl6S3uxlA1cenk9DEJCXo=; b=DTSDGA7ZfB9tLRT7nkfeHSVIlk
	GOO7iyOEja5mK1sRc3ZMI6cW49X3GIXcS6sSS+KnrEl4hmz2IaaSuIztegMyrY4krRDH38lV+J3T7
	tRf8rSjwU3dwuQIXqgCZKYVV0NoLo4mJTrLQrdI7taib2sMz3KKvvdWgC/RIMqJvp3cwq1TrfcA//
	m5pGYRNRzisKrlRdBKojn4r9h31wcyPKYQ5LNtHqXEoxz2FHKRLvmAVojLpz2SeXqJc1tbPNg6Wbt
	7auIGUb8GcJqJRbJ86sZdbfADXqhuJavtMEUcnk8Y/8blNTWx9VPF/hiC4kbDUBqOyu2WkDWGUmLa
	11tTDnfA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUJ-00000006Vo1-3lk8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7959315A1;
	Mon,  9 Nov 2026 01:16:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D6E3F85F;
	Mon,  9 Nov 2026 01:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215786; bh=24aCbuqzFNJvnaf3Y/y65CRhQlCLaPit95os5BSF7Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGsaCd4ooRqqRmTRsZoMt6nQaIZznMi+W2WaM3T3xI1uIMggRpoLiJRufIQrueYlb
	 Y9hrUBQxIYAn8BzaNCFC64mfb/HwOMWTebZ9OOnt72Wwx25nwQU3QzUwC6V8t0RlK0
	 R4s4R1AFtkIu2vCAuxROsBkBHGQFwS4keHVRYI3k=
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
Subject: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to get/put protocols operations
Date: Mon,  9 Nov 2026 09:12:14 +0000
Message-ID: <20261109091221.2532706-29-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_091628_342384_C9773F06 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -2.5 (--)
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

Add a couple of simple common methods to be able to manually get and put
protocol operations to address situation in which devres managed methods
cannot be used.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v10 --> v11
 - fixed a few comments typos
---
 drivers/firmware/arm_scmi/driver.c | 39 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  7 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 015dc8473161..c2166a48bc86 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2641,6 +2641,31 @@ scmi_devm_protocol_get(struct scmi_device *sdev, u8 protocol_id,
 	return pi->proto->ops;
 }
 
+/**
+ * scmi_protocol_operations_get  - UnManaged get protocol operations
+ *
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being acquired.
+ * @ph: A pointer reference used to pass back the associated protocol handle.
+ */
+static const void __must_check *
+scmi_protocol_operations_get(const struct scmi_handle *handle, u8 protocol_id,
+			     struct scmi_protocol_handle **ph)
+{
+	struct scmi_protocol_instance *pi;
+
+	if (!ph)
+		return ERR_PTR(-EINVAL);
+
+	pi = scmi_get_protocol_instance(handle, protocol_id);
+	if (IS_ERR(pi))
+		return pi;
+
+	*ph = &pi->ph;
+
+	return pi->proto->ops;
+}
+
 /**
  * scmi_devm_protocol_acquire  - Devres managed helper to get hold of a protocol
  * @sdev: A reference to an scmi_device whose embedded struct device is to
@@ -2697,6 +2722,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
 	WARN_ON(ret);
 }
 
+/**
+ * scmi_protocol_operations_put  - UnManaged put protocol operations
+ *
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being released.
+ */
+static void scmi_protocol_operations_put(const struct scmi_handle *handle,
+					 u8 protocol_id)
+{
+	scmi_protocol_release(handle, protocol_id);
+}
+
 /**
  * scmi_is_transport_atomic  - Method to check if underlying transport for an
  * SCMI instance is configured as atomic.
@@ -3489,6 +3526,8 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
 	handle->devm_protocol_get = scmi_devm_protocol_get;
 	handle->devm_protocol_put = scmi_devm_protocol_put;
+	handle->protocol_get = scmi_protocol_operations_get;
+	handle->protocol_put = scmi_protocol_operations_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
 	/* Setup all channels described in the fwnode at first */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 4fa32d629e7a..8c143cbddb5f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1145,6 +1145,9 @@ struct scmi_notify_ops {
  * @devm_protocol_get: devres managed method to acquire a protocol and get specific
  *		       operations and a dedicated protocol handler
  * @devm_protocol_put: devres managed method to release a protocol
+ * @protocol_get: unmanaged method to acquire a protocol and get specific
+ *		  operations and a dedicated protocol handler
+ * @protocol_put: unmanaged method to release a protocol
  * @is_transport_atomic: method to check if the underlying transport for this
  *			 instance handle is configured to support atomic
  *			 transactions for commands.
@@ -1167,6 +1170,10 @@ struct scmi_handle {
 		(*devm_protocol_get)(struct scmi_device *sdev, u8 proto,
 				     struct scmi_protocol_handle **ph);
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
+	const void __must_check *
+		(*protocol_get)(const struct scmi_handle *handle, u8 proto,
+				struct scmi_protocol_handle **ph);
+	void (*protocol_put)(const struct scmi_handle *handle, u8 proto);
 	bool (*is_transport_atomic)(const struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
 	const struct scmi_notify_ops *notify_ops;
-- 
2.54.0


