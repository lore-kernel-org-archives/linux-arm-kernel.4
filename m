Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivWRp+gk;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4oYOhIR5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F5/09tsAiLJiH3yE/JR0I601g/y4qQXPTHzsm0/14NA=; b=ivWRp+gkGPjrqYx4PacM4HiRQI
	D7PS8Y+SbJvauhQm+7uRuLexQwa4ew9sxQUtNKK7tBqrhXGNlb8xz8QVpRqZLoXsKTv7YnWCxqhiV
	yCL6A0TePXY/J2+yg439KAa34TqiQgiAEBouxSBFdyM3Z+H6yY0ydn2xrZGgAE+NVbyx0dv5DSNru
	qdAMqrUVqG0EXb49PqaKYy3s02M0S8UrOBK8cFHGH0qmZnXD1SrBwmXQQTd3Ngfc5hQfeuPHXqNdc
	8NORYoJzM6l22HEmMZ8+tUpJA/QbnRhZX0fPLAtWCCFZ5DGjVWJgpjsoJgObSqAAtRVXetW+KveHu
	WaABpioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJJ-00000002VU3-2s08;
	Mon, 16 Nov 2026 12:59:49 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJB-00000002VEz-14yv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F5/09tsAiLJiH3yE/JR0I601g/y4qQXPTHzsm0/14NA=;
	b=4oYOhIR58XT0S8w/lRb1j1PxYmyMrJDo7rECYdhHu9aCBDHuIzwqFKSqa/zmTmEaT6OllAOLz
	KVAQ4xqgB/kVPA7yX6PUq/PSHjlr913TQXkwmv7hUUHMqDijkCoBHf/RIW42CkYmU85madgu1dt
	8rrtbQ2g5/mnaBXNiZo2k7Q=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxl741NzKm5R;
	Mon, 16 Nov 2026 20:59:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3161840563;
	Mon, 16 Nov 2026 20:59:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:36 +0800
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
Subject: [RFC PATCH v3 09/19] fs/resctrl: Add the L2 monitor events
Date: Mon, 16 Nov 2026 20:59:04 +0800
Message-ID: <20261116125914.498841-10-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261116_045942_204748_4A34A1A9 
X-CRM114-Status: GOOD (  15.85  )
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

MPAM monitors belong to a cache, and firmware says which level that
cache is. Add the L2 entries to the event table: l2c_occupancy for
occupancy and mbm_core_bytes for bandwidth. They have their own names
because an L2 counts the traffic the cache sees, not memory bandwidth.

Read the L2 events through the same per-domain path as the L3. The L2
has no domains to sum, so a read without a domain fails. The events only
show up once an architecture enables them; x86 never does.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c    | 12 +++++++++++-
 include/linux/resctrl.h |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 7c392bd57eff..d72d53ba25c7 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -537,12 +537,18 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
 static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
+	case RDT_RESOURCE_L2:
 	case RDT_RESOURCE_L3:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __mon_event_count_one_domain(rdtgrp, rr);
-		else
+
+		/* Only the L3 has SNC domains to sum. */
+		if (rr->r->rid == RDT_RESOURCE_L3)
 			return __l3_mon_event_count_sum(rdtgrp, rr);
+
+		rr->err = -EINVAL;
+		return -EINVAL;
 	case RDT_RESOURCE_PERF_PKG: {
 		u64 tval = 0;
 
@@ -1030,6 +1036,10 @@ void free_rmid_lru_list(void)
  * when the entry has a name.
  */
 struct mon_evt mon_event_all[RESCTRL_MON_SCOPE_NUM][QOS_NUM_EVENTS] = {
+	[RESCTRL_MON_SCOPE_L2] = {
+		MON_EVENT(QOS_OCCUP_EVENT_ID,			"l2c_occupancy",	false),
+		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_core_bytes",	false),
+	},
 	[RESCTRL_MON_SCOPE_L3] = {
 		MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	false),
 		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	false),
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 0a60372299c5..95ffff4c7925 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -180,7 +180,7 @@ struct mbm_cntr_cfg {
 };
 
 /**
- * struct rdt_l3_mon_domain - group of CPUs sharing RDT_RESOURCE_L3 monitoring
+ * struct rdt_l3_mon_domain - group of CPUs sharing L2 or L3 cache monitoring
  * @hdr:		common header for different domain types
  * @ci_id:		cache info id for this domain
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
-- 
2.34.1


