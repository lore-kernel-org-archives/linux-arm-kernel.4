Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8034606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uj2WExpL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ueodn/f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=; b=uj2WExpLbufven
	3zq98Zga/Sd6QrGhSNzSEnOpmVEzxiIR3PVEhuI/14qA/0hLFABxEE6HaaHDAqxTaRJe3C17phIuj
	SJhXATa6a+hLWFl3E/pSWrBEKr4GtK/tuxA9HCRnDh81v6dXD8Rl0x1p2cGo7EBr62a5Fk8mX1/mq
	iyX/vENhWieQwyIlRayocSvyZE0SGCAdxR0b9rC5Tx3oA5bCbj8+CDcsks199KxXu8vg1xYKMIUGr
	cMBB4L9H1gPorFPwZJAsX6YERoSMeWJHhoNADjbqgvd9vdj+QRWWTHqNKNiWDyNiuDxUkd+Kkn3cc
	3k2ZaO47idDAM3+MZMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnJI-00000004IRw-2RQU;
	Tue, 10 Nov 2026 14:58:56 +0000
Received: from mail-oa2-x0b.google.com ([2607:f8b0:4864:30::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnJF-00000004IQU-2WGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:58:54 +0000
Received: by mail-oa2-x0b.google.com with SMTP id 586e51a60fabf-4a77fe1bc0bso927423fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322732; x=1794927532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
        b=Ueodn/f0fzy6nQ481SKzpOw1BnvqMav29EWjlEPpInQUjIqgwO00X6h0zdJsD0YS2p
         yLTeEPNaAIGVYGIvHfZowl/utheAdYDcmeXzt6SggaSx6d1wd5GYq1S7hd4PkyYfe52D
         MkAZFwnaU/PeVTxdRDSmaPwnQkVNFzZh4F3MPi9RqTnHDTWjPf68wRhwOM/ha3zUQNor
         Rqoflobo4gw/Tz7QXLWlmxFSVAze1cya9ft5TgQ0yrHqEDEyx6dzw6jVknHvltKqmMQU
         XExedd5hdDu5BWr2l9RIFNLDInbrd0fLmu8OXHsWmE2g74hnHCYS6WkMtNMWYlL2E0Dv
         mKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322732; x=1794927532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
        b=t+J/wZciGKj4VppMg1qZf1CbgoHvG3tFd4oK1yy2v7aygZomsImOI9DNc8HcUGBZR/
         smLfC334GdUBIftSANYAyOhB9Zy3qwFM+o9+0N9+lPPpR1vXm6py8SY9zFpcpYj0n7Lu
         B2KrVuIHUC7YZJAQ8b52zc0xjkZXLdeoyZ+xFmPFToh0ljW/UaZMDIk9cxdR/re5HdPv
         nZqO99NCiz7zroOATNHKyswcL4PaWjun98vhoKPbpP7GK6osrN0QO7ZaQcJHcz+R6y/V
         WUs6KghgpT16JHuqfCSZ8f008WtbdvdMAbxX1Ri68pFheYVGXNeOHNY4gPlYZImHx7kB
         Ym1g==
X-Forwarded-Encrypted: i=1; AL+hErFYTyaa5OJw7pEG3Pc9rkw5KUL9yQ+DJOe9maFioADqGx2B2rYiuuBgYJbsGAwD/KWHQT9eMLa6Y6ZbFyQesYcE@lists.infradead.org
X-Gm-Message-State: APuU4Z/9KCy5ZW9o+s37Naaki431HxLGgeB0dFkeSUUHGC3F+bzCnb/P
	IYeKJ7IgFLxil1WJ4WZuZhXqvi5VZNw4LMKCFP16zVAHGJhZ2hgTKqViZ6jgW0O5
X-Gm-Gg: AYBFou3VkBde2yu93jb+DwwFcPkNpMmNoZd0oTu6MPfIFrm6QCRTc/zbxjo6N1c+7Pq
	OoQA+fnIXfpsTUVpE4+79Vy7PnIcMvYI1ZZYqiDje9zdHS6uPlrGzLyacJ4cUTbW/tjLygr4Bfl
	Acy5E1KYfZEv5GnxTDMjenG0jS7SvawhZi0C3c/IybBmND+UOTvImrkkss+NFQXYLGUYi5+G7j3
	meEXakRYMX1m6YVYe1Y2J7dGAAZP0unWxhr3Y0kGl8OjPVseBT8vfKqkqNsqroEwHAn4/nkye9q
	r3gya+hvCqB/Ad3Dtewfo7Y+APYuiO+pZxKiqOjLaVyJDP/TcVtInuqaViyxeEI6mmr9LCrP9LR
	PhWwBtZ5JNWlef7MUH2stYw+OsILeJ6uli3IheXwRlhlexsg7yvmiRn32z/yb/o0SNA+Q3su3gh
	JFblVeoRiBbb2fiDnsXwipIwXfV4vzOMhL/BH3WilGlCE4sePssjrOirHy3YZJqna65qV6Jnx+z
	L0LmywYTv0jFceAvSb/8eB6sKrjaAmFKNPEb8x8/4exIezy7SSQ5bwXTQdMFwZsq5Ks9iWKZJ5G
	E5SOSn+1zDyXk2NyQszxGhKzHYbM72+ixzNXOc1XYZ9/LxclBMbcjnJjnoSPWqs=
X-Received: by 2002:a17:903:2a84:b0:2e9:ca71:45f4 with SMTP id d9443c01a7336-2edb91d4de7mr23669695ad.33.1794316927647;
        Tue, 10 Nov 2026 05:22:07 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:07 -0800 (PST)
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
Subject: [PATCH v5 6/7] fs/resctrl: Disallow monitor group move when the RMID index changes
Date: Tue, 10 Nov 2026 21:20:53 +0800
Message-ID: <20261110132054.3702-7-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065853_663093_D07E8F69 
X-CRM114-Status: GOOD (  28.02  )
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

From: Peter Newman <peternewman@google.com>

A MON group can be moved into the mon_groups directory of another
CTRL_MON group to move its tasks to that group's allocation while
keeping their monitoring data. Where the RMID is only meaningful
together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
extends the PARTID, the move changes the RMID index of the group. The
move succeeds, but:

- The group's monitoring data is reset. Its counters are identified by
  the CLOSID and RMID together, so after the move the group reads the
  counters of the new CLOSID instead of the ones its tasks used.

- The group uses an RMID index that was never allocated to it. When
  the group is removed, free_rmid() puts an RMID index of the new CLOSID
  into limbo without checking that the group owns it. If another group
  of that CLOSID holds the index, the limbo handler tests and frees an
  RMID that is still in use, while the RMID index allocated to the
  moved group is never freed.

- The tasks are not moved. mongrp_reparent() sets the new parent and
  CLOSID of the group before rdt_move_group_tasks() looks for the tasks
  to update, and the search then matches on the new CLOSID, which none
  of the tasks carries yet. The tasks keep the old CLOSID and the old
  CTRL_MON group's allocation, and the group does not count them.

Fixing the task move does not make the move work. The RMID index is the
hardware ID the counters count for, so a group whose CLOSID changes
cannot keep its monitoring data, and it would need a new RMID index
allocated for the new CLOSID, which fails when every RMID index of that
CLOSID is in use. The documentation promises that a move keeps the
monitoring data, so the move cannot be supported, as decided in the
thread at the Link tag.

Reject the move with -EOPNOTSUPP when it changes the RMID index of the
group, and document that a move is not allowed when the monitoring data
or assigned tasks would be impacted. Where the RMID does not depend on
the CLOSID, such as on x86, the move keeps the same RMID index and is
still allowed. Renaming a MON group within the same CTRL_MON group keeps
the CLOSID and is still allowed everywhere.

Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
Signed-off-by: Peter Newman <peternewman@google.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/
---
v5:
- Retitle as the RMID index changes, not the RMID, and a rename within
  the same CTRL_MON group is still allowed.
- Describe the RMID index that is freed without having been allocated,
  and why the move cannot be fixed instead of being rejected.
- Drop the parent and resctrl_arch_mon_capable() checks, which the RMID
  index comparison and the MON group check already cover.
- Use the resctrl.rst terms in the last_cmd_status message.
- Drop the stable version range and the Link tags the changelog did not
  refer to, and link the decision to reject the move instead.
- Link to v2: https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/
v2:
- Drop the Suggested-by tag.
- Describe the systems by whether the RMID depends on the CLOSID rather
  than by MPAM, in both the changelog and resctrl.rst.
- Explain that moving a monitor group is already broken on these systems
  because the tasks are not moved, so no existing user relies on it.
- v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
---
 Documentation/filesystems/resctrl.rst |  8 ++++----
 fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..fecb2cd2b343 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -551,10 +551,10 @@ will automatically remove all MON groups below it.
 
 Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
-without impacting its monitoring data or assigned tasks. This operation
-is not allowed for MON groups which monitor CPUs. No other move
-operation is currently allowed other than simply renaming a CTRL_MON or
-MON group.
+without impacting its monitoring data or assigned tasks. This operation is
+not allowed for MON groups which monitor CPUs, or when the monitoring data
+or assigned tasks would be impacted. No other move operation is currently
+allowed other than simply renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b702fe6dbbec..2dfb3b54338a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4403,6 +4403,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/*
+	 * Moving the group to another CTRL_MON group changes its CLOSID.
+	 * Where the RMID is only meaningful together with the CLOSID, this
+	 * changes the RMID index and the monitor state cannot follow the
+	 * move. A rename within the same CTRL_MON group keeps the index.
+	 */
+	if (resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
+	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
+		rdt_last_cmd_puts("Moving a MON group to a new CTRL_MON group is not supported\n");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
 	 * current parent CTRL_MON group and therefore cannot be assigned to
-- 
2.43.0


