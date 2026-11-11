Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99173606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q/vaWRDN;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4VAjRoVv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=02ZuU5L8LvwtJsfio8qy603fcakQVuFW27ea/trZscI=; b=Q/vaWRDNjEjA9sJ3qVASAOUGyT
	0KAHcDeWScIO6g0gcZwrTABAqEAlDRiM3EKrXi2RLQ6Dt7WfqZrTmmS/jaFkQ2dizkNhyl/3ugvAa
	t0rs4seERdg0oxxWsYp3FLvPMYa+7h0tnxZbFziYOUNarSujLssDE3+3Gp2UZj071GA/DRMAI4BWx
	mtCAPnbydcjb2Sug415kKefexZNJ/kaUmvbo8cuynCPyoJU2Tubf8dKVDVXcB+UTZE+4A3HgF04or
	35CVs5R4Bra0IWcWuce0k0+eUW9y9V0/UFZEsCm76nILYK0rzfQiRsec6bbeUku60W3iao82pHQLM
	YIoL85yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3So-0000000614Y-16pC;
	Wed, 11 Nov 2026 08:13:50 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Sa-000000060p2-2DKC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=02ZuU5L8LvwtJsfio8qy603fcakQVuFW27ea/trZscI=;
	b=4VAjRoVv8MAIytCy/iLfyFKqwU8j7ZIVCKpUVgPIydLv0mxy/BBTM5s+fUlL6B7oFlWU3VGdM
	pvxBoRKPxvCAXB8k43XU33vLeVD7QvW/TFGzvELXGe3RVtHNno1dQKJrTdzSQqLfvPe1/Ssjc+7
	WmcjhIXSh51rOkq/CgyDWIk=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jPbr15RQFz1K98l;
	Wed, 11 Nov 2026 16:13:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0626A4055B;
	Wed, 11 Nov 2026 16:13:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource that supports it
Date: Wed, 11 Nov 2026 16:13:15 +0800
Message-ID: <20261111081316.3828283-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261111_001336_725347_8BAA17A1 
X-CRM114-Status: GOOD (  12.31  )
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

resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
requested, even one that has no MPAM cache controls. Mounting resctrl
with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
its CLOSID count at the number of PARTIDs. Control groups in the upper
half then map to PARTIDs beyond mpam_partid_max, which index past the
configuration and monitor arrays and program out of range PARTIDs into
the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
disabled.

Do not enable CDP when a resource cannot allocate or is not CDP capable,
as x86 does, so the mount fails instead. Only the enable path is checked,
since unmount disables CDP on both cache levels to restore the MBA control.

A system where only MBA can allocate, or that only has monitors, now
fails a mount with CDP as well: CDP hides the MBA control because
mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
 drivers/resctrl/mpam_resctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 573617ba09df..afa3c084c475 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable && mpam_partid_max < 1)
 		return -EINVAL;
 
+	if (enable && (!mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
+		       !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
-- 
2.34.1


