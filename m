Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CA606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4kk/cPYV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTWtgRAO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mc6ORBvaJXkIqHPJBuJecDTVyV5lInOmdqCj61j+210=; b=4kk/cPYVuy0ywK
	si0fg0IS4wb1aNS5zdvo70WJGuwSy4FMc2Z4Mv7X8YDW6gtdvguWt93AhVtJCWqKGB0Nxi7IAa7R5
	4cOAuaY4Xu6Lbi0OHC6y9AzR5xhgcJZsQRuxECOf7ElDyhilaEpPEzLgy/BXfheBhnoxLoDI2EaFa
	QXzWHrYDN0tKU6gGBYP1RKRZ8RX8siH0uLRSucYEHiFem0WqRwPyl341YtkVvtdsodlPFLGVL9x8O
	81UvEy3x2KTAJ/BOJY/vyPsJxpOkjiFfPSYGO9lGSIQ3g2dpEE248r3RDXie/bhbFgDVMJqIs+wVl
	7uZ7MvV8Xbr3pyK9dItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOg-00000000nee-19Eb;
	Mon, 09 Nov 2026 13:26:54 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOd-00000000ncj-2WPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:26:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so445842a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230810; x=1794835610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mc6ORBvaJXkIqHPJBuJecDTVyV5lInOmdqCj61j+210=;
        b=ZTWtgRAO461VC2oREVqa1iQeehja0hgfu827lm94429V3aGFh+3AZCObtiekvzr/yy
         8Pxs5R6c2LF/SiG7PdjhJqw7Z3kf2Io+0YtFUJV7JCZfv++9Do2V4/rgDDfY2Lh5h/WN
         teLkUCaGW+tCzlFJzfo+rkze5XlAqmL3CLpFFhk+4Spg62EIIsHiIaD95yZIyw1jWYv0
         lGvow0KawiAyf4gxumixbh4jOOo+TxOzE7p7qBSpiWFlEkLMS7DuVinYCT+KdksbTPMc
         RdKzHzKChl+ur2KCDX5pP53bfSJVFxS6a28jlUAusk/EEpuJDtuesYmJWCvfE0vWsRxn
         VRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230810; x=1794835610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mc6ORBvaJXkIqHPJBuJecDTVyV5lInOmdqCj61j+210=;
        b=2svRSU56JWwmlezOsmcheurM1WCP5bvPqrTbm3KIyuWIWIC+r/R4Edcyq8vBpJU5Jk
         0vCPShto98SCRu8mWACD+JkODKDkUE+it7fq8QydlEeq/n7XokVVW2INNbFcVFcHjW5O
         v+G7/C84tUJU+waYcT8FKTjLQtyJAdv3AC+QXG4m4bjFrZ6PW8Hf7d35bD7uRP6KUqCd
         og+Lv5b45Fql3s4c/GxgbAJ3E+qlFYuwGitd83tH12tLBkLKzi2w2QPpMjpt3n7Sxjrl
         pvwu/nkgkDB3SJCIwQzmahxVCeO1fOcDJTzbjK3KxGfG4pPCbDbmNXMBs3XRMpU7e4Ek
         nmYg==
X-Forwarded-Encrypted: i=1; AL+hErGqP9RA9Uvs2NIxl/zcOdyN3+/OJSX4r1O47P4l6VF2Nh45cQwIqa44y+CkOEX9JRU31VsAIZbkrOnJ2eEtnL09@lists.infradead.org
X-Gm-Message-State: APuU4Z/0QCd7erQyGbrZC8saujPgJUUn0FYg99Y8JQm3EHtQIUfqi34Q
	W76bXKGjXSqi53z4MeVyS5c4UVqQHGsijyiKKzG6jPyc619Z01TdKog+
X-Gm-Gg: AYBFou34ryjp7A/Dss//Csxft1YA32zbBKIpFhWl2dWGc+X5HDgJOVEnvHdaral9cQE
	zhwDAM1miwAPQkeaC2uM44ubBddu1VIjgWr5HYXzPSpDqo85NPWZPxB1glro3hNhzu6KiNmA1Y3
	ENxNWbRDuYKioWdNq8jLKJOLLB+nIhKvlMNqiyYBmg2MgeNkYHbU9VltnIwZxOS5qaamNQRraVE
	sInkJ74vP9pHn6tTnzDp5MIV86t1VmAWDZey3aNWDhKyFIckndRQ2/1lI4QFFWZ3LxKOmRStFUN
	1deCEQb8cFGgq9moY+xtqHxx8ebu66SK0e8/D50aoVqFSPUS7uY785DSPIcXs+rMjxFdotjsbfu
	9sSvxSx45NDNjzwQKT1ob7hoBXTHAT0CWMM4AFdpnVwvpeFUepnqqrbwVj3ufuSIUYSGwGvpfMo
	cc/6+FF57mHj3yj33RMkj97zho4FJfk+/QBGOic7yObsiSHvipoa/S++VspG/sjpLSYvUMNX/oE
	JAHHc3KXzp6YG5ou5m/mEejUwwQk+KTXdtDKyOqvAa5jnJenQdBQbjzNEOFdrC5D4x20QRNXoQC
	fVsjBq1ie9ldgG3icM0Mc+NtQnF4ARp+1xcsqrB6yRtFOh7QVLbIV62QwSs5ce8=
