Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3212606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jOAqPh/X;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Uq9jxE24
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BCDGiFTL7bEho1teaaR+h3F3jJTu4tY+KLRp0jIgfEk=; b=jOAqPh/X6AOr4U3E7JDsUeYZ1v
	NpaWp78WCgnjjJnSB0Ba0dPqhVjZKerb4zEqHvxGjlXb5IXOPyF2Or0iOfGXYVE/+F7DrESNbF2Ij
	KORw4o6jwBphBr+F4346o0jKeNCDahl5zv/D0ezUr90sjCx+S4Q3OZJCgyQm0ZUJqb6Q7J6K5e0RW
	2aOLPkW8RpR0nQ4VhYiHxyXdnnxDogtam+RrN7pwCsxpjTkBIEVvpG4X708HaiVKsL5yq84szAryL
	qYYS9HRr5GxBBfi+23Y7WNHAuSE9QPxRmtqaoo21u1Ahv/hrUIosKVwK+9Z0qaMD5SJ6FP/WXcEWv
	R/5FCvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcX-00000009yaY-24jT;
	Thu, 12 Nov 2026 13:13:41 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcB-00000009ySZ-3lNp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:13:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BCDGiFTL7bEho1teaaR+h3F3jJTu4tY+KLRp0jIgfEk=;
	b=Uq9jxE24HjGXST5HHEpVr7kDwwuMKs4eg6oQ+GgM41GKEF97mVDdLaC679k0FF2FVirVEkGwo
	FEU41UYnLHVs7CZ/51h4d4eveoQMWtb/l4+JLZrqUPCJH4H4xW4ZVbDzcemKNHH4/zTLjBf7Sn3
	E2cuTckOB69GvTREopDm3zI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jQLQx07b9z1T4KS;
	Thu, 12 Nov 2026 21:12:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E7B840538;
	Thu, 12 Nov 2026 21:13:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:11 +0800
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
Subject: [RFC PATCH v2 1/9] fs/resctrl: Extract the software controller's step decision
Date: Thu, 12 Nov 2026 21:12:46 +0800
Message-ID: <20261112131255.4043381-2-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261112_051321_023399_B9AA1041 
X-CRM114-Status: GOOD (  16.19  )
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

Move the condition that picks the next control value out of
update_mba_bw() and into a helper of its own.

No functional change intended.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 54 ++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..75abbf90d090 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -661,6 +661,38 @@ static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
 	return NULL;
 }
 
+/*
+ * Pick the control value for the next interval: step down while the
+ * measured bandwidth is above the target, and step up when the target is
+ * above the bandwidth the next step up is expected to yield.
+ *
+ * Always increase throttling if current bandwidth is above the target set
+ * by user. But avoid thrashing up and down on every poll by checking
+ * whether a decrease in throttling is likely to push the group back over
+ * target. E.g. if currently throttling to 30% of bandwidth on a system
+ * with 10% granularity steps, check whether moving to 40% would go past
+ * the limit by multiplying current bandwidth by "(30 + 10) / 30".
+ *
+ * Return: true when the control value changes, false otherwise.
+ */
+static bool mba_sc_next_ctrl_val(struct rdt_resource *r_mba, u32 cur_msr_val,
+				 u32 cur_bw, u32 user_bw, u32 *new_msr_val)
+{
+	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
+		*new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
+		return true;
+	}
+
+	if (cur_msr_val < MAX_MBA_BW &&
+	    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) /
+		       cur_msr_val)) {
+		*new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Feedback loop for MBA software controller (mba_sc)
  *
@@ -737,27 +769,9 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 		cur_bw += cmbm_data->prev_bw;
 	}
 
-	/*
-	 * Scale up/down the bandwidth linearly for the ctrl group.  The
-	 * bandwidth step is the bandwidth granularity specified by the
-	 * hardware.
-	 * Always increase throttling if current bandwidth is above the
-	 * target set by user.
-	 * But avoid thrashing up and down on every poll by checking
-	 * whether a decrease in throttling is likely to push the group
-	 * back over target. E.g. if currently throttling to 30% of bandwidth
-	 * on a system with 10% granularity steps, check whether moving to
-	 * 40% would go past the limit by multiplying current bandwidth by
-	 * "(30 + 10) / 30".
-	 */
-	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
-		new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
-	} else if (cur_msr_val < MAX_MBA_BW &&
-		   (user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
-		new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
-	} else {
+	if (!mba_sc_next_ctrl_val(r_mba, cur_msr_val, cur_bw, user_bw,
+				  &new_msr_val))
 		return;
-	}
 
 	resctrl_arch_update_one(r_mba, dom_mba, closid, CDP_NONE, new_msr_val);
 }
-- 
2.34.1


