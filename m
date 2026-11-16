Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61554606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O3n5RVZc;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2vyi8LYX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8kUCmMf9xR3z7OpNfAwmY9oHzUwpJMn8UndR+N9kxmE=; b=O3n5RVZcYMJbZjrNutSu+apjjW
	TeOLWHUQ/zKLWpn5Z0D8yCyr9p+NZOsDftajnuScgHpDvI0B8H3kisTB9/XiwCdEC8CEb+0HElc+b
	PUteX2EWI8JVxTz80Lt5NMu/abllUY+EqEWYgtUkhHKIY5L8d0Dd+tIvPDpE7bUECyIspRlNcEvqT
	yTXjHLwzVk6k2wT3sShepslfjUpNMz/RF4LgNnaoYjm5q8uZZk8yn1+/a9rRg8ddGnpwcveiZ8AMu
	vhs0wb1vtiQ0jqN5VEd5zjmWSBvGoDZl7cImCm7dHLtL+2zhHWDAdpl4XHa7wa5eCS47Y4XQMOSBp
	SCJuw/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJK-00000002VWn-30rG;
	Mon, 16 Nov 2026 12:59:50 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJC-00000002VI3-3XC2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8kUCmMf9xR3z7OpNfAwmY9oHzUwpJMn8UndR+N9kxmE=;
	b=2vyi8LYXAsbmTDjLqxg0yrXMfpOuqhIfeDtRDBUN+P6bAaYIVk1Y8umHitRbJI4pKGI9t/IAY
	DjT2Zs7khX9mPEpfzvtS/9BRHBYu9HCJ9eRbbMkTRbiW5ZuUvaWLXgu3+c8zFergOTLbaQOvMR2
	d8RdeIhRBVbTdJ3F2knI6po=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxq72LYz1K96X;
	Mon, 16 Nov 2026 20:59:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 74FDC40561;
	Mon, 16 Nov 2026 20:59:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:39 +0800
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
Subject: [RFC PATCH v3 15/19] arm_mpam: resctrl: Look up the monitor domain id from the components
Date: Mon, 16 Nov 2026 20:59:10 +0800
Message-ID: <20261116125914.498841-16-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261116_045943_297393_4F6F6483 
X-CRM114-Status: GOOD (  17.19  )
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

The monitor domain id comes from whichever monitoring component the loop
happened to find last, and the monitor domain lookup uses the L3
cache-id. Neither works if the monitors of a resource are in a different
component from its controls, or if there are no controls at all, which
is the case on monitor only platforms.

Add mpam_resctrl_domain_id() to find the component that covers a CPU for
each of the resource's events. It returns the id of the first component
found and warns if another component reports a different id. Also pass
the id, not the component, to mpam_resctrl_domain_hdr_init().

No functional change: every resource has a single component covering a
CPU today, so the same id is returned.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 66 +++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index df2f0674535e..8a68b51d5811 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1568,14 +1568,14 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 	mpam_reset_class_locked(res->class);
 }
 
-static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
+static void mpam_resctrl_domain_hdr_init(int cpu, int id,
 					 enum resctrl_res_level rid,
 					 struct rdt_domain_hdr *hdr)
 {
 	lockdep_assert_cpus_held();
 
 	INIT_LIST_HEAD(&hdr->list);
-	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
+	hdr->id = id;
 	hdr->rid = rid;
 	cpumask_set_cpu(cpu, &hdr->cpu_mask);
 }
@@ -1642,6 +1642,43 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 	return NULL;
 }
 
+/*
+ * Find the domain ID for @cpu from the monitoring components of @r. Also
+ * fill @mon_comp, if not NULL, with the component that covers @cpu for each
+ * event. A negative ID means no component covers this CPU.
+ */
+static int mpam_resctrl_domain_id(int cpu, struct rdt_resource *r,
+				  struct mpam_component **mon_comp)
+{
+	struct mpam_resctrl_mon *mon;
+	enum resctrl_event_id eventid;
+	int id = -1;
+
+	lockdep_assert_cpus_held();
+
+	for_each_mpam_resctrl_mon(mon, r, eventid) {
+		struct mpam_component *comp;
+		int comp_id;
+
+		if (!mon->class)
+			continue;	// dummy resource
+
+		comp = find_component(mon->class, cpu);
+		if (mon_comp)
+			mon_comp[eventid] = comp;
+		if (!comp)
+			continue;
+
+		comp_id = mpam_resctrl_pick_domain_id(cpu, comp);
+		if (id < 0)
+			id = comp_id;
+		else
+			WARN_ON_ONCE(id != comp_id);
+	}
+
+	return id;
+}
+
 static struct mpam_resctrl_dom *
 mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 {
@@ -1677,7 +1714,8 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		dom->ctrl_comp = ctrl_comp;
 
 		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, mpam_resctrl_pick_domain_id(cpu, ctrl_comp),
+					     r->rid, &ctrl_d->hdr);
 		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 		err = resctrl_online_ctrl_domain(r, ctrl_d);
 		if (err)
@@ -1689,9 +1727,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp = NULL;
-		struct mpam_resctrl_mon *mon;
-		enum resctrl_event_id eventid;
+		int id;
 
 		/*
 		 * Even if the monitor domain is backed by a different
@@ -1700,26 +1736,14 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		 * Search each event's class list for a component with
 		 * overlapping CPUs and set up the dom->mon_comp array.
 		 */
-
-		for_each_mpam_resctrl_mon(mon, r, eventid) {
-			struct mpam_component *mon_comp;
-
-			if (!mon->class)
-				continue;       // dummy resource
-
-			mon_comp = find_component(mon->class, cpu);
-			dom->mon_comp[eventid] = mon_comp;
-			if (mon_comp)
-				any_mon_comp = mon_comp;
-		}
-		if (!any_mon_comp) {
-			WARN_ON_ONCE(0);
+		id = mpam_resctrl_domain_id(cpu, r, dom->mon_comp);
+		if (WARN_ON_ONCE(id < 0)) {
 			err = -EFAULT;
 			goto offline_ctrl_domain;
 		}
 
 		mon_d = &dom->resctrl_mon_dom;
-		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, id, r->rid, &mon_d->hdr);
 		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
 		err = resctrl_online_mon_domain(r, &mon_d->hdr);
 		if (err)
-- 
2.34.1


