Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D5F606A768
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KSr1b0wf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/ot4RQm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1D2OMakjENy2CCg5zoH16kIpqUwoSYvl8dD8pwUKqpo=; b=KSr1b0wfSJ2e3I
	QcvPr7mwrFlQ4S9GPyac08jmh/0yQtnNwVy+uhrcC7D3TvPYsqr70kK1mlaEj8DCj881Fqh32IUgi
	LkGDUJSGfnDf/r40XA5iTzaOc8Q+AEPzo3uGiHU+nvt9YiuixvyLpU4cIwdPo576UvLSjxRZ/YyCn
	KBEQQnvGI7fJagli+fpJdfs9IGNJLwyu1t+BpFEPoF9j2GcRW6B+tJ4mRxF1C8tTFNhrZiEWi7lEj
	IsiTRKqcLUbmYw/B7UZGq7z+K/uGjhe2UmOAiIl5nnC5QAI/EEZJs+/RY1t24lPnaxhd82wt3tT8l
	gfAa4hDt2pMDwY/bWLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlnl-000000042EL-2wOZ;
	Tue, 10 Nov 2026 13:22:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlnj-000000042D9-2ndO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:22:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e940d5d2beso7563515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316935; x=1794921735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1D2OMakjENy2CCg5zoH16kIpqUwoSYvl8dD8pwUKqpo=;
        b=B/ot4RQm83MEeOdp2KVvyehTWmrZAk+E1KFv5hg0wzfoJOgR+g6GeG+iYqJe+YkpaI
         KghMg6Dq13t4Sq3PA8K0A1stOWg+AmbXblWtZ1B6Jg+YY4ft3nfEqdk0GaklRfpMHSob
         0y6+o+FiyM0mddrtLFJVlwW8eoVVYjU0zL8X7woG2DC9RbRnVYMn6ZbmOiiE3mdA8Gtx
         KGSuZHeVTNbKyJ+FvSNuGnXn1gKXhxeQAxpPN5PS39fwhLu4LRS4KvYB1SxTApFaMy2W
         q6Ab3H0hihAljVCydGVRSSYnsP6dLdmUyeE/zPtHcjCifd0J4l9oXSr5CJO3H1FDsOo+
         XNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316935; x=1794921735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1D2OMakjENy2CCg5zoH16kIpqUwoSYvl8dD8pwUKqpo=;
        b=UaznJGhLfY68+IVv2WHxW3ugVzMMuGT3gwaDKkwRxSyg1tzzIXqq4PobW+rfhGjA6F
         X8hM4q7pUdEowftA5kMAuQTH8HkCuzXXvsAceJPkkXvn/ejHBN5RCQbbeQWl/ax48QFr
         LQJ6/s/2osDUAphFGds2d3G/IJS2032o5OV4pPsMBv+yiYkHXMJB3uKf9HIbms9skxKh
         Tk7tJZ4mqnKYGtzo1lMrGBnMJ4Z08s8lGP6lwilz9III9YQJc+a/9fV8DHBpvy0InLva
         xdxrVgn6bfGil1F7toAyZyv9UOFjeEJ6Pr0jVhH4az7uJi+skKDUBrtivWgbCeJCrSkP
         LceQ==
X-Forwarded-Encrypted: i=1; AL+hErEHmCaNpEOdVGC2mSomZ5mk1ilZf7Npx5iMfGuSgaq6TBCLZXpeBwO6sQ+wasivm7wnJ4BAkllZPczh3/a+0ryd@lists.infradead.org
X-Gm-Message-State: APuU4Z++zsin/eVY6qijRDy/wlDwccbqm/3VwTq4lLNTY5A20H/COGs3
	oQWzNG2ZMw42dA8XXf3UMFdogb77wyeGytgRAe9id1AOhuBP+zA4HuFj
X-Gm-Gg: AYBFou3BQ8VL4qPdOlVeeNsoUZoMlJyz1OV5Aa74I/T7lzI9Gh1C1InuMA9f2QaPr0s
	e3Tw+zc05pMzZ5nbiVkc/n5nAp6bHC2WQBZ2fJmEJiNFqSTyOxA/ZVSGF1/uNu/BKzXYznJTVMX
	r/xzbAa/33K0qtxnG67efks3XHarimWSbJk2Wau1Fc6mS2amtWkh+gE1HvpIHu61qbw6E0TcOc1
	HVetghkL5r8QwGfE303vcYDfMSPx1CULRHRqYC4npb5o39eUmXxlTBlJovrWTvNd1lzGlLXLBsr
	AyW17umWJpQxwyoSYA2AmQRQoj1gRwssiyO1PkyBKLrj3r6IlyLa/5byfdXZDSDpQXh9loGn8KZ
	LFexZ3iTbC/DVGIvJ15+7h+F4bAm0G3Ot+lJgt6Bu+aIKI78UBjcXU2exSxnRwvRIFEuS6/FANe
	W4k/ecoIByCAs3v+ORBpFn11KxXHOx68g3V1aXDfSPfFPw0EhUCImyCKgotg3xd2Q7zsfnoQTQb
	PGPLL0S+rqD+LpFYeyU9LSDGcQsdAPZJOtZey/AH1ZtunXmWpSxxRxBNIs5jllJNWyc2PvYP0zV
	tFeN/e4BDzWvCOCPZFP73YfuwxDIfn/g/iNak5mWzFgDzEr17YRNAhbS+H9cA2Q=
X-Received: by 2002:a17:902:ea03:b0:2e9:7dda:bfc7 with SMTP id d9443c01a7336-2edb932f59bmr23584575ad.66.1794316934806;
        Tue, 10 Nov 2026 05:22:14 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:14 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 7/7] fs/resctrl: Add info/moveable_mon_group
Date: Tue, 10 Nov 2026 21:20:54 +0800
Message-ID: <20261110132054.3702-8-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052215_712276_FAF613EB 
X-CRM114-Status: GOOD (  19.04  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jinjie Ruan <ruanjinjie@huawei.com>

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
2.43.0


