Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xG0mw2Ja;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X6RWyuln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AV5zitI1IdkcOHGkiPiF8QdIMkhW2zoRM0PJ71FqnqQ=; b=xG0mw2JaBRM1Tw1Es/CLjZQyaz
	iwWWTSHV4CaofiDLXKivR+nSRsrixKa3KfgvUGi5X2oXoJvNEn7AThUFictU2aFCLNAPIaaNA991Y
	oM1nU5PDZ5FsTI48mkJIGgTQGNox2c+bQDcEAHHOciHfCzVMeL9wPbGSl56lR67BkLhfESQqwUCzY
	+8bSTtcDjXF9QPMh+hOeDxVYU0Ud1LSiD8VC066bF48cvW6ce3yH8kuabuwm02R5Ia8vlDhlUHaEE
	Xebb3wZOkj0HSf1g7w8YQa3OfgGbsbOCuMEn5O38YBCyG/PW292Lc87h0lxcz9wW4zkQgTW+FfizL
	YsRelHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdx9-00000008jBh-3DfD;
	Wed, 18 Nov 2026 11:35:51 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdx6-00000008jAQ-3a1s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:35:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AV5zitI1IdkcOHGkiPiF8QdIMkhW2zoRM0PJ71FqnqQ=;
	b=X6RWyuln2WkBkC0v+D8U0Na1zXfPiXTpyfpArrY6cGgjrIJTKDdSrmfywrF1dqqaGmpqK9v1q
	IgrKqDTd+RouZc4MRkA3m1o14TWHuzJJMvnDv9CzRtSBiCaKVG/J9dHs8PZt55TvkfRO3QzYlXw
	t6+OP9K0N5XHRJjk8Q1arw0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jTzzt48wqzmV6N;
	Wed, 18 Nov 2026 19:35:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A8564057A;
	Wed, 18 Nov 2026 19:35:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:35:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<tan.shaopeng@jp.fujitsu.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 1/3] arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
Date: Wed, 18 Nov 2026 19:35:30 +0800
Message-ID: <20261118113532.638039-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118113532.638039-1-ruanjinjie@huawei.com>
References: <20261118113532.638039-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_033549_438141_F1D9EC8E 
X-CRM114-Status: GOOD (  12.28  )
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

Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
recorded CDP as enabled, halved the monitor count and turned off the
mbw_max MBA control. resctrl then believes CDP is off, which leaves the
two sides out of step and the halved monitor count and the missing MBA
control are not undone.

Check the PARTID limit before anything is changed so a failed enable has
no effect.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Cc: <stable@vger.kernel.org>
---
v5:
- Add Reviewed-by.
- Remove the unnecessary stable version.
---
 drivers/resctrl/mpam_resctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..aa3b3a093857 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	if (enable && mpam_partid_max < 1)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
 	if (enable) {
-		if (mpam_partid_max < 1)
-			return -EINVAL;
-
 		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
 		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
 	}
-- 
2.34.1


