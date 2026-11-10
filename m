Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA71606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QxJh7wkU;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cAMdEG9P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=StTeopdbwWMEf6YkIRSVtERljPRHgySRJO5GAvUKmY4=; b=QxJh7wkUOArGTSDgFphO0pvEyw
	Bv4Sa4s33wx9r80+p6mcMQE9+k0qRFX/ctl3R8Euguv4K+taX3IlV6b2I1M4JULmxIIWmSFrtGc8K
	0ukmTD82qiKFT6bKUsEnUr1560w145Zf/W8+2rIJE35Wp4P7VScM2lhVIWVLabrWLE5ZyzjYibBXC
	rCSPkzmnfz1SaCFGQOANWpdrTzEAe3kMbHXK2M9M1/iSVcFNHF4xzTE4lOxiurG4+X4WzcRgUmy/d
	SFJ/+uJiug2LwOlJPxSdzI4Oa50Gm+llg/Wpi85pGWTpS3Z7Wc5Bmfv5ffXfKrQUMTjcxeTj9kQeW
	OuUz03Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm5H-000000045at-2n7W;
	Tue, 10 Nov 2026 13:40:23 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm51-000000045Ro-1CIn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:40:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=StTeopdbwWMEf6YkIRSVtERljPRHgySRJO5GAvUKmY4=;
	b=cAMdEG9PWSy8VraqdQeEi3KPpNVHXUndXFxyNoac7PkIJEWvTy5sBXsR1gb6HUBruWF7gaIED
	OOjtYTMYrXAVk9OLtMEsq2UArySS/TKniuXwZZCmpYvuLjs9aZ58wleMvOZCvgzjH7gvHi+FN6n
	tSrpiz0DdJHc9HkRm7b7D2I=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jP76j1kwPzpSwS;
	Tue, 10 Nov 2026 21:39:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3773E40575;
	Tue, 10 Nov 2026 21:40:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:00 +0800
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
Subject: [PATCH v5 RESEND 0/7] fs/resctrl: Fix some resctl bugs related to mpam
Date: Tue, 10 Nov 2026 21:39:31 +0800
Message-ID: <20261110133938.3768632-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054008_284791_86B390DE 
X-CRM114-Status: GOOD (  10.01  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

And do not allow monitor group move when the RMID index changes.

These fixes are split out of the v10 Narrow-PARTID series below.
	https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

v5 -> v5 RESEND:
- resend because of email problem.

Changes in v5:
- Update and split the patch as Reinette and Ben suggested.
- Adjust the commit message.
- Add Reviewed-by.
- Link to v4:
  - https://lore.kernel.org/all/20261105070934.2258613-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Jinjie Ruan (6):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Clear the CDP state after the cleanup
  fs/resctrl: Stop the limbo handler while resctrl is unmounted
  fs/resctrl: Release the limbo RMIDs when the CDP state changes
  fs/resctrl: Add info/moveable_mon_group

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |  15 ++-
 arch/x86/include/asm/resctrl.h        |   6 +
 drivers/resctrl/mpam_resctrl.c        |   9 ++
 fs/resctrl/internal.h                 |   3 +-
 fs/resctrl/monitor.c                  | 151 ++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 |  50 ++++++++-
 include/linux/arm_mpam.h              |   1 +
 7 files changed, 196 insertions(+), 39 deletions(-)

-- 
2.34.1