X-Received: by 2002:a17:90b:586c:b0:3ac:9669:8461 with SMTP id 98e67ed59e1d1-3b1067af4b3mr4721850a91.15.1794230810060;
        Mon, 09 Nov 2026 05:26:50 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:49 -0800 (PST)
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
Subject: [RFC PATCH 3/6] fs/resctrl: Take the CPU hotplug lock for software controller updates
Date: Mon,  9 Nov 2026 21:26:18 +0800
Message-ID: <20261109132621.3862497-4-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052651_654049_9668E5C5 
X-CRM114-Status: GOOD (  22.87  )
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

update_mba_bw() runs from the MBM overflow worker and calls the
architecture to read and write the control of the domain of its CPU,
under the RCU read lock.

Writing the control can sleep: MPAM uses smp_call_on_cpu() and waits
for a CPU that reaches the MSC, so that CPU must stay online. The
hotplug lock cannot be taken after rdtgroup_mutex, because the offline
path takes the hotplug lock first, and sleeping in the RCU read-side
section is invalid.

Take the hotplug lock with cpus_read_trylock() before rdtgroup_mutex.
Skip a round when it is not available; a blocking lock would deadlock
against the offline path, which holds the write lock while it drains
this worker. With the lock held the control domain cannot be removed,
so drop the RCU read lock. Where the update does not sleep, a round is
only skipped while hotplug runs.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c  | 28 +++++++++++++++++++---------
 fs/resctrl/rdtgroup.c |  8 +++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2319e8e619bd..76990bb80ee9 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -640,19 +640,18 @@ void mon_event_count(void *info)
 /*
  * Find the software controller's ctrl domain that contains @cpu on resource @r.
  *
- * Only called from the mbm_over worker via update_mba_bw() where the returned
- * domain is kept alive by cancel_delayed_work_sync() in
- * resctrl_offline_ctrl_domain(). This drains this worker and then waits on
- * rdtgroup_mutex held here before the architecture can free the ctrl domain.
+ * Only called from the mbm_over worker via update_mba_bw(), which holds the
+ * CPU hotplug lock so the domain cannot be removed while it is being used.
  *
- * Context: Call from RCU read-side critical section.
+ * Context: Call with the CPU hotplug lock held.
  */
 static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
 							   struct rdt_resource *r)
 {
 	struct rdt_ctrl_domain *d;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
+	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list,
+				lockdep_is_cpus_held()) {
 		/* Find the domain that contains this CPU */
 		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
 			return d;
@@ -713,7 +712,8 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	if (WARN_ON_ONCE(!pmbm_data))
 		return;
 
-	guard(rcu)();
+	lockdep_assert_cpus_held();
+
 	dom_mba = get_sc_ctrl_domain_from_cpu(smp_processor_id(), r_mba);
 	if (!dom_mba) {
 		pr_warn_once("Failure to get domain for MBA update\n");
@@ -882,11 +882,19 @@ void mbm_handle_overflow(struct work_struct *work)
 	struct rdt_l3_mon_domain *d;
 	struct list_head *head;
 	struct rdt_resource *r;
+	bool cpus_read_locked = false;
 
 	/*
-	 * Safe to run without CPU hotplug lock. Work is guaranteed to be
+	 * Reading counters is safe without the CPU hotplug lock: the work is
 	 * canceled before the domain structure is removed.
+	 *
+	 * Programming the control can sleep and may need the hotplug lock,
+	 * which cannot be taken after rdtgroup_mutex. Try it first; if
+	 * hotplug is in progress skip the update and retry next round.
 	 */
+	if (is_mba_sc(NULL))
+		cpus_read_locked = cpus_read_trylock();
+
 	mutex_lock(&rdtgroup_mutex);
 
 	/*
@@ -921,7 +929,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL))
+		if (is_mba_sc(NULL) && cpus_read_locked)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -935,6 +943,8 @@ void mbm_handle_overflow(struct work_struct *work)
 
 out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
+	if (cpus_read_locked)
+		cpus_read_unlock();
 }
 
 /**
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..b32831871f70 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4519,9 +4519,11 @@ void resctrl_offline_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain
 	 * no new worker iteration can find it; drain any worker that already
 	 * holds a pointer to it before the architecture frees the domain.
 	 *
-	 * Software controller is enabled/disabled on mount/unmount with
-	 * cpus_read_lock() held. Running here with cpus_write_lock() so
-	 * there are no concurrent changes to software controller status.
+	 * The overflow worker holds the CPU hotplug read lock around its
+	 * software controller updates, and mount/unmount enable/disable the
+	 * software controller with the read lock held. Running here with
+	 * cpus_write_lock() means there are no in-flight software controller
+	 * updates and no concurrent change of the software controller status.
 	 */
 	if (r->rid == RDT_RESOURCE_MBA && is_mba_sc(r)) {
 		struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-- 
2.43.0


