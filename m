Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8D860A6F7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ly22h6tZ;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QZD/DmZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dV7nfFgA9q61rNs9FjEhDdwleHEpdNZXflZd5bDTkeE=; b=Ly22h6tZ/EEZnY
	hfJmeBHmnWlAHAIATlU6wibGhQ+SFUc9QmZHuVFCz5OCF34YpVuIUR7IvEqDT3U4lWGjMQkFuj8wm
	iejosaOd92UBnyDPCWSCVr/AqTXB++gFHIYWxRoA+OWQlQxsKWirJpsE6Mda8bT5oZtsolCCTSQi2
	M7HNBbA5E9z3qH/S8rkNKdklKvMEExRygIJquJLvN6asI7bPeghIEurQ9FCqBwNQZw4QYENxskVdw
	loXa+tZi7AzT02ZfEJPAVIR98lYSMpFPUKOOFDBwVzf+HsJGN2KOyeUyjmEisQw/7fWN+yAAcZRce
	p9eC2jV/CB9Dwzuble/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKR-00000002McG-10Ny;
	Tue, 10 Nov 2026 04:19:27 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKK-00000002MW4-0K1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284360; x=1825820360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=siJ+HXBZa096ZlEQsTVh9iBvtYiYyaDLPZk/Svng8yE=;
  b=QZD/DmZ3whtPa1/YGaP1hu5INETJl60XjgQ8nCxqt/EKGf8lunTDj8Jd
   Oy3NLH1DuNzNFL1fQAKaIHxAdxtpuzwdzSeTWlKqOz71KjH1PbwG/r94r
   rXaU44ui3fLbhFHCGN2RBUDtjWX1GqmtCoLwJAdRpGOPLv1gxbSdmk+4v
   dYQhLgDivoU7FbK5g18qMK14Ur9m3Roi+wnFnELC5AIH/OxOyvO1NpfgZ
   ey67C5B+m8WYrKZMwV4eHugluyTJOj0rgffd4+YkaWT9XQlRcJ0zAXLT6
   TogEabl1VTLXLhQMTcXi0Hskch4gXO3YxWFi42h6XAZjfmxr3j8Ele/jB
   g==;
X-CSE-ConnectionGUID: Y0hSsT9DTb67MrG6AAfxdw==
X-CSE-MsgGUID: y7mVOpLqROqQ25RcarsuPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901332"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
X-CSE-ConnectionGUID: 53hkaHfDQ5KoBJWqFxCqnw==
X-CSE-MsgGUID: I4ySf9UwS0mAzV6XUPrsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856920"
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
Subject: [PATCH v3 5/8] arm_mpam: resctrl: Split control and monitoring domain setup into helpers
Date: Mon,  9 Nov 2026 20:19:05 -0800
Message-ID: <3d67a3dddd76cdb9981d4d7e78d657c930eb2cb6.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201920_163430_D73FD540 
X-CRM114-Status: GOOD (  18.58  )
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

mpam_resctrl_alloc_domain() allocates one structure that holds both the
control domain and the monitoring domain of a resource. It sets up
whichever of the two domains the resource supports, with the setup of
both open coded in the function, and undoes the control domain if
setting up the monitoring domain fails.

Apart from the code that manages domains, every user of the structure
accesses only one of its two domains, so the monitoring domain can be
given a structure of its own. Doing so starts with separating its setup
from that of the control domain.

Move the setup of each domain into its own helper in preparation for
giving the monitoring domain its own structure as part of supporting
multiple controls per resource. Keep the allocation and the error
handling in mpam_resctrl_alloc_domain() so that a failure to set up the
monitoring domain still undoes the control domain.

No functional change intended.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
Changes since RFC v2:
- Add Jinjie's Reviewed-by tag.
- Add Jinjie's Tested-by tag.
---
 drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 44 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ec39f3909388..db1df6e8d8c0 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1640,13 +1640,75 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 	return NULL;
 }
 
+static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
+					  struct rdt_resource *r,
+					  struct mpam_component *comp,
+					  struct mpam_resctrl_dom *dom)
+{
+	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
+	int err;
+
+	dom->ctrl_comp = comp;
+
+	mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
+	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
+	err = resctrl_online_ctrl_domain(r, ctrl_d);
+	if (err)
+		return err;
+
+	mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
+
+	return 0;
+}
+
+static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
+					 struct rdt_resource *r,
+					 struct mpam_resctrl_dom *dom)
+{
+	struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
+	struct mpam_component *any_mon_comp = NULL;
+	enum resctrl_event_id eventid;
+	struct mpam_resctrl_mon *mon;
+	int err;
+
+	/*
+	 * Even if the monitor domain is backed by a different
+	 * component, the L3 component IDs need to be used... only
+	 * there may be no ctrl_comp for the L3.
+	 * Search each event's class list for a component with
+	 * overlapping CPUs and set up the dom->mon_comp array.
+	 */
+
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		struct mpam_component *mon_comp;
+
+		if (!mon->class)
+			continue;       // dummy resource
+
+		mon_comp = find_component(mon->class, cpu);
+		dom->mon_comp[eventid] = mon_comp;
+		if (mon_comp)
+			any_mon_comp = mon_comp;
+	}
+	if (WARN_ON_ONCE(!any_mon_comp))
+		return -EFAULT;
+
+	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
+	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
+	err = resctrl_online_mon_domain(r, &mon_d->hdr);
+	if (err)
+		return err;
+
+	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
+
+	return 0;
+}
+
 static void mpam_resctrl_alloc_domain(unsigned int cpu,
 				      struct mpam_resctrl_res *res)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
-	struct rdt_l3_mon_domain *mon_d;
-	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
 	struct mpam_component *comp;
 	struct rdt_resource *r = &res->resctrl_res;
@@ -1663,55 +1725,17 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
 		return;
 
 	if (r->alloc_capable) {
-		dom->ctrl_comp = comp;
-
-		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
-		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
-		err = resctrl_online_ctrl_domain(r, ctrl_d);
+		err = mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom);
 		if (err)
 			goto free_domain;
-
-		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
 	} else {
 		pr_debug("Skipped control domain online - no controls\n");
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp = NULL;
-		struct mpam_resctrl_mon *mon;
-		enum resctrl_event_id eventid;
-
-		/*
-		 * Even if the monitor domain is backed by a different
-		 * component, the L3 component IDs need to be used... only
-		 * there may be no ctrl_comp for the L3.
-		 * Search each event's class list for a component with
-		 * overlapping CPUs and set up the dom->mon_comp array.
-		 */
-
-		for_each_mpam_resctrl_mon(mon, eventid) {
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
-		if (WARN_ON_ONCE(!any_mon_comp))
-			goto offline_ctrl_domain;
-
-		mon_d = &dom->resctrl_mon_dom;
-		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
-		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
-		err = resctrl_online_mon_domain(r, &mon_d->hdr);
+		err = mpam_resctrl_setup_mon_domain(cpu, r, dom);
 		if (err)
 			goto offline_ctrl_domain;
-
-		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
 	} else {
 		pr_debug("Skipped monitor domain online - no monitors\n");
 	}
@@ -1720,8 +1744,8 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
 
 offline_ctrl_domain:
 	if (r->alloc_capable) {
-		mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
-		resctrl_offline_ctrl_domain(r, ctrl_d);
+		mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
+		resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);
 	}
 free_domain:
 	kfree(dom);
-- 
2.56.0


