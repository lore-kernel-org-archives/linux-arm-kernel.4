Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC046082BDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvw/lVWc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FRFd7GoG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5OSbYsjVbk7sBZRSq4oF4KiblhSWQYBItw33ZmHO1fY=; b=zvw/lVWcvC41Dg
	XLlKbc86XYHSQ1ZMNso1faFg8Kis+IqeCJeA/tr27hnoC9xCRSq4rYfNa/fBn7kGplpN9c3TYOhNJ
	qiait15EKuI2Yg6pbluJMU2Awl8rPtYqenXUtWgBq23SGfOCYfNaTeqBba0wOc3iRxaP83njE+hBr
	iAObJf69KWdf8prXOpoNLhC99isMPqMepRr42eymjafCEitdOmvAFQNQdidfYezVZGBXlkOhsMmlX
	Fto4K4OrtHvt4QWfabLnSML69TisRBSnptq77XXDjQNEletT7l+8L5MKu7d88g232dd/ox/ZdNrge
	eLDYAQ/l8yZ8LRE+9kaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLU4-00000000CSQ-2nHP;
	Mon, 09 Nov 2026 09:16:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTp-00000000Bz2-1EDU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAF9214BF;
	Mon,  9 Nov 2026 01:15:53 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E839F3F85F;
	Mon,  9 Nov 2026 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215756; bh=kVCnoQAcllZc+P+esXe8zD+18P94SjyZYSjiqZWO6S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRFd7GoGiOl1puAlkGYoRoW0BulZLcOt5zdaEh9Fae7nkObuu72suhNoU5a+ljTss
	 16lPnt6ZGJnPyoRwZT8jWV4lf9Ix8KYFr5yoc1Pf/gKrbYFA1Fr+WugHoAb/lF6jno
	 Ch48j0mTKW8p+S2Z9bFlC9dHN66YH7UmxbN+AyWk=
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
Subject: [PATCH v15 19/35] firmware: arm_scmi: Add Telemetry reset logic
Date: Mon,  9 Nov 2026 09:12:05 +0000
Message-ID: <20261109091221.2532706-20-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011557_428355_B13EB196 
X-CRM114-Status: GOOD (  19.47  )
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

Add support for Telemetry operations needed to request platform to
reset telemetry current configuration and data events values.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - clear cached_msg on RESET
 - clearstreaming_mode instead of notif_enabled
v13 --> v14
 - add a barrier to acquire rinfo->num_des on reset
 - avoid lock inversion on config_mtx
v12 --> v13
 - relocate tde->mtx guards higher up and add lockdep assertions
 - unlink BLKTS under tde->mtx on local free
v11 --> v12
 - using config_mtx to sync with ongoing configurations
 - use proper helpers to update cache state
v10 --> v11
 - protect TDE updates on reset
 - use des_enable mutex when clearing des cache
 - zero also active_update_interval
v8 --> v9
 - add a commment on why NOT unlinking UUID
v6 --> v7
 - add proper cleanup of sid/offs/uuids and caches on RESET
v5 --> v6
 - added missing reset of global state
v3 --> v4
 - reset tracked Telemetry DE state
v2 --> v3
 - split from monolithic Telemetry patch
 - use scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 81 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  2 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index bf37faf99865..ebad4ec2afda 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3969,6 +3969,86 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_des;
+
+	ti->info.enabled = false;
+	ti->info.current_mode = SCMI_TLM_ONDEMAND;
+	ti->streaming_mode = false;
+	ti->info.active_update_interval = 0;
+
+	/* Get rinfo without triggering an enumeration, cannot be NULL anyway */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	/* Make sure to see the latest num_des */
+	num_des = smp_load_acquire(&rinfo->num_des);
+	/* Clear all local state...*/
+	for (int i = 0; i < num_des; i++) {
+		struct telemetry_de *tde = to_tde(rinfo->des[i]);
+
+		scoped_guard(mutex, &tde->mtx) {
+			tde->last_ts = 0;
+			tde->last_val = 0;
+			tde->last_magic = 0;
+			tde->cached_msg = false;
+			if (!tde->de.fc_support) {
+				tde->sid = SHMTI_ID_INVALID;
+				tde->base = NULL;
+				tde->offset = 0;
+				tde->eplg = NULL;
+			}
+
+			scmi_telemetry_de_state_update(ti, ENA_STATE,
+						       &tde->de.enabled, false);
+
+			if (tde->de.tstamp_support)
+				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+							       &tde->de.tstamp_enabled,
+							       false);
+
+			/*
+			 * Unlinking ONLY BLK_TS lines since, per the SCMI spec,
+			 * the UUID/DE associations are permanent within the same
+			 * session boot: after a reset has cleared the server-side
+			 * configuration the next time SHMTIs will be re-populated,
+			 * these same UUID/DE associations will be re-instated.
+			 */
+			scmi_telemetry_blkts_unlink(tde);
+		}
+	}
+
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		rinfo->grps[i].enabled = false;
+		rinfo->grps[i].tstamp_enabled = false;
+		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
+		rinfo->grps[i].active_update_interval = 0;
+	}
+}
+
+static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_xfer *t;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(0, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		scmi_telemetry_local_resources_reset(ti);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -3979,6 +4059,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.de_data_read = scmi_telemetry_de_data_read,
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
+	.reset = scmi_telemetry_reset,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 7177f739f062..012894e1d9be 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1024,6 +1024,7 @@ struct scmi_telemetry_de_sample {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -1051,6 +1052,7 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, unsigned int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0


