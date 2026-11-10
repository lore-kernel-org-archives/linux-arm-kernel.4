Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB060A262C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKBchg7N;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbYv9R3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cRsKOafKqI8dLGqnlRQ4af7ukN3KKmKLy6whAXKDynM=; b=IKBchg7N35+B77
	/mqxstlfjcK4xU2tCeB2T/J64lulQPfQooVHMaLtlO0RQXWMV70gZpyh/F/fGio75bM08OphiF3YX
	Fmpw6Ql0IRKM5n8ddUxTTv0EEiKy3PC2CQqDvbOx15Etdb8eQQj6lKLKGaTILvWpzsbk0UUrBZyBa
	ldNBjWwpSVjuoGuGCmcTZXLUIgrSM+qQ+yw+qqJUh0GB0EDRTBRaLea0RA3jXxDDeb+1AO2mcJGEk
	L8s5EWmH6szldDtX2iXkr3+hrfzhrNUYWmuM/Q1gZTX4E1RD5FUiaHZR4HS6V/QMBkV4CsvOFxon6
	nolRm2ctpPRG9FMw+fcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKR-00000002MdB-2LKI;
	Tue, 10 Nov 2026 04:19:27 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKL-00000002MWC-0Wfm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284361; x=1825820361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BVep7Qz8JJqudKzCF6G/P+rgdoPynynQFiyMuZ5kOMU=;
  b=gbYv9R3PJb0qQvFThTp0azK8LEhxGtwh6+zXCLseqSKeW9NnjMOQ39I0
   uOYOS40Twf0tRQZvc4uwzyZu15aq3tVBlt24pEveb9wvj8DGIzBJ90TEF
   EOEF/kA53/DFU4ZYOWqYOle0Mc61n1wnVh+5fwDT3bZc6xUQo0e7Mtdxq
   9imyu384f3GzGGwm6C13ptNchmtfVo82tdWA5XD6RyvlK/rMMsc35nphO
   H9GMzOFNO3iJddd+40GHj5HUvdjMJVyqtuKFXvKB58NLPz38ktSnkWDdM
   MWfDUg+WVXa3nfOvQYmvWkn5fmVn4GzSw7QLew8hL3xiwi1LVNU91yhI7
   Q==;
X-CSE-ConnectionGUID: Aj4K/fswRFSVx6iXwWELlA==
X-CSE-MsgGUID: oXw3yPxJSIqoTkaTTH/3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901357"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
X-CSE-ConnectionGUID: Czvc6wcTSdOl6TcV+kkw/A==
X-CSE-MsgGUID: ygcaiT8hS7mFc7xI3EOeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856929"
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
Subject: [PATCH v3 8/8] arm_mpam: resctrl: Rename struct mpam_resctrl_dom to mpam_resctrl_ctrl_dom
Date: Mon,  9 Nov 2026 20:19:08 -0800
Message-ID: <7a44ffd1fc83e74192fa8363d560c1f90e843da1.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201921_180166_16F05915 
X-CRM114-Status: GOOD (  12.65  )
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

struct mpam_resctrl_dom holds the control domain of a resource, while
its monitoring domain is held by struct mpam_resctrl_mon_dom. Unlike the
name of the monitoring structure, the name struct mpam_resctrl_dom does
not say which kind of domain the structure holds.

Rename it to struct mpam_resctrl_ctrl_dom to match its monitoring
counterpart.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
Changes since RFC v2:
- Add Jinjie's Reviewed-by tag.
- Add Jinjie's Tested-by tag.
---
 drivers/resctrl/mpam_internal.h |  2 +-
 drivers/resctrl/mpam_resctrl.c  | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1df439ecb055..dc304e4e0dc0 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -432,7 +432,7 @@ struct mpam_msc_ris {
 	struct mpam_garbage	garbage;
 };
 
-struct mpam_resctrl_dom {
+struct mpam_resctrl_ctrl_dom {
 	struct mpam_component		*ctrl_comp;
 	struct rdt_ctrl_domain		resctrl_ctrl_dom;
 };
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 263bbbc27dac..8894d0d19468 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1400,7 +1400,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	struct mpam_config *cfg;
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 	enum mpam_device_features configured_by;
 
 	lockdep_assert_cpus_held();
@@ -1409,7 +1409,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return resctrl_get_default_ctrl(r);
 
 	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
-	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	dom = container_of(d, struct mpam_resctrl_ctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
 	/*
@@ -1460,7 +1460,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	struct mpam_config cfg;
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 
 	lockdep_assert_cpus_held();
 	lockdep_assert_irqs_enabled();
@@ -1473,7 +1473,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	 * resctrl_arch_update_domains() relies on this.
 	 */
 	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
-	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	dom = container_of(d, struct mpam_resctrl_ctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
 	if (mpam_resctrl_hide_cdp(r->rid))
@@ -1643,7 +1643,7 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
 					  struct rdt_resource *r,
 					  struct mpam_component *comp,
-					  struct mpam_resctrl_dom *dom)
+					  struct mpam_resctrl_ctrl_dom *dom)
 {
 	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
 	int err;
@@ -1741,10 +1741,10 @@ static struct mpam_resctrl_mon_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu
 	return NULL;
 }
 
-static struct mpam_resctrl_dom *
+static struct mpam_resctrl_ctrl_dom *
 mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 {
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_cpus_held();
@@ -1761,7 +1761,7 @@ static void mpam_resctrl_add_cpu_ctrl_domain(unsigned int cpu,
 					     struct mpam_resctrl_res *res)
 {
 	struct rdt_resource *r = &res->resctrl_res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 	struct mpam_component *comp;
 
 	lockdep_assert_held(&domain_list_lock);
@@ -1811,7 +1811,7 @@ static void mpam_resctrl_remove_cpu_ctrl_domain(unsigned int cpu,
 						struct mpam_resctrl_res *res)
 {
 	struct rdt_resource *r = &res->resctrl_res;
-	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_ctrl_dom *dom;
 
 	lockdep_assert_held(&domain_list_lock);
 
-- 
2.56.0


