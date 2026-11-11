Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C300606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fysm/Cwi;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PhlVHTqB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZUfWaV/zQvNeuCJEfS/peQTeOVn6kkR76BCqbGN3A+U=; b=Fysm/Cwi4YfLOCReHpTuAoAXG6
	yBicGP/7OtVOizHJu1PW58RRvf/+f1IKV6DPn0U0KXp2/pVobrqC32sMAmIv0nvISNG6TS62eIteR
	XgWjnsN2m+r9lyAx1e0kumic/NWGTaXNb+A2G23kTZog3Lcuk+vMj1guMYmyCH6GXv4AzWiGcIHFh
	tgcdFYovX4Kbtt5RP3r8OqII3bFYe1X89sZ293sl8JZ0XalVNHzPKRXDHq/SbhJcns9dHgJSIW2j6
	DSLXbgoRyAazZhdXryBgGHiEs08h+IZ2ZE4M0G777WKawlhLBythsHGpMXGgDVNJe9of5k9kzTINe
	m5LpBk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Sc-000000060tU-36rh;
	Wed, 11 Nov 2026 08:13:39 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SY-000000060o4-1fyZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZUfWaV/zQvNeuCJEfS/peQTeOVn6kkR76BCqbGN3A+U=;
	b=PhlVHTqBBDSeuCTP75pcpnLHPfLV+6BssxOaH+8RxFKXOuNxqC0dPQ4vueL/tFwFCU3A4hzC4
	ktdbjdk78nnZzngP7bdbKU2tKo6A22bbDiMp3S2BC/NSK+PNPxPiigAfudHnHGIJG8Tn/mb35ym
	9F4KLG47Hd90QJqTgAcPOb8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jPbqv0MFLz1cyTf;
	Wed, 11 Nov 2026 16:13:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 810874057A;
	Wed, 11 Nov 2026 16:13:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 1/3] arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
Date: Wed, 11 Nov 2026 16:13:14 +0800
Message-ID: <20261111081316.3828283-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111081316.3828283-1-ruanjinjie@huawei.com>
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001335_304702_164583A9 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: <stable@vger.kernel.org> # 7.1+
---
 drivers/resctrl/mpam_resctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 563ca99a581d..573617ba09df 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -219,6 +219,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	if (enable && mpam_partid_max < 1)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -248,9 +251,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
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


