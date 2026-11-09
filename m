Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF76606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLTcgN6d;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yy8KUHkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uD1oqeBZyv6GKQsYCnFzfqSw22a5mcNlcyGEnHcJ5IE=; b=qLTcgN6diaHvic
	s+ky1ULnxWo0eNEYlotDza20XAAtL1XJFJ/T5CZHim4pXL0bJWexNsecuwzTlnTr1QWm+bveAQjFg
	YpkGUKyirtpNIfnLtEwhwJeHVxDCjF3Ng7XoBGLExux6V3aevVwDADdTs53N8ghp2kF6V43j6xyqa
	SE3k2R1ZiZrlYavFh9H1ZJWP0uWn3YMHRBWLGm+kLEbxeOgzLq5h4RA+IeQfUNpz3FbtHNIDKT0N+
	GBdkfW9jqTfyhIGC9uxYbn3VQgPUyg7u9ugja5KXtDSQOnNXgYNI7gbhM87HvCx8M5EVcZgErwrjn
	T3L6PLyybzalR9Gm6AUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOl-00000000nho-1lbJ;
	Mon, 09 Nov 2026 13:26:59 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOi-00000000ng9-3ITS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:26:58 +0000
Received: by mail-pj2-x05.google.com with SMTP id 98e67ed59e1d1-3aec0b1d816so444465a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230816; x=1794835616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD1oqeBZyv6GKQsYCnFzfqSw22a5mcNlcyGEnHcJ5IE=;
        b=Yy8KUHkgmqXTNzHr4s7k7pGikL+4RJQ/Y7nwwP1oDVhHGtEJB7yoJKgwhJtesQuhwM
         4SGsIEc3MfKjyQzscdH+wxlEx3cBWg92ACU/t3bLf4HO8SzM8FWg+Hamds+J3YJp1G1C
         bPyjwg5j9KSK8qyZhoq9IabBQSITO/0rgWHZfAHsy55oiKsPHGXfv3RFqw9mfl0wNlV8
         naEzmoH8Q6VGjCFvooQE5EoU0w40I0+D1wKxyioZGIQ3dWqrCC4M4VajYgU52oBMl4Hr
         gjlhCuecwgV3eJEWYThFHnGa8zs3FQEqakFUZenkKb1auMS0j61CyOCPPETB6yYCvE5J
         qlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230816; x=1794835616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uD1oqeBZyv6GKQsYCnFzfqSw22a5mcNlcyGEnHcJ5IE=;
        b=rAoyDW6XtozS9DZf+y8yuL/xJmvb5rskSanu8QC0zbpoWUTtPsIJeOIxnUyPwBuOoK
         blWFlxmauZ92hpP4IM37F/8PtzmkIiZ9oSGb55tDUgBIBU3Wv+/sKv65/MSXcg+cr+Vz
         lA1aFLA1I044NdfDXnTdmmT752nlwNQXZU4wAAmw0d6uHEv3VovqCQbG9j7t8IZUMOVk
         JU3QnXUkV+eIl5ujIA6fp+8POrnJ0lwQ9/96PrXlAQ6fN7WLGoDc+DQGlS0IUjKDvoHp
         enH/+mWK5Vejpyy5OF6o3dfoniAKO525UIBA5Zcj9VhoRKFU8N9CP1A8BID1+VPsZkEk
         cWTQ==
X-Forwarded-Encrypted: i=1; AL+hErHdANz5kgBKzqEHS6dnK8kANuNJ7m+F+tEnfRJR8W+18zzTWRs5LvWBwjKqNhgn2h54RyUtW2sXM+ocJtmvRA5h@lists.infradead.org
X-Gm-Message-State: APuU4Z8/7Bi5R/6KOBl6hpjD9STtEmq3w9ve+mdebyRKkfDimsKynNi6
	k0a25JtfWno/NSU8+8z8mga2QHOFbWqrpUayxpLsuXmkCKk8MQrqrhsk
