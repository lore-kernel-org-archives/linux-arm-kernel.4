Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956D606A8A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eLed+/yD;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Gj0ZlUgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WPDdE9THXSdVSoGn5keGs8HQvXxyFIZ7Ih0+gOhqCJM=; b=eLed+/yDoLBDt9nvNJrAozSZhp
	GiSEHap1+a0XPG5uTTSjcR2sMeDiV4MC8QU4bJcduDFuJBw1kVLsobneCTzpkgoaGSlYbeWwh4/5q
	N2xG2kfznQLeKiv3GlkwmKIRk9BedUtVuzyrPgoFqEoSKk5C0ddk0t9W/h5V5opM8yyWgkh7kkb+P
	8/KQ2LftRhUiklJfYQ83DoJVSKu01oDYdEvW3AP00QxHMMRA5SVx/0leK8NSYzM4eAJaq7rQrFZdn
	vxy+HKFZqZSE2fb64IJgn+5m7BMPxmnNgnn6+90UVzbi7nIw8Q9ggCQKZ9prD4k1I+WUtTpT4pj08
	d7ZzNEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJI-00000002VQd-2VUx;
	Mon, 16 Nov 2026 12:59:48 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJ9-00000002VEx-0vSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WPDdE9THXSdVSoGn5keGs8HQvXxyFIZ7Ih0+gOhqCJM=;
	b=Gj0ZlUgowM/Et22B+0WTSvDB07x3gyMDF+izJnvRpN0d0oFlEkDUyPqoYbhXfsx/drIDowHHJ
	iu6wS4S9ACnoZhbxAMSfo9vDaeyBpYkJckJa8IROzIjBW5giGGX4CuiSITpPxT9Vtx4gtHz/PHC
	ULt00qS4f2MflrMe6bbsLdU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxl0ByPz1K96X;
	Mon, 16 Nov 2026 20:59:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 808AF4048B;
	Mon, 16 Nov 2026 20:59:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 06/19] x86,fs/resctrl: Record the resource that enables a monitor event
Date: Mon, 16 Nov 2026 20:59:01 +0800
Message-ID: <20261116125914.498841-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_045939_568575_AD2E0780 
X-CRM114-Status: GOOD (  15.86  )
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

mon_evt::rid is initialised from a static table that guesses which
resource each event belongs to. The architecture enabling the event
knows the answer, so pass the resource to resctrl_enable_mon_event()
and record it in mon_evt::rid.

Every architecture records the value the table guessed, so this does
not change which events are shown where.

No functional change intended.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/core.c      |  6 +--
 arch/x86/kernel/cpu/resctrl/intel_aet.c |  2 +-
 drivers/resctrl/mpam_resctrl.c          |  2 +-
 fs/resctrl/internal.h                   |  3 +-
 fs/resctrl/monitor.c                    | 54 ++++++++++++++-----------
 include/linux/resctrl.h                 |  3 +-
 6 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index fab126ae2eba..707fa4e7ed24 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -968,15 +968,15 @@ static __init bool get_rdt_mon_resources(void)
 	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
