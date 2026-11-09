Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B0606D834
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiLf4nVX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KCf48VUW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LbcHXNbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YM+mipvDK5NxibPxkPn9Srng6miYHDN2FOwdewCrHKk=; b=fiLf4nVXcq7bOd
	+YjehTOBGCLEJRRDW5oZhNTK2auipCKKwebtmsRKaERFedNurATRZZfWpRlAsLDXNsZDFgC4zScKg
	I+6HN1Dzh8JMwWtVdNStyLkoBJW7cyaCJ+6x2+6hYQF8u4MayQpp0u6T9k2r5W4Pm/Qo5NFVW9U7B
	OTx0npvjUK1JUqBN1UPKTsjaP34JhMEQy1Mt/7Y2vHYyfEu4Z5Rgr1c3aGsPSUq/LxSwwsP+ejTf3
	fQXtmzJvCJQKDOAEJMUFyTFVcoWy9Ohb4weFmMU4qF+kLpROXLLksi6GCuz/AIXULnh4yfBwE6hEg
	mVhX4DIQ/t8j+FKcjD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTg-00000000BvL-3UE6;
	Mon, 09 Nov 2026 09:15:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTY-00000000Bk6-0bXG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 09:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YM+mipvDK5NxibPxkPn9Srng6miYHDN2FOwdewCrHKk=; b=KCf48VUWrg1Dc4nj0NmkUrPv8P
	XnkcBwzsZj5xO/3DNmlrzDoOOUDuxHDvow/SpWKLbsadG9mu+MKc13ZM6ilLSo/hA0YPM2sOxlP7f
	uleNLekmd/IGS0h4Wr2Ypbc8FlsmTi90OLYQBrJueR2KKHrmL+b4/VEaL3CEdPqs4YGLxesKkCN6T
	rZELJ9nk7sntWiSQ2FmsoS4fg2c7+MCshLQk9tGPmd1hQGpKYnxjto/MnCGsWuAAbctGFS2O//Z8R
	iGx2edKycuDHnx+QCUDE6Ogwq2oMOG1ti47NAJmxjUclt4Re+JDvOQOMChipW7NsygnIH0Yb21UHT
	QKkPyM5g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTS-00000006Van-2IUi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8487115A1;
	Mon,  9 Nov 2026 01:15:28 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1ED43F85F;
	Mon,  9 Nov 2026 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215731; bh=O1wQhmHtXR4EVUqNjtp/1IOFgHYF9RkpriVNYuK5Vow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbcHXNbfnzNp3YwWEoUEhKRM3qcAJTJRpHG9s6C0RcAXcx7lbV27XT+3Uyu7FwVkt
	 bEDwnLARigXGcjSYbhZP3226Mk4o8XJhIA9qDURMsqqW8w2Wr3CoxDOlLDNIqAFZb5
	 M3PbYTIRxPPEUZMs80rRTPm5Tp2Mb6pXlxObYYfI=
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
Subject: [PATCH v15 11/35] firmware: arm_scmi: Add Telemetry groups initialization
Date: Mon,  9 Nov 2026 09:11:57 +0000
Message-ID: <20261109091221.2532706-12-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_091534_940249_723317BA 
X-CRM114-Status: GOOD (  22.83  )
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

Allocate and initialize Telemetry Groups from base DataEvent data.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - removed needless vars from groups_init
 - bailout from group initialization when NO DEs were found
 - better handling of error path on groups init
v13 --> v14
- splitted out of the old Basic Telemetry patch, contains the
  groups initialization code.