X-Gm-Gg: AYBFou3gmU7fEjtowYDX8b0wajY3Z8LA0D5WCTIrwHwXAtmLnE54uMS3BnUJE5CNScw
	Ai44UFAfWBDXS69bT/jcfFDN0UvSzypT0oQOwCk8Fd/nU1NBqsl8RAi5AMSoHW+KYf5o7mMggT0
	ppBi4IAiTm5KmfDjwn1VJcEQDmq489CZLKndr9fbD1uKOu3kolRMd+NN+yKW9wktU82bJtHdIo5
	axvgxgi/LGJOLVf6ZbszJz0Q/IRrgTeX3/fFhZONg6jKKlYYE3MvxPQ6MNZN/FHkF6ZL7vpRnUU
	ll+cpL2J5ZZ+oo2I1il4Vjd7IKGy9AA1X8qgm86QvtwhaB3HqWWacu+ZGiSpffRcdU+Mq/Iarsl
	wFMYn4v6mVd9Yrrgi9fXuWi0VgbYn5/3EBCnysAv0sQoMLFPCaR4Rm6lKvrV0m4JX0mBdMJM60B
	+RggRJP92mBF47rS9laeqbjIiGYc20sNT9iQ3g76SiCwfSCTSH0OcTOOfyAVBtllgySMrA0iQ9V
	UHpoHk4OaTLHnwIF2D/gfkddhTBKXOJfRmjBrcw6JlZ801GNk9yt3HCq6PObdEfmlDn4uXYaYfC
	+eYwyj8Hxd7TedKEu5UyxU4fslpunaCkXbhrrwrjgCp6lk2a8E1POjb192yZOdKBn2QrAvZioig
	m5Rz3bXwN
X-Received: by 2002:a17:90b:2ec7:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b12d46479fmr3367677a91.26.1794230815591;
        Mon, 09 Nov 2026 05:26:55 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:55 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 4/6] fs/resctrl: Allow mba_MBps with assignable MBM counters
Date: Mon,  9 Nov 2026 21:26:19 +0800
Message-ID: <20261109132621.3862497-5-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052656_841982_3A0DD058 
X-CRM114-Status: GOOD (  30.12  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jinjie Ruan <ruanjinjie@huawei.com>

The MBA software controller adjusts the hardware bandwidth control from
MBM counters to meet the value written to the schemata file. It needs
a counter for the event selected by mba_MBps_event in every monitoring
group, so mba_MBps is refused when the MBM counters are assignable. On
MPAM every group has its own PARTID and PMG and the bandwidth monitors
are assigned from a fixed pool, so users can only pick a percentage of
a maximum that firmware does not report.

Allow the controller when the architecture has a fixed assignment mode
and assigns counters when a group is created. Enable
mbm_assign_on_mkdir while the controller is in use, restore its
previous value when the controller is disabled, and refuse to unassign
the controller's counter meanwhile. Every group created while the
controller is enabled then has a counter in every domain where the
shared pool still has one. A group whose counter could not be assigned
contributes no bandwidth, so the controller measures less than the
groups use and can raise the control above the user's target; warn
when that happens.

Only MPAM has a fixed assignment mode; systems where the counters are
not assignable, or the mode is not fixed, keep the previous behavior.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst |  7 +++--
 fs/resctrl/monitor.c                  | 43 ++++++++++++++++++++++++---
 fs/resctrl/rdtgroup.c                 | 35 ++++++++++++++++++----
 3 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..d70aec6f7096 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -471,7 +471,8 @@ with the following files:
 	Determines if a counter will automatically be assigned to an RMID, MBM event
 	pair when its associated monitor group is created via mkdir. Enabled by default
 	on boot, also when switched from "default" mode to "mbm_event" counter assignment
-	mode. Users can disable this capability by writing to the interface.
+	mode. Users can disable this capability by writing to the interface. While the
+	MBA software controller is enabled, auto assignment cannot be disabled.
 
 	"0":
 		Auto assignment is disabled.
@@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
 	   mbm_total_bytes:0=e;1=e
 	   mbm_local_bytes:0=e;1=e
 
-	Assignments can be modified by writing to the interface.
+	Assignments can be modified by writing to the interface. While the
+	MBA software controller is enabled, the counter of the event the
+	controller uses cannot be unassigned.
 
 	Examples:
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 76990bb80ee9..72917cf4a8e7 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1197,6 +1197,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
 		goto out_unlock;
 	}
 
