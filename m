Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED006083608
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xlZWalJz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=T9g5uoK3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PKc/+PjB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZliLoTOyQMZxDeBt88NC1Lduh8AAHkgsG8U0rRDLJlg=; b=xlZWalJz5YVvpv
	ufYzDU4xJlLf1dtFGubJhCv0I00zeNt/9eiR8o51efQ59I2OSmstEKzJ0pvuAgUpJ1c1Hcwt0Ym+j
	1+cizaCTt/CckrtyiBH9QT8EFZ5hbs7zGZQWWAY8wPIQHPYTyPQDHdfqmTRdTvbJnMMA4X24I2Wnh
	wNkuMuUCFQZbZ4+asAvqQgPEy7egLWfPGNMmhitSsfIuiAtJLOPXLTYuk5rNkkXb15LXUy0DXqvRG
	aVtKciraWYwCXWUBNG6dJ86vT85PVd+Pa2ezhJdAzOxiMThYl8dWW1IZbFAAYCpNFPpfJG1AHnvV/
	LAKRDp1hKyQWKza0VD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUO-00000000CuI-3V6f;
	Mon, 09 Nov 2026 09:16:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUD-00000000Cfx-3gqA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 09:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZliLoTOyQMZxDeBt88NC1Lduh8AAHkgsG8U0rRDLJlg=; b=T9g5uoK3BAuRY9TjCK2GW0lP43
	pJSMOqy1opMuQ5t61G8bqfhN+Xi8PMxnBDXX+8xwmQoxXypDQhiPw5xRVGxZyZyoq7k7CxCZcBzj1
	fxob39phtUOZcv9avv3rvQfoXh2ZPifjCtVWoPNJk3/kOMAXeVAC33HXPCN590C3jYUDtpfcQGGHG
	XhwLtVlmdEH5596YcZzE8jQgpNVMPWIo4uFjyV9vrT2Pa9WEtdgZR5DOYdZKioh5PVu4qoBET1dpk
	x17JGPmBvcNhTBh5AQEJaQ40ovVChQ9RiK0k05HCJKgk+1Q28KkdLHrwUK3LfRXJhbqvmYWaoo/5p
	J2LFKw7g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUA-00000006ViR-1wPC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B1C15A1;
	Mon,  9 Nov 2026 01:16:14 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214153F85F;
	Mon,  9 Nov 2026 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215777; bh=EyFuXjh0NpCGpHb+y4On/CW4yO1lMeHSoYYXTpPOeXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKc/+PjBjTtp1dc5dXBkvKwc/UAocxRUJpa9M4eKl99SG2r680BWKg4eu9EOfSwae
	 yDOiWcayUFhJrXVfrlU5eS2zabz9c0P+WanjeA782EDOcc8NPeHy03EW55Qa46wEd5
	 tUiogjzQzngXMVcR/OrOQReWHcMG9aK4D1+9oGuQ=
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
Subject: [PATCH v15 25/35] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Mon,  9 Nov 2026 09:12:11 +0000
Message-ID: <20261109091221.2532706-26-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_091619_054305_7B7D433C 
X-CRM114-Status: GOOD (  19.41  )
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

Expose one debugfs entry for each discovered SHMTI that can be used to
dump the related SHMTI in binary form from TBGN up to TEND markers.

No processing is done kernel side, beside using proper accessors for
device memory.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - cleanup local debugfs subtree with debugfs_remove_recursive on remove
v12 --> v13
 - get inode lock on time update
v11 --> v12
 - fix debugfs shmti dump file to use the SID as name
v8 --> v9
 - use kvzalloc/kfree
 - use file_update_time to update debugfs file ts
v5 --> v6
 - added mutex to protect binary dump buffer during reads (Sashiko)
 - using debugfs_create_file_size() (Sashiko)
---
 drivers/firmware/arm_scmi/telemetry.c | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index c21700bd1b43..7582fe295a23 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -9,10 +9,12 @@
 #include <linux/bitfield.h>
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/eventfd.h>
+#include <linux/fs.h>
 #include <linux/hash.h>
 #include <linux/hashtable.h>
 #include <linux/jhash.h>