---
 drivers/firmware/arm_scmi/telemetry.c | 154 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |  24 ++++
 2 files changed, 176 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index db4108ef0232..9944506652f5 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -387,6 +387,7 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 {
 	const struct scmi_de_desc *desc = *next;
 	size_t payld_sz = sizeof(*desc);
+	unsigned int grp_id;
 
 	lockdep_assert_held(&tde->mtx);
 
@@ -394,7 +395,22 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 		return -ENOSPC;
 
 	tde->de.info->id = le32_to_cpu(desc->de_id);
-	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
+	grp_id = le32_to_cpu(desc->group_id);
+	if (grp_id != SCMI_TLM_GRP_INVALID) {
+		struct scmi_telemetry_res_info *rinfo;
+
+		/* Get rinfo without triggering a recursive enumeration */
+		rinfo = __scmi_telemetry_resources_get(ti);
+
+		/* Group descriptors are empty but allocated at this point */
+		if (grp_id >= ti->info.base.num_groups)
+			return -EINVAL;
+
+		/* Link to parent group */
+		tde->de.grp = &rinfo->grps[grp_id];
+	}
+
+	tde->de.info->grp_id = grp_id;
 	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
 	tde->de.info->type = GET_DE_TYPE(desc);
 	tde->de.info->unit = GET_DE_UNIT(desc);
@@ -546,6 +562,102 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	if (tde->de.fc_support)
 		list_add(&tde->item, &ti->fcs_des);
 
+	/* Account for this DE in group num_de counter */
+	if (tde->de.grp)
+		tde->de.grp->info->num_des++;
+
+	return 0;
+}
+
+static int
+scmi_telemetry_de_groups_init(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_groups = 0;
+
+	/* Get rinfo without triggering a recursive enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	/* Bailout when no DEs were discovered */
+	if (!rinfo->num_des)
+		return 0;
+
+	/* Allocate all groups DEs IDs arrays at first ... */
+	for (int i = 0; i < ti->info.base.num_groups; i++, num_groups++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+		size_t des_str_sz;
+
+		unsigned int *des __free(kfree) =
+			kzalloc_objs(unsigned int, grp->info->num_des);
+		if (!des)
+			break;
+
+		/*
+		 * Max size 32bit ID string in Hex: 0xCAFECAFE
+		 *  - 10 digits + ' '/'\n' = 11 bytes per  number
+		 *  - terminating NUL character
+		 */
+		des_str_sz = grp->info->num_des * 11 + 1;
+		char *des_str __free(kfree) = kzalloc_objs(*des_str, des_str_sz);
+		if (!des_str)
+			break;
+
+		grp->des = no_free_ptr(des);
+		grp->des_str = no_free_ptr(des_str);
+	}
+
+	/* Unroll on failure... */
+	if (num_groups < ti->info.base.num_groups) {
+		for (int i = num_groups - 1; i >= 0; i--) {
+			kfree(rinfo->grps[i].des);
+			rinfo->grps[i].des = NULL;
+			kfree(rinfo->grps[i].des_str);
+			rinfo->grps[i].des_str = NULL;
+		}
+
+		return -ENOMEM;
+	}
+
+	/* Reset group DE counters before populating */
+	for (int i = 0; i < ti->info.base.num_groups; i++)
+		rinfo->grps[i].info->num_des = 0;
+
+	/* Scan DEs and populate DE IDs arrays for all groups */
+	for (int i = 0; i < rinfo->num_des; i++) {
+		struct scmi_telemetry_group *grp;
+
+		grp = rinfo->des[i]->grp;
+		if (!grp)
+			continue;
+
+		/*
+		 * Note that, at this point, num_des is guaranteed to be
+		 * sane (in-bounds) by construction.
+		 */
+		grp->des[grp->info->num_des++] = i;
+	}
+
+	/* Build composing DES string */
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+		size_t bufsize = grp->info->num_des * 11 + 1;
+		char *buf = grp->des_str;
+
+		for (int j = 0; j < grp->info->num_des; j++) {
+			char term = j != (grp->info->num_des - 1) ? ' ' : '\0';
+			int len;
+
+			len = scnprintf(buf, bufsize, "0x%08X%c",
+					rinfo->des[grp->des[j]]->info->id, term);
+
+			buf += len;
+			bufsize -= len;
+		}
+	}
+
+	/* Expose all groups once all fully initialized */
+	rinfo->num_groups = num_groups;
+
 	return 0;
 }
 
