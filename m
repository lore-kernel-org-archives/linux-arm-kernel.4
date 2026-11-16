Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FA606A891
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qEONUoJi;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gc6GFrA2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VOsnbNrX5S/Mt4Sph9gcGarh/50vZrJN8p3w2gZBk6k=; b=qEONUoJiwCmaCjQr4BGYfq9//S
	su8arGkgqtCQu9g1TXhjw/4skxnebWJ4syVISeuClrxbaoxO0PonOLg/wOaHG85lE3GCwQgpM6B3y
	CrPmbtJcR0MaDcp/+1fNoXDJ0AyO8o6wpMqjW7z8toUo3OhJRZeZwmNvB5S5LXMAFPXzJepCiMSeN
	QFvP+romq2xeMMWlpGLg6kDNlnnT5F1f+4UvXxYPS1foFS1wM2mSaKoOwG+i3Dc5c0vEPgu6hvXYR
	Gz6A6LRUIZtKvBCIhOWHdWbNlX+yFkwjs+zYFAs2Gc2ionEhpGdC9kerSbQhItrnfD3e116wHvObb
	Tmd4hwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJL-00000002Vb3-3jw4;
	Mon, 16 Nov 2026 12:59:51 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJE-00000002VJr-3kFn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VOsnbNrX5S/Mt4Sph9gcGarh/50vZrJN8p3w2gZBk6k=;
	b=gc6GFrA26FNAoCXvWzrWATyoL8hVY/iDtaQ+NLYTzx2XMPiZs7Waz9wWVqBModd2e+TFlCUnY
	N5I/ESeAJNpjldfleI/U28YRiOEYC2FQGTAcG8GuSAsLWAi1GyNJRhK4UUjnbCdAj8bO83GlS6X
	UUWJgJl4MQ1RyJ671W3Cm8Y=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxm0m6JzmV6s;
	Mon, 16 Nov 2026 20:59:24 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 61ADF4056C;
	Mon, 16 Nov 2026 20:59:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 18/19] arm_mpam: resctrl: Expose the L2 monitor events
Date: Mon, 16 Nov 2026 20:59:13 +0800
Message-ID: <20261116125914.498841-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_045945_284512_AB3DC3D6 
X-CRM114-Status: GOOD (  12.98  )
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

mpam_resctrl_pick_counters() skips cache classes that are not the L3, so
the CSU and MBWU monitors of an L2 MSC are never used. Allow L2 cache
classes to supply the L2 resource, and let an L2 class with usable MBWU
counters become the L2 bandwidth event.

Check the traffic match before the topology match. An L2 class can never
match the L3 traffic, and topology_matches_l3() warns when a cache has no
online CPU, which is reachable for an L2 cache during boot.

The L3 checks describe where memory bandwidth is measured.
'mbm_core_bytes' is the number of bytes the L2 cache sees rather than the
memory bandwidth, and an L2 class has its own scope and domain ids, so
neither check is needed for it.

No function change for the L3.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 704383304f6b..ce16afcdc1b0 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1128,9 +1128,10 @@ static void mpam_resctrl_pick_counters(void)
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
-		/* The name of the resource is L3... */
-		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
-			pr_debug("class %u is a cache but not the L3", class->level);
+		if (class->type == MPAM_CLASS_CACHE && class->level != 2 &&
+		    class->level != 3) {
+			pr_debug("class %u is a cache but not L2 or L3",
+				 class->level);
 			continue;
 		}
 
@@ -1150,13 +1151,22 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(RDT_RESOURCE_L3, QOS_OCCUP_EVENT_ID, class);
+				counter_update_class(mpam_class_rid(class),
+						     QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
 			}
 		}
 
+		if (class->type == MPAM_CLASS_CACHE && class->level == 2 &&
+		    class_has_usable_mbwu(class)) {
+			pr_debug("class %u has usable MBWU for the L2 resource\n",
+				 class->level);
+			counter_update_class(RDT_RESOURCE_L2, QOS_MBM_TOTAL_EVENT_ID, class);
+			continue;
+		}
+
 		if (class_has_usable_mbwu(class) &&
 		    topology_matches_l3(class) &&
 		    traffic_matches_l3(class)) {
-- 
2.34.1


