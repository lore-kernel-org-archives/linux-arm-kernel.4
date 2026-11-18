Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40DF606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NuXiWTPx;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cBUnezY3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=G17J7pDh+avlQuW0DxA3Qojcg455TcPTlRVkxP2LNDc=; b=NuXiWTPx1qXVD208Tp4Y9HhGVa
	tSQWZALrkOKUtFPhfycrsL9UZQeo8Tg2ZhSJP81beqH9G1t7ihZOHEIdFagveuKcEgLC7iLEAArCQ
	EYIP8hvyiAB/HBkWM2UnGNQ89ErajY9aJ3cjy12wRMo6u2kGxaBAoumennBkCNVUMUFtU3V4clO7W
	1VQwmSl95P2ZV1nSY4gor/W/+gsANA9CYahLjni3QgxWSN822C+BpGQpzhuIBdbNWBEzNR29fEgJy
	e5xWaB49Hm72PEBIiCmr2ZUU2ZUCpxE3vRtilBkKRKEs7EQzMF+7I8gFjaLq7L1//O6zWkZ7gRunh
	oClcvOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfBR-00000008u5M-1Yxf;
	Wed, 18 Nov 2026 12:54:41 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfBM-00000008u4R-09HU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:54:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=G17J7pDh+avlQuW0DxA3Qojcg455TcPTlRVkxP2LNDc=;
	b=cBUnezY3ndiDrLsbWzbnPsvhKqQQN7p8U+GC/aJ0ec5jMXKFHMn9laTnyl0wVSokGNp80h3Qh
	v94GbaTzuejeXQpb6zVPAsr4PV4dgkLTSCUC+VNSBgk9O+f90/sbXuRPsbeY9/8hZKQU73LkZC8
	bLOcAQgoGITXPPrSbt48tMY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jV1kl4M0XzmV6N;
	Wed, 18 Nov 2026 20:54:07 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 272C34048B;
	Wed, 18 Nov 2026 20:54:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 20:54:26 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <will@kernel.org>, <jic23@kernel.org>,
	<gshan@redhat.com>, <tan.shaopeng@jp.fujitsu.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3] arm_mpam: resctrl: Use the domain's counter ID
Date: Wed, 18 Nov 2026 20:54:17 +0800
Message-ID: <20261118125417.671859-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_045437_376380_9AA226E7 
X-CRM114-Status: GOOD (  17.84  )
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

resctrl assigns MBM counters per domain: mbm_L3_assignments takes a
domain ID, a group can have a counter in one domain and none in
another, and resctrl_arch_cntr_read() and resctrl_arch_reset_cntr()
are given the counter to use.

The driver ignores that counter and looks the monitor up in
mbwu_idx_to_mon[], indexed by CLOSID and RMID.
resctrl_arch_config_cntr() fills that array without looking at the
domain, so each group has one monitor for the whole resource.
Whichever assignment is written last selects the monitor the group
reads in every domain.

For example, with the counter ID each group uses for mbm_total_bytes
on each domain and "_" for none:

                                domain 0         domain 1
  mount, mkdir g1               default=0 g1=1   default=0 g1=1
  unassign both on domain 1     default=0 g1=1   default=_ g1=_
  assign g1 on domain 1         default=0 g1=1   default=_ g1=0

g1 is assigned the lowest free counter on domain 1, counter 0. That
assignment is the last one written for g1, so it selects the monitor
g1 reads in every domain. On domain 0, g1 uses counter 1, but reads
the monitor of counter 0:

                      counter whose monitor is read on domain 0
                      default      g1
  expected            0            1
  actual              0            0

That is the default group's monitor.

Translate the counter ID with assigned_counters[], which maps a counter
ID to a monitor of the class and is valid in every domain.

mbwu_idx_to_mon[] is left alone: resctrl_arch_config_cntr() still fills
it, but the read and reset paths no longer consult it, and a future
default mbm_assign_mode may use the array, so removing it can be
considered separately. Unassigning a counter now resets its monitor,
where before the lookup made the reset a no-op; the monitor is reset
again when the counter is next assigned.

Fixes: a5ff6ef2d73e ("arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v3:
- Keep mbwu_idx_to_mon[] and remove the cleanup. (Ben)
- Split out as a mpam seperate patch.
- Remove unnessary stable version.
- v2: https://lore.kernel.org/all/20261113083506.4129060-2-ruanjinjie@huawei.com/
---
 drivers/resctrl/mpam_resctrl.c | 50 ++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 8e9d5c68c2c1..0d290962ef62 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -463,6 +463,15 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
 }
 
+/* The monitor resctrl's counter @cntr_id uses for @cdp_type. */
+static int mon_for_cntr(struct mpam_resctrl_mon *mon, int cntr_id,
+			enum resctrl_conf_type cdp_type)
+{
+	u32 idx = resctrl_get_config_index(cntr_id, cdp_type);
+
+	return mon->assigned_counters[idx];
+}
+
 static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
 		      enum mpam_device_features mon_type,
 		      int mon_idx,
@@ -558,7 +567,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 
 /* MBWU counters when in ABMC mode */
 int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
-			   u32 closid, u32 rmid, int mon_idx,
+			   u32 closid, u32 rmid, int cntr_id,
 			   enum resctrl_event_id eventid, u64 *val)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
@@ -574,8 +583,30 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
-				 USE_PRE_ALLOCATED, closid, rmid, val);
+	/* A counter ID maps to one monitor per CDP configuration. */
+	if (cdp_enabled) {
+		u64 code_val = 0, data_val = 0;
+		int err;
+
+		err = __read_mon(mon, mon_comp, mpam_feat_msmon_mbwu,
+				 mon_for_cntr(mon, cntr_id, CDP_CODE),
+				 CDP_CODE, closid, rmid, &code_val);
+		if (err)
+			return err;
+
+		err = __read_mon(mon, mon_comp, mpam_feat_msmon_mbwu,
+				 mon_for_cntr(mon, cntr_id, CDP_DATA),
+				 CDP_DATA, closid, rmid, &data_val);
+		if (err)
+			return err;
+
+		*val = code_val + data_val;
+		return 0;
+	}
+
+	return __read_mon(mon, mon_comp, mpam_feat_msmon_mbwu,
+			  mon_for_cntr(mon, cntr_id, CDP_NONE),
+			  CDP_NONE, closid, rmid, val);
 }
 
 static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
@@ -603,13 +634,16 @@ static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon
 }
 
 static void reset_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
-			       int mon_idx, u32 closid, u32 rmid)
+			       int cntr_id, u32 closid, u32 rmid)
 {
 	if (cdp_enabled) {
-		__reset_mon(mon, mon_comp, mon_idx, CDP_CODE, closid, rmid);
-		__reset_mon(mon, mon_comp, mon_idx, CDP_DATA, closid, rmid);
+		__reset_mon(mon, mon_comp, mon_for_cntr(mon, cntr_id, CDP_CODE),
+			    CDP_CODE, closid, rmid);
+		__reset_mon(mon, mon_comp, mon_for_cntr(mon, cntr_id, CDP_DATA),
+			    CDP_DATA, closid, rmid);
 	} else {
-		__reset_mon(mon, mon_comp, mon_idx, CDP_NONE, closid, rmid);
+		__reset_mon(mon, mon_comp, mon_for_cntr(mon, cntr_id, CDP_NONE),
+			    CDP_NONE, closid, rmid);
 	}
 }
 
@@ -631,7 +665,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
+	reset_mon_cdp_safe(mon, mon_comp, cntr_id, closid, rmid);
 }
 
 /*
-- 
2.34.1