@@ -463,6 +465,14 @@ struct telemetry_shmti {
 #define TDCF_OFFS(_b, _p)				\
 	((unsigned long)((__force void *)(_p) - (__force void *)(_b)))
 
+struct scmi_telemetry_dbg_shmti {
+	struct telemetry_shmti *shmti;
+	size_t buf_sz;
+	void *buf;
+	/* Protect this descriptor from concurrent readers using it */
+	struct mutex mtx;
+};
+
 #define SHMTI_EPLG(s)						\
 	({							\
 		struct telemetry_shmti *_s = (s);		\
@@ -590,6 +600,7 @@ struct telemetry_info {
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_shmti *shmti;
+	struct dentry *shmti_top;
 	struct telemetry_de *tdes;
 	struct xarray xa_des;
 	struct telemetry_uuid *primary_uuid;
@@ -1683,6 +1694,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
 					ti->info.intervals);
 }
 
+static int scmi_telemetry_dbg_shmti_open(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob;
+	struct telemetry_shmti *shmti;
+
+	if (!inode->i_private)
+		return -ENODEV;
+
+	shmti = inode->i_private;
+	sblob = kzalloc_obj(*sblob);
+	if (!sblob)
+		return -ENOMEM;
+
+	sblob->shmti = shmti;
+	sblob->buf = kvzalloc(shmti->info.len, GFP_KERNEL);
+	if (!sblob->buf) {
+		kfree(sblob);
+		return -ENOMEM;
+	}
+
+	mutex_init(&sblob->mtx);
+
+	filp->private_data = sblob;
+
+	return 0;
+}
+
+static ssize_t scmi_telemetry_dbg_shmti_read(struct file *filp, char __user *buf,
+					     size_t count, loff_t *ppos)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	/* Dump on first read and again after each rewind to start pos */
+	guard(mutex)(&sblob->mtx);
+	if (!sblob->buf_sz || *ppos == 0) {
+		struct inode *ino = file_inode(filp);
+
+		memcpy_fromio(sblob->buf, sblob->shmti->base,
+			      sblob->shmti->info.len);
+		sblob->buf_sz = sblob->shmti->info.len;
+		/* update inode timestamps */
+		inode_lock(ino);
+		file_update_time(filp);
+		inode_unlock(ino);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, sblob->buf, sblob->buf_sz);
+}
+
+static int scmi_telemetry_dbg_shmti_release(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	kvfree(sblob->buf);
+	kfree(sblob);
+
+	return 0;
+}
+
+static const struct file_operations scmi_telemetry_dbg_shmti_fops = {
+	.open = scmi_telemetry_dbg_shmti_open,
+	.release = scmi_telemetry_dbg_shmti_release,
+	.read = scmi_telemetry_dbg_shmti_read,
+	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
+};
+
+static void scmi_telemetry_debugfs_initialize(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct dentry *top;
+
+	top = ph->hops->debugfs_proto_dentry_get(ph);
+	ti->shmti_top = debugfs_create_dir("shmtis", top);
+
+	for (unsigned int i = 0; i < ti->num_shmti; i++) {
+		char id[16];
+
+		snprintf(id, 16, "%u", ti->shmti[i].info.sid);
+		debugfs_create_file_size(id, 0444, ti->shmti_top, &ti->shmti[i],
+					 &scmi_telemetry_dbg_shmti_fops,
+					 ti->shmti[i].info.len);
+	}
+}
+
 static int iter_shmti_update_state(struct scmi_iterator_state *st,
 				   const void *response, void *priv)
 {
@@ -4717,6 +4813,10 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	/* Ensure rinfo is no more accessible upfront */
 	smp_store_release(&ti->rinfo, NULL);
 
+	/* Safe removal of SHMTI debugfs tree before freeing underlying data */
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		debugfs_remove_recursive(ti->shmti_top);
+
 	kfree(ti->info.shmtis);
 	kfree(ti->shmti);
 
@@ -5078,6 +5178,9 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return 0;
 }
 
-- 
2.54.0


