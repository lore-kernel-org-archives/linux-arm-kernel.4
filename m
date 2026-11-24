Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4GsUj9X;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hC7gz91+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3HrwYbYeRKwhWvtwePQmsJVNwLGkYk2BRyepq/uuTWk=; b=B4GsUj9Xc+jiWZ
	O/puaAUPDQzRvytkA3YtPnSfanvg87Ms4CZ1HFnaYclOzsj6592w24+F/dzW/lXXI7qsaNsvnGMdZ
	gXwRfNuV8/Yhdv09R/286GEKf5d8V71K3QTeaWS2sSRXq0x3RvPb+JlOCTiTJnuCZWXQFW4QFe93A
	acaJ+Cyq41fPYny4pz/dhlv3eHg9FzZsdMWmPKy+FmCYIQNPlVCccUIEm6nt5TPZ38UXEXJoiWYlA
	gIZEoQGcLcfF+sn112JACPpkz17UES0Q4cUUbsAfcfoHix5dJEeLL7SWVSrQJOp3X7KcCNnzcvFbe
	Ozde8bp3hc3YWqPYefDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvcI-00000007Xrf-0nDZ;
	Tue, 24 Nov 2026 18:51:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvc9-00000007XoI-0jZo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:51:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D35B316F3;
	Tue, 24 Nov 2026 10:51:33 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FE9A3F86C;
	Tue, 24 Nov 2026 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795546296; bh=reLjI8ZY114XEuMwYzlvXp4Ql2o+omVz+I8QfgMTkOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hC7gz91+aJPJmR+PIIVh/7/EHn9yRj6IekgR7gxbBmRgc3KNl8XdhdKb74+IXRyEw
	 SB+dLH6oNgpFiG/a/JFJ1R+y2dGkkjhDDyaNBfk91y61wFrR1hKN/KMmpaAsx18Jw0
	 4FfB6X4rso5gb/2lwQAOYIGxfx1LHuUizpRdSJeI=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Date: Tue, 24 Nov 2026 18:51:11 +0000
Message-ID: <20261124185111.1022322-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124185111.1022322-1-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_105137_288896_AD177D2A 
X-CRM114-Status: GOOD (  13.96  )
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
index 2c4424aa0d37..199f0a189432 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
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
@@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	if (pi->proto->instance_deinit)
 		pi->proto->instance_deinit(&pi->ph);
 clean:
-	/* Take care to put the protocol module's owner before releasing all */
-	scmi_protocol_put(proto);
 	devres_release_group(handle->dev, gid);
-out:
 	return ERR_PTR(ret);
 }
 
@@ -2351,25 +2345,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
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
@@ -2402,12 +2396,13 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
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
@@ -2418,15 +2413,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 
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


