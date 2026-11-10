Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002260A6F5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D2baZEk/;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZwro06L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yVhAqM6znopF8DCUrXTkTPQPEoRWRqaKrGCzI/y/X/I=; b=D2baZEk/F7g8pY
	a6+brKTxyhyWbkf8N7lm7JY2AhBMY5aEtMcNJC8uLzwbNC8dmh7uxYkm59ZF+i2V6LONNmNoz4lUO
	IRc7MKiSBSiNuuVX+qwL1TZV+xRdP0EDo9Rs/kl/DKx3pVum2/gvAadAvCwAubvVtTK3xcs1wLTP8
	mtrQ03FDlNn/HOhdLqe9a/Q18ZY1AELADDOZEEbiYmmyhqwQzCwrvNWQuwsuBPilTHz0W63RWqSzs
	jcSFHiFJq6VZ1ZU2XWTIV2lIZnOhJBdnYNr+TeRgxYq0atyKcrzcvIQNndg9A15QTmHuqtwtYoH7U
	bnKHLA7T//sPErVQME4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKQ-00000002MbX-43rk;
	Tue, 10 Nov 2026 04:19:26 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKI-00000002MWl-3YZs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284359; x=1825820359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JcvLWyniSyOFOOX7XlUH66SXY27TBGk1e1/SsTfDZCw=;
  b=dZwro06Lz8w3t1okh019mA0gm/1OoJug0mcel5lBmtsjDN0I0bsZfCW0
   v13Cs4MzwFOx9A6QBLUp5nMrpch5giPM5erkzBmVZ4/hDInBdPRidhZ/M
   UShBiNpjJe28AKawJ6MqJ2u57Fu1SwYkKvun9HlolIBcYXRxlch0dcAMS
   e3wqtiaCI+wmocyQsBtS5cqVTvNAFvXQ2g2Gsv19iXrOGmDDF6qddB6AQ
   BvPLM2YrEdYRc2S20u9qjQij0vA9FgjXHZEvoePa0V8QvTwj8h4NzLiZJ
   owLDaoO3nfwcdC7dEXq1cyOMROHozb4GqLBf9OnZmX9/F/MKevTiOaj4y
   g==;
X-CSE-ConnectionGUID: EPThpQYPSJ2i2de7/Bz9lA==
X-CSE-MsgGUID: vKlkgH4IQV2Jg/tpE/xSAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901312"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901312"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
X-CSE-ConnectionGUID: D7wP2FsWRtail10jcRH+rA==
X-CSE-MsgGUID: rOZcpoX/SVmASyJ/22+8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856915"
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
Subject: [PATCH v3 3/8] arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
Date: Mon,  9 Nov 2026 20:19:03 -0800
Message-ID: <622cee43d7d1ef89f1d28ad7cfc948efa9cd618d.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201918_908680_47F2F5B7 
X-CRM114-Status: GOOD (  16.96  )
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

mpam_resctrl_alloc_domain() looks up the component of the resource's
class that contains the CPU and fails the domain allocation if there is
none. The component is held in a local variable named ctrl_comp and, when
the resource supports allocation, it also backs the control domain.

The lookup and its check apply to every resource, including one that
supports only monitoring. For such a resource the component does not
back a control domain, so the name ctrl_comp is misleading. The name also
makes a comment in the same function ambiguous. The comment notes that
there may be no ctrl_comp for the L3, which is true of the control
domain's component but contradicts the local variable, which always
refers to a component once the lookup succeeds.

Rename the local variable to comp. Keep the ctrl_comp name for the
control domain's reference to its component because it only ever refers
to the component that backs the control domain. Leave the comment
unchanged since it now unambiguously refers to that component.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since RFC v2:
- Add Reviewed-by tags from Jinjie and Ben.
- Add Jinjie's Tested-by tag.
---
 drivers/resctrl/mpam_resctrl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a75f653031fd..d0c7c741ce90 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1648,14 +1648,14 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	struct rdt_l3_mon_domain *mon_d;
 	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
-	struct mpam_component *ctrl_comp;
+	struct mpam_component *comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
 
-	ctrl_comp = find_component(class, cpu);
+	comp = find_component(class, cpu);
 	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!ctrl_comp))
+	if (WARN_ON_ONCE(!comp))
 		return ERR_PTR(-EINVAL);
 
 	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
@@ -1663,10 +1663,10 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		return ERR_PTR(-ENOMEM);
 
 	if (r->alloc_capable) {
-		dom->ctrl_comp = ctrl_comp;
+		dom->ctrl_comp = comp;
 
 		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
 		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 		err = resctrl_online_ctrl_domain(r, ctrl_d);
 		if (err)
-- 
2.56.0


