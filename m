Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfrHtmxR;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CtWwwSpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0aTBV71xTxqk+aXXztmUVwD3L3D+RwrT27yBkRKCFu0=; b=YfrHtmxRrRu3mc4PZGcf3dFbhK
	eu/pjs1aiL4AkCFbWONSaQ+HFPrCOoNt7tV0OYD1BFA+ZYB6R1lN4W8tOA/nzIT7E69Nn1vY1mJAS
	e8xn2KPchNpZvCuyY2oKLSyYY1WoHL32pGhgZYYjmQYijQR+3+TY+C026CoWOMWzWcj27fFDQ6Aj8
	2N4kVoVilFvpiBaau5rvOgSH+IMhwf8Pg/B7BS8bFWMu4UOt+UDBgGTMgkvRiW/uwc4wy4mgucz4B
	08XLuHD7JYwJuJiIpKKy+owzI7eKlJ7uHMn6rAL0JeA1kPKNUCzOOWhHVbcMb52niWczZLhfqhCZh
	3F4dgyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdxI-00000008jEZ-0e0e;
	Wed, 18 Nov 2026 11:36:00 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdx7-00000008jAV-1Yq7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:35:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0aTBV71xTxqk+aXXztmUVwD3L3D+RwrT27yBkRKCFu0=;
	b=CtWwwSpRqz1hboFyQdDmtCyh5mgihj2TxH+I0pbF8ZzaUV93Ytj/oGl6pejJ9FF4SuAtLjsDO
	Bl8tVdZ7F9SGgwf53NFbU5oHpLTyqdvJQA/Yb4k5/KyZa/6ZhzoQyaBdcx84lykPwlgF+ta7nQf
	pMAlSVZncfBbWxb5TA7FTwk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jTzzG2MPRz12LCq;
	Wed, 18 Nov 2026 19:34:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 82DC94056E;
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
Subject: [PATCH v5 2/3] arm_mpam: resctrl: Only enable CDP on a resource that supports it
Date: Wed, 18 Nov 2026 19:35:31 +0800
Message-ID: <20261118113532.638039-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261118_033549_640155_2A62B7AC 
X-CRM114-Status: GOOD (  11.21  )
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

resctrl_arch_set_cdp_enabled() allows enabling CDP on a cache level
that has no MPAM cache controls (e.g. mounting with -o cdpl2 when only
L3 is capable). This turns on system-wide CDP emulation without halving
the CLOSID count, causing upper control groups to map to PARTIDs beyond
mpam_partid_max. Accessing these out-of-range PARTIDs indexes past
internal arrays and triggers MSMONCFG_ID_RANGE, disabling MPAM.

Reject enabling CDP if the resource is not cdp_capable, matching x86.
Only the enable path is checked since unmount disables CDP on both
cache levels.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v5:
- Rmove alloc_capable check.
- Remove the unnecessary stable version.
- Simplfify the commit message.
---
 drivers/resctrl/mpam_resctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index aa3b3a093857..24d5b2fa4bca 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -213,6 +213,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable && mpam_partid_max < 1)
 		return -EINVAL;
 
+	if (enable && !mpam_resctrl_controls[rid].resctrl_res.cdp_capable)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
-- 
2.34.1