@@ -578,7 +690,7 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	if (ret)
 		return ret;
 
-	return 0;
+	return scmi_telemetry_de_groups_init(ti);
 }
 
 static const struct scmi_telemetry_info *
@@ -653,6 +765,18 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 	if (!dei_store)
 		return -ENOMEM;
 
+	/* Array to hold descriptors of discovered GROUPs */
+	struct scmi_telemetry_group *grps __free(kfree) =
+		kzalloc_objs(*grps, ti->info.base.num_groups);
+	if (!grps)
+		return -ENOMEM;
+
+	/* Allocate a set of contiguous Group info descriptors. */
+	struct scmi_telemetry_grp_info *grps_store __free(kfree) =
+		kzalloc_objs(*grps_store, ti->info.base.num_groups);
+	if (!grps_store)
+		return -ENOMEM;
+
 	struct scmi_telemetry_res_info *rinfo __free(kfree) =
 		kzalloc_obj(*rinfo);
 	if (!rinfo)
@@ -667,12 +791,20 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 		scmi_telemetry_free_tdes_add(ti, &tdes[i]);
 	}
 
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		grps_store[i].grp_id = i;
+		/* Bind contiguous Group info struct */
+		grps[i].info = &grps_store[i];
+	}
+
 	INIT_LIST_HEAD(&ti->fcs_des);
 
 	ti->tdes = no_free_ptr(tdes);
 
 	rinfo->des = no_free_ptr(des);
 	rinfo->dei_store = no_free_ptr(dei_store);
+	rinfo->grps = no_free_ptr(grps);
+	rinfo->grps_store = no_free_ptr(grps_store);
 
 	/* Ensure all of the above assignments are visible */
 	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
@@ -701,6 +833,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	kfree(rinfo->des);
 	kfree(rinfo->dei_store);
 
+	kfree(rinfo->grps);
+	kfree(rinfo->grps_store);
+
 	kfree(rinfo);
 
 	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
@@ -722,10 +857,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 	xa_destroy(&ti->xa_des);
 }
 
+static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
+{
+	/* Cannot be NULL here by construction, make sure it remains like that */
+	if (WARN_ON(!rinfo))
+		return;
+
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+
+		kfree(grp->des);
+		kfree(grp->des_str);
+	}
+}
+
 static void scmi_telemetry_instance_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
 
+	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index cc5bd87705ed..c81b4ceb84b3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -830,6 +830,22 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+#define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
+
+struct scmi_telemetry_grp_info {
+	unsigned int grp_id;
+	unsigned int num_des;
+	unsigned int num_intervals;
+};
+
+struct scmi_telemetry_group {
+	bool enabled;
+	bool tstamp_enabled;
+	unsigned int *des;
+	char *des_str;
+	struct scmi_telemetry_grp_info *info;
+};
+
 struct scmi_telemetry_de_info {
 	unsigned int id;
 	unsigned int grp_id;
@@ -852,6 +868,7 @@ struct scmi_telemetry_de {
 	bool enabled;
 	bool tstamp_enabled;
 	struct scmi_telemetry_de_info *info;
+	struct scmi_telemetry_group *grp;
 };
 
 struct scmi_telemetry_res_info {
@@ -859,6 +876,13 @@ struct scmi_telemetry_res_info {
 	unsigned int num_des;
 	struct scmi_telemetry_de **des;
 	struct scmi_telemetry_de_info *dei_store;
+	unsigned int num_groups;
+	/*
+	 * Allocated at max capacity and populated dynamically
+	 * at runtime, cannot be counted_by num_groups.
+	 */
+	struct scmi_telemetry_group *grps;
+	struct scmi_telemetry_grp_info *grps_store;
 };
 
 struct scmi_telemetry_base_info {
-- 
2.54.0


