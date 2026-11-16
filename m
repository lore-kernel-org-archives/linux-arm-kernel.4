Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76981606A880
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWqQL4wq;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jmTNWMA6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tnZvtSry92l+gCCWV6NrcP40QNk9UTJpmxZ19FLvf1I=; b=yWqQL4wqugi7afIPW+GzZ6OCB5
	TtSXckvtwr5k5S64VrZJMmfvZgQr3D5BF+dTWP7B1WcgvXzamcDUOFCpj2e/M5bMtPXHTpv0YySdq
	vlqZe8QruCQuea5W+lnRAW6kkrOHnxAB06UVspFgZuNeSXguqMOO5sXDf4Wh1aLbtl9nJiVPtMgSn
	1hLbPSeOmk1sONLV7c3f21U1mt3SI7uqOVAh52bvWNV9c6NeCGGPB3nFSOQLqNJheBhHVc73ozy60
	4f2Z8jHFhMpN+gFsCGT9osMVvnc3AUeWb50rFVg7GUBb/hSmTmprOD0X4bfjEtoZ2h4skGkFOLt2v
	Z7KeGpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJJ-00000002VTq-27nN;
	Mon, 16 Nov 2026 12:59:49 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJB-00000002VGA-0bMA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tnZvtSry92l+gCCWV6NrcP40QNk9UTJpmxZ19FLvf1I=;
	b=jmTNWMA6yowFulsIKd7yjQErdnvGcmHqQzKzL6Mnx3YZJQ36joCo5IIIL/aEFN5pgjl4CorOe
	ckekcfJ3LmTNmKni2qJWIfrhxWUa7FOb4rqjs4kfK0AHo5traq3qhKDfAhzogL1VPwj0+bNfJFT
	BPet9Oq0+J+M/ebWpC4yGAQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jSnyB4lZGz12LKS;
	Mon, 16 Nov 2026 20:59:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C345440679;
	Mon, 16 Nov 2026 20:59:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:38 +0800
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
Subject: [RFC PATCH v3 12/19] fs/resctrl: Check RMID limbo on every resource with occupancy
Date: Mon, 16 Nov 2026 20:59:07 +0800
Message-ID: <20261116125914.498841-13-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261116_045941_883834_8F7CE8CB 
X-CRM114-Status: GOOD (  15.46  )
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

An RMID is only reused once the L3 occupancy counter shows the cache has
gone cold. When occupancy is monitored on more than one resource, the
RMID has to wait for all of them.

Mark the RMID busy in the domains of every resource that has the
occupancy event, and have the limbo worker read the occupancy of the
resource its domain belongs to, against that resource's reallocation
threshold.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 4132258760fa..b7a21cbafa42 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -115,13 +115,13 @@ static void limbo_release_entry(struct rmid_entry *entry)
 
 /*
  * Check the RMIDs that are marked as busy for this domain. If the
- * reported LLC occupancy is below the threshold clear the busy bit and
+ * reported occupancy is below the threshold clear the busy bit and
  * decrement the count. If the busy count gets to zero on an RMID, we
  * free the RMID
  */
 void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r = resctrl_arch_get_resource(d->hdr.rid);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct rmid_entry *entry;
 	bool rmid_dirty = true;
@@ -286,8 +286,8 @@ int alloc_rmid(u32 closid)
 
 static void add_rmid_to_limbo(struct rmid_entry *entry)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
 	u32 idx;
 
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -298,16 +298,23 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
 	idx = resctrl_arch_rmid_idx_encode(entry->closid, entry->rmid);
 
 	entry->busy = 0;
-	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
-		/*
-		 * For the first limbo RMID in the domain,
-		 * setup up the limbo worker.
-		 */
-		if (!has_busy_rmid(d))
-			cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,
-						RESCTRL_PICK_ANY_CPU);
-		set_bit(idx, d->rmid_busy_llc);
-		entry->busy++;
+	for_each_mon_capable_rdt_resource(r) {
+		/* Only resources with the occupancy event have a busy bitmap */
+		if (!resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
+			continue;
+
+		list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+					lockdep_is_cpus_held()) {
+			/*
+			 * For the first limbo RMID in the domain,
+			 * setup up the limbo worker.
+			 */
+			if (!has_busy_rmid(d))
+				cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,
+							RESCTRL_PICK_ANY_CPU);
+			set_bit(idx, d->rmid_busy_llc);
+			entry->busy++;
+		}
 	}
 
 	rmid_limbo_count++;
-- 
2.34.1


