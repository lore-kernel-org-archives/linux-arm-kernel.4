Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d43equ2E;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sIotvm5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zHQArU5+8YrrsMC04rgV10DYKpSzcQP+GuriGqIefiY=; b=d43equ2EcJ6zpt
	khQUvWTOO3emn+peTKpT4UMLuEGaFNeTrbAXwUj53RXK7krJEpijMQCzOLfosuspeyPgiHi+ZUyYb
	6lmTPhOTcdXYzBECGl7F5Z7VHW8AaIV6R3Wz0hcopeu+6+UEaLhnTypS8glwHW+QnFkVyiGyj9h1e
	PQgZXRXB3yfcIrmTFK2fKQ5vTvJaZf2sj+4nSu6qog29TLczqbguB4oRJbwobc2+cXX/ssqOrpuzL
	7/bA20jSDaXmBdKCbuKwUy5NbMGw6WJqaRjVINfGuYI6Rcat0fqd+hJAiMc/H8EFZJAbKHTrhyF/d
	1SK/FNzUgLTj0LWoOBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYp-00000007eMA-483b;
	Tue, 24 Nov 2026 19:52:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYB-00000007dzp-1vmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:51:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB0A716F3;
	Tue, 24 Nov 2026 11:51:31 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6D4D3F763;
	Tue, 24 Nov 2026 11:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549894; bh=UTTDVQsIfnDCYfh79QIOFkJU/xtZ/+rCNzuC10SDm8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sIotvm5oSSxtLKKfKCabWLDl4V4OEO3FqeMhuVQpTvNDbgSNTX6bxsNZS1C3ZfJgO
	 iY0LHp1SlW9U0IeJdLhlBIr+sFcso8TymtoPCyL+/WNb32+nA3eNkPgSSf/bw3X6kT
	 uRiz2yTEyTA6rYm05tLuPMZQbk5NLLk4xpwLp5A0=
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
Subject: [PATCH v17 23/34] firmware: arm_scmi: Refactor protocol allocation
Date: Tue, 24 Nov 2026 19:48:29 +0000
Message-ID: <20261124194841.1147072-24-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115135_622252_8E5CF220 
X-CRM114-Status: GOOD (  13.84  )
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

Simplify protocol initialization and finalization using cleanup handlers.
Relocate the protocol put operations out of the setup and cleanup code so
as to be executed strictly after the protocol devres groups have been
fully released.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 123050335969..54d9780b7e87 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2306,24 +2306,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
  *
  * Context: Assumes to be called with @protocols_mtx already acquired.
  * Return: A reference to a freshly allocated and initialized protocol instance
- *	   or ERR_PTR on failure. On failure the @proto reference is at first
- *	   put using @scmi_protocol_put() before releasing all the devres group.
+ *	   or ERR_PTR on failure.
  */
 static struct scmi_protocol_instance *
 scmi_alloc_init_protocol_instance(struct scmi_info *info,
 				  const struct scmi_protocol *proto)
 {
+	const struct scmi_handle *handle = &info->handle;
+	struct scmi_protocol_instance *pi;
 	int ret = -ENOMEM;
 	void *gid;
-	struct scmi_protocol_instance *pi;
-	const struct scmi_handle *handle = &info->handle;
 
 	/* Protocol specific devres group */
 	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
-	if (!gid) {
-		scmi_protocol_put(proto);
-		goto out;
-	}
+	if (!gid)
+		return ERR_PTR(ret);
 
 	pi = devm_kzalloc_obj(handle->dev, *pi);
 	if (!pi)
@@ -2378,10 +2375,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	if (pi->proto->instance_deinit)
 		pi->proto->instance_deinit(&pi->ph);
 clean:
-	/* Take care to put the protocol module's owner before releasing all */
-	scmi_protocol_put(proto);
 	devres_release_group(handle->dev, gid);
-out:
 	return ERR_PTR(ret);
 }
 
@@ -2401,25 +2395,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
-	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	struct scmi_protocol_instance *pi;
+	const struct scmi_protocol *proto;
 
-	mutex_lock(&info->protocols_mtx);
+	guard(mutex)(&info->protocols_mtx);
 	pi = idr_find(&info->protocols, protocol_id);
-
 	if (pi) {
 		refcount_inc(&pi->users);
-	} else {
-		const struct scmi_protocol *proto;
-
-		/* Fails if protocol not registered on bus */
-		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
-			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+		return pi;
 	}
-	mutex_unlock(&info->protocols_mtx);
+
+	/* Fails if protocol not registered on bus */
+	proto = scmi_protocol_get(protocol_id, &info->version);
+	if (!proto)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	pi = scmi_alloc_init_protocol_instance(info, proto);
+	if (IS_ERR(pi))
+		scmi_protocol_put(proto);
 
 	return pi;
 }
@@ -2452,12 +2446,13 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
+	guard(mutex)(&info->protocols_mtx);
 	pi = idr_find(&info->protocols, protocol_id);
 	if (WARN_ON(!pi))
-		goto out;
+		return;
 
 	if (refcount_dec_and_test(&pi->users)) {
+		const struct scmi_protocol *proto = pi->proto;
 		void *gid = pi->gid;
 
 		if (pi->proto->events)
@@ -2468,15 +2463,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 
 		idr_remove(&info->protocols, protocol_id);
 
-		scmi_protocol_put(pi->proto);
-
 		devres_release_group(handle->dev, gid);
+		scmi_protocol_put(proto);
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
-
-out:
-	mutex_unlock(&info->protocols_mtx);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
-- 
2.54.0