+	if (!value && is_mba_sc(NULL)) {
+		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	r->mon.mbm_assign_on_mkdir = value;
 
 out_unlock:
@@ -1329,18 +1335,28 @@ static int rdtgroup_assign_cntr_event(struct rdt_l3_mon_domain *d, struct rdtgro
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	int ret = 0;
 
 	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
 	    !r->mon.mbm_assign_on_mkdir)
 		return;
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		ret |= rdtgroup_assign_cntr_event(NULL, rdtgrp,
+						  &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		ret |= rdtgroup_assign_cntr_event(NULL, rdtgrp,
+						  &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+
+	/*
+	 * The software controller measures a group through these counters.
+	 * A group whose counter could not be assigned contributes no
+	 * bandwidth, and the controller can then raise the control above
+	 * the user's target.
+	 */
+	if (ret && is_mba_sc(NULL))
+		pr_warn_ratelimited("Failed to assign MBM counters to a group; its bandwidth is not measured by the MBA software controller\n");
 }
 
 /*
@@ -1763,6 +1779,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
 	return NULL;
 }
 
+/*
+ * Return the event the MBA software controller uses as its input for @rdtgrp.
+ * A monitor group has no event of its own: its bandwidth is summed into the
+ * parent control group, which is the group with the mba_MBps_event setting.
+ */
+static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
+{
+	if (rdtgrp->type == RDTMON_GROUP)
+		return rdtgrp->mon.parent->mba_mbps_event;
+
+	return rdtgrp->mba_mbps_event;
+}
+
 static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
 					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
 {
@@ -1776,6 +1805,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
 		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
 		break;
 	case '_':
+		if (is_mba_sc(NULL) &&
+		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
+			rdt_last_cmd_puts("Counter is in use by the software controller\n");
+			ret = -EBUSY;
+			break;
+		}
 		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
 		break;
 	default:
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b32831871f70..957a3df7af83 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2610,10 +2610,10 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
  * The MBA software controller is supported only if MBM is supported and MBA is
  * in linear scale, and the MBM monitor scope is the same as MBA control scope.
  *
- * The software controller cannot be supported when the MBM counters are
- * assignable.  There is no guarantee that MBM counters are assigned to the
- * event backing the software controller in all monitoring domains of all
- * monitoring groups.
+ * The controller needs a counter for its event in every monitoring group.
+ * With assignable counters that is only guaranteed when the architecture
+ * uses a fixed assignment mode and assigns counters automatically; keep
+ * that assignment enabled while the controller is in use.
  */
 static bool supports_mba_mbps(void)
 {
@@ -2623,9 +2623,16 @@ static bool supports_mba_mbps(void)
 	return (resctrl_is_mbm_enabled() &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
-		!rmbm->mon.mbm_cntr_assignable);
+		(!rmbm->mon.mbm_cntr_assignable ||
+		 rmbm->mon.mbm_cntr_assign_fixed));
 }
 
+/*
+ * The value mbm_assign_on_mkdir had before the software controller forced
+ * it on, restored when the controller is disabled.
+ */
+static bool mba_sc_saved_assign_on_mkdir;
+
 /*
  * Enable or disable the MBA software controller
  * which helps user specify bandwidth in MBps.
@@ -2633,6 +2640,7 @@ static bool supports_mba_mbps(void)
 static int set_mba_sc(bool mba_sc)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 num_closid = resctrl_arch_get_num_closid(r);
 	struct rdt_ctrl_domain *d;
 	unsigned long fflags;
@@ -2643,6 +2651,21 @@ static int set_mba_sc(bool mba_sc)
 
 	r->membw.mba_sc = mba_sc;
 
+	/*
+	 * The software controller needs a counter for its event in every
+	 * monitoring group. Keep the automatic assignment enabled while the
+	 * controller is in use and restore the previous value afterwards,
+	 * as the user can change it while the controller is not in use.
+	 */
+	if (rmbm->mon.mbm_cntr_assignable) {
+		if (mba_sc) {
+			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
+			rmbm->mon.mbm_assign_on_mkdir = true;
+		} else {
+			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
+		}
+	}
+
 	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
 
 	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
@@ -3352,7 +3375,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
+		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
 		if (!supports_mba_mbps())
 			return invalfc(fc, msg);
 		ctx->enable_mba_mbps = true;
-- 
2.43.0