-		resctrl_enable_mon_event(QOS_OCCUP_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(r, QOS_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
-		resctrl_enable_mon_event(QOS_MBM_TOTAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(r, QOS_MBM_TOTAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
-		resctrl_enable_mon_event(QOS_MBM_LOCAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(r, QOS_MBM_LOCAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_ABMC))
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 66cd8c2c7a51..a5978019a48c 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -290,7 +290,7 @@ static bool enable_events(struct event_group *e, struct pmt_feature_group *p)
 	}
 
 	for (int j = 0; j < e->num_events; j++) {
-		if (!resctrl_enable_mon_event(e->evts[j].id, true,
+		if (!resctrl_enable_mon_event(r, e->evts[j].id, true,
 					      e->evts[j].bin_bits, &e->evts[j]))
 			skipped_events++;
 	}
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 385c54604872..961210af3159 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1377,7 +1377,7 @@ static int mpam_resctrl_monitor_init(struct rdt_resource *r,
 		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
-	if (!resctrl_enable_mon_event(type, false, 0, NULL))
+	if (!resctrl_enable_mon_event(r, type, false, 0, NULL))
 		return -EINVAL;
 
 	r->mon_capable = true;
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..f7815e4fb53e 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -54,7 +54,8 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
 /**
  * struct mon_evt - Properties of a monitor event
  * @evtid:		event id
- * @rid:		resource id for this event
+ * @rid:		resource that implements this event, recorded by the
+ *			architecture when it enables the event
  * @name:		name of the event
  * @evt_cfg:		Event configuration value that represents the
  *			memory transactions (e.g., READS_TO_LOCAL_MEM,
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 1b0fb3c2aaee..23c1838a7661 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1015,11 +1015,10 @@ void free_rmid_lru_list(void)
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-#define MON_EVENT(_eventid, _name, _res, _fp)	\
+#define MON_EVENT(_eventid, _name, _fp)		\
 	[_eventid] = {				\
 	.name			= _name,	\
 	.evtid			= _eventid,	\
-	.rid			= _res,		\
 	.is_floating_point	= _fp,		\
 }
 
@@ -1029,41 +1028,48 @@ void free_rmid_lru_list(void)
  * to set .enabled.
  */
 struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
-	MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
-	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
-	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_C1_RES,			"c1_res",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_UNHALTED_CORE_CYCLES,	"unhalted_core_cycles",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_STALLS_LLC_MISS,		"stalls_llc_miss",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			RDT_RESOURCE_PERF_PKG,	false),
+	MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	false),
+	MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	false),
+	MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	false),
+	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		true),
+	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		true),
+	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	false),
+	MON_EVENT(PMT_EVENT_C1_RES,			"c1_res",		false),
+	MON_EVENT(PMT_EVENT_UNHALTED_CORE_CYCLES,	"unhalted_core_cycles",	false),
+	MON_EVENT(PMT_EVENT_STALLS_LLC_MISS,		"stalls_llc_miss",	false),
+	MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		false),
+	MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	false),
+	MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		false),
+	MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		false),
+	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			false),
 };
 
-bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
+bool resctrl_enable_mon_event(struct rdt_resource *r,
+			      enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv)
 {
+	struct mon_evt *mevt;
+
 	if (WARN_ON_ONCE(eventid < QOS_FIRST_EVENT || eventid >= QOS_NUM_EVENTS ||
 			 binary_bits > MAX_BINARY_BITS))
 		return false;
-	if (mon_event_all[eventid].enabled) {
-		pr_warn("Duplicate enable for event %d\n", eventid);
+
+	mevt = &mon_event_all[eventid];
+	if (mevt->enabled) {
+		pr_warn("Duplicate enable for event %d on resource %d\n",
+			eventid, r->rid);
 		return false;
 	}
-	if (binary_bits && !mon_event_all[eventid].is_floating_point) {
+	if (binary_bits && !mevt->is_floating_point) {
 		pr_warn("Event %d may not be floating point\n", eventid);
 		return false;
 	}
 
-	mon_event_all[eventid].any_cpu = any_cpu;
-	mon_event_all[eventid].binary_bits = binary_bits;
-	mon_event_all[eventid].arch_priv = arch_priv;
-	mon_event_all[eventid].enabled = true;
+	mevt->rid = r->rid;
+	mevt->any_cpu = any_cpu;
+	mevt->binary_bits = binary_bits;
+	mevt->arch_priv = arch_priv;
+	mevt->enabled = true;
 
 	return true;
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index c844f99fb824..f09169c964e6 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -419,7 +419,8 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
-bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
+bool resctrl_enable_mon_event(struct rdt_resource *r,
+			      enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv);
 
 bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid);
-- 
2.34.1


