Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD8606A8A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5oq53dv;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=drx2TZUT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gLB3AodSpU0dXlPx9c6iIhtx2r+VDjwaKhOy+CroF8w=; b=R5oq53dvZNrybbqCc+mR4mZnHu
	WGv1ue0O8sIerKxSoFb8E0m9/FyIK6ek4pQqc9NkVBagsuWOVGe5GXhL4/zXa0pwlhrXRaAD1HQv9
	joW7b2Yi2A8dmSXWIhG0ODkAK7cPSzkJ8/LzgW1g+RKjwipmyw/XgWifUhjV5PDCBYjNeYYBG12zl
	ajfb7xEgU6IJHtm3VePbTrvhHnOa8eVf3li7uY5JSdFNkRJhbHfJNgFf7q4G4pD1mP0aHTufC/Jev
	4iZlKR+dU2lN0uXaMi8L/vK1tsmOUinLCZ/iKJpdDdg3vsekjYhcfoUM60fBQV5RcMpKwWuLXi3RV
	gcF358wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUca-00000009yec-0YMk;
	Thu, 12 Nov 2026 13:13:44 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcL-00000009ySk-3kLE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:13:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gLB3AodSpU0dXlPx9c6iIhtx2r+VDjwaKhOy+CroF8w=;
	b=drx2TZUTgNbcBaDLGsueCnUS35TVKSSTWlGTziffZkaUXXQT8lZZWX7cztDxUuvqImxA7q/ob
	+orojus/iyK4befL40vJSnXiMDxqOlxeb9erS0VQcsWn77zFnRdCl5IZhYocgR5ZpG86zVOXgS8
	8kkQRYzKOBxZZEgTdKXdVfs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRQ6GBpz1K9BQ;
	Thu, 12 Nov 2026 21:13:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D96F64055B;
	Thu, 12 Nov 2026 21:13:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 8/9] x86,fs/resctrl: Let the architecture cap the RMIDs for the software controller
Date: Thu, 12 Nov 2026 21:12:53 +0800
Message-ID: <20261112131255.4043381-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051330_806134_59B0B27E 
X-CRM114-Status: GOOD (  23.46  )
X-Spam-Score: -2.1 (--)
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

The MBA software controller measures every monitor group. When the
architecture assigns each group a counter from a shared pool as the
group is created, the number of groups must not exceed the number of
counters while the controller is in use. resctrl has no way to learn
this from the architecture.

The rmid_idx space cannot change for this: rmid_ptrs[] is set up on
the first mount, and RMIDs in limbo outlive an unmount.

Add two hooks instead.
- resctrl_arch_set_mba_sc(). Called when the controller is enabled
  or disabled, so the architecture can update what it reports
- resctrl_arch_rmid_valid(). Skips the RMIDs that arch refuses.

The hook runs before the number of CLOSIDs is read again, so the reset
of the bandwidth targets covers the CLOSIDs the controller may use.
The reset is skipped when the controller is disabled: the targets are
not read while it is off, and a domain that came online while it was
enabled may have allocated mbps_val for the capped, smaller number of
CLOSIDs.

Both hooks are no-ops on x86 and, for now, on MPAM.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/include/asm/resctrl.h |  6 ++++++
 fs/resctrl/monitor.c           |  6 ++++--
 fs/resctrl/rdtgroup.c          | 25 ++++++++++++++++++++-----
 include/linux/arm_mpam.h       |  8 ++++++++
 4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..ac51b63f6dde 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 	return rmid;
 }
 
+static inline void resctrl_arch_set_mba_sc(bool enable) { }
+static inline bool resctrl_arch_rmid_valid(u32 closid, u32 rmid)
+{
+	return true;
+}
+
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
 static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 5a67c8089615..bcd809083f18 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -216,12 +216,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 		 * to be if it were used with this CLOSID.
 		 * If the CLOSID is irrelevant on this architecture, the two
 		 * index values are always the same on every entry and thus the
-		 * very first entry will be returned.
+		 * very first entry will be returned. Skip the RMIDs the
+		 * architecture does not allow.
 		 */
 		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
 		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
 
-		if (itr_idx == cmp_idx)
+		if (itr_idx == cmp_idx &&
+		    resctrl_arch_rmid_valid(closid, itr->rmid))
 			return itr;
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9f10b6ceff8a..e186ae322f08 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2640,16 +2640,20 @@ static int set_mba_sc(bool mba_sc)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	u32 num_closid = resctrl_arch_get_num_closid(r);
 	struct rdt_ctrl_domain *d;
 	unsigned long fflags;
-	int i;
 
 	if (!supports_mba_mbps() || mba_sc == is_mba_sc(r))
 		return -EINVAL;
 
 	r->membw.mba_sc = mba_sc;
 
+	/*
+	 * The architecture may cap the groups to what the controller can
+	 * measure. Do it before the number of CLOSIDs is used below.
+	 */
+	resctrl_arch_set_mba_sc(mba_sc);
+
 	/*
 	 * The controller needs its event counted in every monitoring group:
 	 * force automatic assignment on, and restore the user's setting when
@@ -2666,9 +2670,20 @@ static int set_mba_sc(bool mba_sc)
 
 	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
-		for (i = 0; i < num_closid; i++)
-			d->mbps_val[i] = MBA_MAX_MBPS;
+	/*
+	 * Reset the targets of the CLOSIDs the controller uses. Skip this
+	 * when disabling: nothing reads the targets while the controller is
+	 * off, and a domain that came online while it was enabled may have
+	 * allocated mbps_val for the capped, smaller number of CLOSIDs.
+	 */
+	if (mba_sc) {
+		u32 num_closid = resctrl_arch_get_num_closid(r);
+		int i;
+
+		list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
+			for (i = 0; i < num_closid; i++)
+				d->mbps_val[i] = MBA_MAX_MBPS;
+		}
 	}
 
 	fflags = mba_sc ? RFTYPE_CTRL_BASE | RFTYPE_MON_BASE : 0;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 002f56e15362..73a6277f688c 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -63,6 +63,14 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
 
+/* MPAM does not limit the RMIDs for the MBA software controller yet. */
+static inline void resctrl_arch_set_mba_sc(bool enable) { }
+
+static inline bool resctrl_arch_rmid_valid(u32 closid, u32 rmid)
+{
+	return true;
+}
+
 struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
 void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
-- 
2.34.1


