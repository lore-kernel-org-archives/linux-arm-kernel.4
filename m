Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3F60A6F75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RKSmf4CB;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ax4xDHMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EBhsEKZkI0T6l5ZEl4CsvjDyXBYk51vEHobMZ0URW+M=; b=RKSmf4CBCn1QM9
	aUqXPxynxPvCu4DG5Mui5TlozVcWaEWOx4Ci+hDcQXP9JSjg1O2GBQjcYDpkj7oexOqrqry/mJpo9
	sskzHX/OpDgjerTDYF31G1HHm76+yFWShdOButaLfuGbiaLL68+1vI+PMZs7OXjbParTbXqR09GHk
	MF1MDFeXIpe6tYZFwhz/Fn9oGLBO8/nruWIaMUTCirvGhE6cZO4UyBn+1mFenVZKJeRJDkgndlU6o
	K2smwm2dW3B5IDXRlB2E0oWvEdwzuiHLX8k8a4Me/IHqid9rE858HK5sVfuDj5iKzkWvyzOvi7bst
	GeZqvdjNjbrMCiDsjpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKR-00000002Mce-1Yu4;
	Tue, 10 Nov 2026 04:19:27 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKK-00000002MWl-1sUX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284360; x=1825820360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OsiKxBUCPT9LghQtc7gN8zDNI74uP9EnNh0+wpzYPA0=;
  b=Ax4xDHMPnyKJiBZf62koJkDjGcRbAzG4sJZg6lt0SclHY4SAatr+fjg3
   Ji2Jr1YTLKZkXh2hGNIgbbdkBaKlz1qUKpSsF132yiAZ+2wBC8CkMs+cy
   VheeVVTBaG3kHn2gGuvhJdskJtoWTRb+bAzk8aqS9qeYU7Bi9EojGOvxb
   1Xp+gKtRqX2ns1JvlbJewi/zvlBUcBiq92JkdEBzkjhlf++uRCpLv1+HB
   G/zQRvubnmdVVvJ15W1A1rDYqhet2L2AxRURTJwpJF9kDxl10arYFkW0J
   eHS4oFqsak89oi2ZWwLp84oKl4e4RMEToUBw02q0I255ywXTrzwI214H2
   w==;
X-CSE-ConnectionGUID: aL3j+dzYQZmFroDZLznVlA==
X-CSE-MsgGUID: 6v1HzYYJQy6WlAalkA8yeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901344"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
X-CSE-ConnectionGUID: QZKeKtlJSPOwW/MoKuGTFQ==
X-CSE-MsgGUID: m4PO8iMkQba21uMJQDXH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856923"
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
Subject: [PATCH v3 6/8] arm_mpam: resctrl: Require a component for each monitoring event
Date: Mon,  9 Nov 2026 20:19:06 -0800
Message-ID: <6828c35d975ea89bc551721da9c9a5a629b6db67.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201920_535738_AFEA4357 
X-CRM114-Status: GOOD (  14.48  )
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

Setting up a monitoring domain looks up, for each monitoring event, the
component of the event's class that contains the CPU and records it in
the domain. Reading and resetting the event's counters in the domain
then use the recorded component.

If an event's class has no component for the CPU, the domain is still
set up as long as another event's class has one, and the event is left
without a component. Reading or resetting the event's counters in that
domain then dereferences a NULL component. This is not expected to
happen since only classes that cover all possible CPUs are picked for
monitoring.

Fail setting up the monitoring domain, with a warning, if an event's
class has no component for the CPU, so that every event of a monitoring
domain has a component.

Keep the check that at least one component was found. It now only fails
if no event has a class, and so captures that a resource that supports
monitoring has at least one monitoring event with a class.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since RFC v2:
- Add Ben's Reviewed-by tag.
- Add Jinjie's Tested-by tag.
- Move ahead of "arm_mpam: resctrl: Give the monitoring domain its own
  structure", which now contains a check that relies on this one.
---
 drivers/resctrl/mpam_resctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index db1df6e8d8c0..ca90b293b697 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1686,9 +1686,11 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 			continue;       // dummy resource
 
 		mon_comp = find_component(mon->class, cpu);
+		if (WARN_ON_ONCE(!mon_comp))
+			return -EFAULT;
+
 		dom->mon_comp[eventid] = mon_comp;
-		if (mon_comp)
-			any_mon_comp = mon_comp;
+		any_mon_comp = mon_comp;
 	}
 	if (WARN_ON_ONCE(!any_mon_comp))
 		return -EFAULT;
-- 
2.56.0


