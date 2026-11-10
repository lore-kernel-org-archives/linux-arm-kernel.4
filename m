Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F76606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d6R2JhTM;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5Bt0QLAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cHxQtytVmjDBHQG3dPoCx8HxlLCtE3kEcShZG74YRoE=; b=d6R2JhTM9Jg3PLIdip7lD+5+3I
	QIt0KulhBC/m9uBtWhVTJC5x1wBTM11ESQVZ7qX0uWUujaDXr7BA5PFSzsOzDaYOgygE3mZxpIxr+
	8QpKZ7myBNkYGHIHCcCjGk0jU8aDQuVvZd2IttBAusXaAg9ONTx/A8wKvyFLmVHnjM1rfFz887FKo
	wexuTQzkkiX82Lvmc+JR6Gpwqff3yBUXjqMw/zgGfM3QkSPb2CxBOVvOLU32iwLt0eKRsXS5xAnw1
	4hr2G6e1/13dv+Kxanp9aWkYLhU28+holmvb0JwSVcIFW6N5m8nUwRAQvpBlFMZrpiWsOk2XB4ZDe
	z7xfGSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm5I-000000045bb-0G4I;
	Tue, 10 Nov 2026 13:40:24 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm53-000000045TV-2tSQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:40:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cHxQtytVmjDBHQG3dPoCx8HxlLCtE3kEcShZG74YRoE=;
	b=5Bt0QLAgpL0ozO9zJjPSpFxv1nGO40DEneXm8z3c5ZndI8jbh7Alrv8mygYjWpxzS6SaeE1o5
	nhaIvZgiq4ZgBpujaO2L2V0JvaK3TSFbn3++4VuaZQSzBhJGNPFPI764GGZHw+Fucgelv2eHlcz
	4EFav5eLsekxiwzZdGRHenQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jP77K0s1dzRhSl;
	Tue, 10 Nov 2026 21:39:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 098D94057D;
	Tue, 10 Nov 2026 21:40:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
Date: Tue, 10 Nov 2026 21:39:38 +0800
Message-ID: <20261110133938.3768632-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110133938.3768632-1-ruanjinjie@huawei.com>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054010_142798_AF4F15AD 
X-CRM114-Status: GOOD (  17.60  )
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

Moving a MON group into the mon_groups directory of another CTRL_MON
group changes the CLOSID of the group while its RMID stays the same.
Where the RMID is only meaningful together with the CLOSID, as on arm64
MPAM, the move changes the RMID index of the group and is rejected with
-EOPNOTSUPP.

Userspace cannot tell whether the move is supported without trying it.
Add "info/moveable_mon_group", which reads 1 when a MON group can be
moved to another CTRL_MON group and 0 when the move is rejected, and
refer to it where resctrl.rst describes the move.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst | 11 +++++++++--
 fs/resctrl/rdtgroup.c                 | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index fecb2cd2b343..4be0508c18f7 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -526,6 +526,12 @@ conveyed in the error returns from file operations. E.g.
 	# cat info/last_cmd_status
 	mask f7 has non-consecutive 1-bits
 
+The top level of the "info" directory also has a "moveable_mon_group"
+file, which reports whether a MON group can be moved to the
+"mon_groups" directory of another CTRL_MON group. It reads 1 if the
+move is supported, and 0 if the move would impact the monitoring data
+and fails with -EOPNOTSUPP.
+
 Resource alloc and monitor groups
 =================================
 
@@ -553,8 +559,9 @@ Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
 without impacting its monitoring data or assigned tasks. This operation is
 not allowed for MON groups which monitor CPUs, or when the monitoring data
-or assigned tasks would be impacted. No other move operation is currently
-allowed other than simply renaming a CTRL_MON or MON group.
+or assigned tasks would be impacted, which "info/moveable_mon_group"
+reports. No other move operation is currently allowed other than simply
+renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 2dfb3b54338a..a3362f8ad13b 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1200,6 +1200,22 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int rdt_moveable_mon_group_show(struct kernfs_open_file *of,
+				       struct seq_file *seq, void *v)
+{
+	/*
+	 * Moving a MON group to another CTRL_MON group keeps its RMID but
+	 * changes its CLOSID. Where the RMID index depends on the CLOSID,
+	 * the RMID index changes with the CLOSID and the move is rejected.
+	 */
+	bool fixed = IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
+		     resctrl_arch_alloc_capable();
+
+	seq_printf(seq, "%u\n", !fixed);
+
+	return 0;
+}
+
 static int rdt_mon_features_show(struct kernfs_open_file *of,
 				 struct seq_file *seq, void *v)
 {
@@ -1975,6 +1991,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_last_cmd_status_show,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
+	{
+		.name		= "moveable_mon_group",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdt_moveable_mon_group_show,
+		.fflags		= RFTYPE_TOP_INFO,
+	},
 	{
 		.name		= "mbm_assign_on_mkdir",
 		.mode		= 0644,
-- 
2.34.1


