Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A5360A2613
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C+m4UJ/O;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eHmQP8E5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gG0BIsp3F32RveUGW6ul6/4p/lJVSGAIllfHJfCYFVQ=; b=C+m4UJ/OH+Oluk
	8+F4PmRawxAjvWKPFguMwKvyG8QFKVPlYPV6qgFdk0Gvb7y6qRfHOqT/WGjJYp9bRf/FyxD83sfb6
	73sjXag9S7iIO3uk0tesB/O/CmZ1BrGv8PCbMvF6VP9H3sDoh/a8Nip83tEz0HeLTkcUKgGDMV6W3
	5pu6j7qh35tvQcdiU9Y6s5bmSEEaJgu/20VTg+SNh0afNS1YUEBTGhOG8vhM5QfrZbK2UucZOF+bL
	WxRueqIiryeeoWs/tmfqG5cb0mHEk0VnuvtphVXCaqqJeVy7TJVfQUSHhk5cDOmpUOLElSo5nrtCD
	tBCnc7Fy6916mviWuQyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKQ-00000002MbD-3d9Q;
	Tue, 10 Nov 2026 04:19:26 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKI-00000002MW4-3MUj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284359; x=1825820359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OtdIqlJCzePoc/YWZ7W8qi5SoWYQ8adAJ9eFkSM+jz0=;
  b=eHmQP8E5fxu9qAv98Gl5I6g5eFVMsRtTmXj+aEqLegazSOOs6dl1++Dl
   zUuxHMmRX6hmMlJb4RINRS3c0407f+bfm/s2KnF6nAJSE6MBpZudPoiwL
   1WoKgsdy9ubIt4Krzva4tGT005om7uYwiCwmgfzdt6jr2ES/Qcp5evFwo
   MzGwaYuC8En/jDp3PFqi4ThnARkj4DyusjVdVVEq2nLDD+LFm9Cw2WN8Q
   bUW/dHHBLpqhrDgxMpnzxi0sc+ZXTHDXq5xbp04afIq1j9T4rOMxoBUIe
   SsEHTgTJP130E8Xhcs3NKHjCqfnXBgXGaAQSpslqhG07PUALjPYiCawYs
   A==;
X-CSE-ConnectionGUID: bSMHltz+QkW/V49B4cIdeQ==
X-CSE-MsgGUID: VMn+zmddQXG/2tdfHkiYYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901303"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901303"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
X-CSE-ConnectionGUID: bSY4sNg1QIyG4blghiHrWg==
X-CSE-MsgGUID: jk+useGmQSm7G6c8Wi35wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856912"
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
Subject: [PATCH v3 2/8] arm_mpam: resctrl: Use find_component() when allocating a domain
Date: Mon,  9 Nov 2026 20:19:02 -0800
Message-ID: <c79ae06f66ab31db3425c537e765813711f3ceaa.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201918_861294_758CE6A8 
X-CRM114-Status: GOOD (  12.75  )
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

mpam_resctrl_alloc_domain() starts by checking that the resource's
class has a component whose CPU affinity includes the CPU, and fails the
domain allocation otherwise. When the resource supports allocation, that
component also backs the control domain. The check uses an open-coded
walk of the class's component list, while the same function uses
find_component() to find the component backing each monitoring event.

The open-coded walk duplicates find_component(). It also holds the SRCU
read lock until mpam_resctrl_alloc_domain() returns. However, the SRCU
read lock is only needed while walking the component list, and
find_component() holds it for that walk.

Replace the open-coded walk with find_component().

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
Changes since RFC v2:
- Add Jinjie's Reviewed-by tag.
- Add Jinjie's Tested-by tag.
- Shorten changelog. (Ben)
---
 drivers/resctrl/mpam_resctrl.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 1b1e724ae040..a75f653031fd 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1648,21 +1648,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	struct rdt_l3_mon_domain *mon_d;
 	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
+	struct mpam_component *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
+	ctrl_comp = find_component(class, cpu);
 	/* class has no component for this CPU */
 	if (WARN_ON_ONCE(!ctrl_comp))
 		return ERR_PTR(-EINVAL);
-- 
2.56.0


