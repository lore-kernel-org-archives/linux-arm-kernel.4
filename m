Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6760606A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JjKOFPFA;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=wfI1WHhv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZN6HaK+VUD2mMiXclgq103a0RWO3KL8Kpf2tLnyheMw=; b=JjKOFPFAHuS7B2IPAHh7xdkrvb
	UzN3f8mNxg8lV/hpAspxdqF26R42nY2rX5PN+e6iH5/SpV3OOWmqy+Nh3O+YA/QTCxUU+FpiVkbi4
	aUVdhCd2T255eDfZgn7H4zqCQ0M51lAMYWHhKtWC2TW+KtmVLPdjVibnCe5ZuLOlovyK/uBz1ajqU
	Yks3BMKEKjyKqoYORoYVzwYbhk1ujaV+SCNFv3WDFMIE+3upVu6GzOOv6QR2vtAnqlQsuOal/LAEc
	M9gEPNo2tqEdsCM9j/7a9HYPRnlyvNJXi6kmNKiug38d3tXvhC3GyEE2giXlBxYDvEyvunWgdWrVw
	huNENcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcX-00000009yao-41Dv;
	Thu, 12 Nov 2026 13:13:41 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcD-00000009ySc-2Nvk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:13:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZN6HaK+VUD2mMiXclgq103a0RWO3KL8Kpf2tLnyheMw=;
	b=wfI1WHhvEIcrO/2y1iP2oNjXfgl/VIsLtYUwQo6x3V81Nz4dXrnrXN7IKpyZVxBQlwjPaX/FE
	xYEVqY3SCszrFY9nZDdBsTDLg+rF+cvbbNrrioLuxsxVsya1CcfRaakj5ARmaevlXNJTcphKnZ5
	W4Lvwlk2Glcz8oZMYpeyqyk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRG3h2gzmVX9;
	Thu, 12 Nov 2026 21:12:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 51BB64057C;
	Thu, 12 Nov 2026 21:13:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:13 +0800
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
Subject: [RFC PATCH v2 4/9] fs/resctrl: Take the CPU hotplug lock for software controller updates
Date: Thu, 12 Nov 2026 21:12:49 +0800
Message-ID: <20261112131255.4043381-5-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261112_051322_045136_31566CC4 
X-CRM114-Status: GOOD (  20.82  )
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

update_mba_bw() runs from the MBM overflow worker and calls the
architecture to read and write the control of its CPU's domain, under
the RCU read lock.

Writing the control can sleep: MPAM uses smp_call_on_cpu() and waits
for a CPU that can reach the MSC, so that CPU must stay online. The
hotplug lock cannot be taken after rdtgroup_mutex, because the offline
path takes the hotplug lock first, and sleeping in an RCU read-side
section is invalid.

Take the hotplug lock with cpus_read_trylock() before rdtgroup_mutex.
Skip a round when it is unavailable; a blocking lock would deadlock
against the offline path, which holds the write lock while it drains
this worker. The lock keeps the control domain in place, so drop the
RCU read lock.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c  | 28 +++++++++++++++++++---------
 fs/resctrl/rdtgroup.c |  8 +++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 49a4b4ce95d4..8f3b8c3e3010 100644
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
@@ -748,7 +747,8 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	if (WARN_ON_ONCE(!pmbm_data))
 		return;
 
-	guard(rcu)();
+	lockdep_assert_cpus_held();
+
 	dom_mba = get_sc_ctrl_domain_from_cpu(smp_processor_id(), r_mba);
 	if (!dom_mba) {
 		pr_warn_once("Failure to get domain for MBA update\n");
@@ -895,11 +895,19 @@ void mbm_handle_overflow(struct work_struct *work)
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
@@ -934,7 +942,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL))
+		if (is_mba_sc(NULL) && cpus_read_locked)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -948,6 +956,8 @@ void mbm_handle_overflow(struct work_struct *work)
 
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
2.34.1


