Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA560A2629
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLUKBu/8;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UHwM2HOC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9UdVGg/h64QrJFmMdvc8IRX8SR/hJQXPD1E3diwN+do=; b=FLUKBu/8wzywXA
	K9OT/crxP9UIF2G0yJaqCPbsxRtZsh+coDcBJpxTvDD7lq8hPJNtvuzkV1fnBJSay4o8HMobwCXUl
	ji0uzEg0XGFcwi5221ZdLkqZqMTp8D8ZMBkW3aSz3Q+BMCc0QtpVQSAYtUJVYeMIe29MV8/6yfkYj
	ohsah7xVlExtoV5kVbxTHg8oXYfgi33Yo7jyVyJDbjOCAeBWEm90gA1qiaqTTHRqjd74ILwS1m02E
	UNx8czQLS9XmhHKXwD/wiqo3Rchx5Jm7Sr1SdVPk/hN4clg64SVu5cxwPKgfJBMefbDYG85vgEIRi
	VYk2464FddCZxWaeMKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKJ-00000002MXq-3Gis;
	Tue, 10 Nov 2026 04:19:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKH-00000002MWC-0VhD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284357; x=1825820357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8dfFjAyH1NZ5O/UsFja1Hvgmiui6X/KQMbG0P2/bo+I=;
  b=UHwM2HOC+yLRqiR8CAwYH6Z2rPhj2mqot5CLenYnrl4pWSI2PcicbGgG
   6myWZIld5KoAZv3bhqz9Sa2HgoxYmMTmqAFuneCzerMt46oJnoiiQ6o1R
   vQqhAGbZwV4Nha7XQkXtK9IuR3NoNirr1Ros+eGsnZl2sQak+yjPRZE+3
   wtPFVc2R5mAVZcy+WZCiGkL4EgUWOr3kEFGENUci2CyJ3Nq6Zrw7ypJmV
   mIn5A7O1XxTq5q5i+WYVsYWNU9VG0DyN43b+1rmgdmOv1WjgPMgpay2sa
   OV9N3VCk2sArkzrd7s12b6vGE6RpVJZ5m2gICe5Ds8pzoBl2p5JRIHcaM
   w==;
X-CSE-ConnectionGUID: ZdnMe8wnSPW9FRRV4YeLfg==
X-CSE-MsgGUID: usx+O590QFy6PRGNaNflyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901295"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:14 -0800
X-CSE-ConnectionGUID: V2ig3Z3cTsuv9u0S8wjhJw==
X-CSE-MsgGUID: skpaQYrwT4aODqJeOZQhDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856908"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	ruanjinjie@huawei.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	tan.shaopeng@fujitsu.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH v3 1/8] arm_mpam: resctrl: Add a helper to find the component counting an event
Date: Mon,  9 Nov 2026 20:19:01 -0800
Message-ID: <8635f50f938afbe3f58dcd69966c2dd45e2394cd.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201917_204035_E578DA02 
X-CRM114-Status: GOOD (  16.22  )
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

resctrl_arch_cntr_read() and resctrl_arch_reset_cntr() both drive the
monitors MPAM pre-allocated for bandwidth counting. Each starts with the
same sequence: check that MPAM is enabled, reject cache occupancy and
events without a class, then take the component counting the event from
the monitoring domain.

The duplicated sequence has to be kept in sync by hand. Only the failure
handling differs: one reports the failure to its caller while the other
has no way to do so.

Add find_mbwu_mon_comp() to locate the component, returning an error
pointer on the failures both callers test for. Ignore that error in
resctrl_arch_reset_cntr(), which cannot report it.

No functional change intended.

Suggested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since RFC v2:
- New patch.
---
 drivers/resctrl/mpam_resctrl.c | 62 ++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..1b1e724ae040 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -7,6 +7,7 @@
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <linux/list.h>
@@ -541,26 +542,51 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 				 closid, rmid, val);
 }
 
-/* MBWU counters when in ABMC mode */
-int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
-			   u32 closid, u32 rmid, int mon_idx,
-			   enum resctrl_event_id eventid, u64 *val)
+/*
+ * find_mbwu_mon_comp() - Find the component counting @eventid in a domain
+ * @d:		The monitoring domain to search.
+ * @eventid:	The event to find the counting component for.
+ *
+ * The counters reached through this component are the monitors MPAM
+ * pre-allocated for bandwidth counting. Cache occupancy is not counted by
+ * those monitors, it is read on demand via resctrl_arch_rmid_read().
+ *
+ * Return: the component counting @eventid in @d, or an error pointer when
+ * MPAM is disabled, when @eventid is cache occupancy, or when no class was
+ * picked to count @eventid.
+ */
+static struct mpam_component *find_mbwu_mon_comp(struct rdt_l3_mon_domain *d,
+						 enum resctrl_event_id eventid)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
 	struct mpam_resctrl_dom *l3_dom;
-	struct mpam_component *mon_comp;
+	struct mpam_resctrl_mon *mon;
 
 	if (!mpam_is_enabled())
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
+	mon = &mpam_resctrl_counters[eventid];
 	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
-	mon_comp = l3_dom->mon_comp[eventid];
 
-	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
-				 USE_PRE_ALLOCATED, closid, rmid, val);
+	return l3_dom->mon_comp[eventid];
+}
+
+/* MBWU counters when in ABMC mode */
+int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			   u32 closid, u32 rmid, int mon_idx,
+			   enum resctrl_event_id eventid, u64 *val)
+{
+	struct mpam_component *mon_comp;
+
+	mon_comp = find_mbwu_mon_comp(d, eventid);
+	if (IS_ERR(mon_comp))
+		return PTR_ERR(mon_comp);
+
+	return read_mon_cdp_safe(&mpam_resctrl_counters[eventid], mon_comp,
+				 mpam_feat_msmon_mbwu, USE_PRE_ALLOCATED,
+				 closid, rmid, val);
 }
 
 static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
@@ -603,20 +629,14 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 			     u32 closid, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
-	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
-	if (!mpam_is_enabled())
+	mon_comp = find_mbwu_mon_comp(d, eventid);
+	if (IS_ERR(mon_comp))
 		return;
 
-	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
-		return;
-
-	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
-	mon_comp = l3_dom->mon_comp[eventid];
-
-	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
+	reset_mon_cdp_safe(&mpam_resctrl_counters[eventid], mon_comp,
+			   USE_PRE_ALLOCATED, closid, rmid);
 }
 
 /*
-- 
2.56.0


