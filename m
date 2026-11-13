Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6181606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kss9TjeQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dvmaVJtd;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PmajVDeD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P041H6z1vzHatZCrDx9Oq3C51UiEWBIWHceYiGp/3Yo=; b=Kss9TjeQtso4QXqjJ7Lxv8PLpM
	VUk2L42Ri95D3tPXC9/T1UsWehnpMQYZFdUvijX3aGJo9K+J+eqE2wzyPznhQcpRJPUfNS6Rfs7/a
	+mR2QnY41h3PCAjeeSsF6kFUd7mfVyyKDqb7c8KwhiJIZenINfPply4g9iNc8sNSF17LrBmBRQvmV
	KJaPdx2L/6CD853K8h/1sJZJs7BlvQSvgiBDTMzefT1Mi9555vCByGoAcdqX9jwAMP5Kz48xsr/pl
	c7yvX3HQNC/S1WNlPo/jCHWNqG/8fJ8BRC8sC62rMExYrYVWZ3Nm8DMfxs0+1JSz/Ws/mtc0QzLxB
	z+AN2LBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRml5-0000000C4wG-09Q4;
	Fri, 13 Nov 2026 08:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRml4-0000000C4vo-1WME
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 08:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=P041H6z1vzHatZCrDx9Oq3C51UiEWBIWHceYiGp/3Yo=; b=dvmaVJtd0Off7ne4LPtEnfegpT
	/zvOWgO/FolD6Z4ziVuY+Znq/sGgrEfU2x6K8w+OT6TrzzuxeRLrmvDzLqtMeBFlJ2T38PhYO0xpD
	VrqTq22Fp5uq5SpzB19qqAz24BatupTrI1bQtiPi5j6ptW9RqYNYDFjPVIBS5US+spNsGpCs8exo9
	7yEcfaPRulSPEpS6cNUAkdDIfwmoZPEGw4fnwMeLChVkB4MhZbl0HmgDbJBfsLYKkjjBLjmmNl0fK
	3dHzH0iAmehDHIUs9m6VZ6Z90LfZB+nl20S5GtNU1mxRJC79BCB93vG+XMZ3mhaVPX/rlCh0IZ4Pw
	GoTkT+bg==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRml1-0000000B4cv-0dbg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:35:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P041H6z1vzHatZCrDx9Oq3C51UiEWBIWHceYiGp/3Yo=;
	b=PmajVDeDmzyjLDIgPuLZlhfihSY4EZlzpBr00bO9xeepo6A+cePsGPqsS/lsPSy2amQ9VyAYY
	WaWcspIfdqd8IBRhV+mACUgy/7yYG7RC7CQRd/goL6HJ4dXcWZ9jE263Cldg1O7mqo7uwvEp8u7
	BkVboGZogokjSG4NI41z2XQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jQrDG3T94z1prR6;
	Fri, 13 Nov 2026 16:35:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6091A40575;
	Fri, 13 Nov 2026 16:35:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:35:19 +0800
From: tizi4590 <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <will@kernel.org>, <jic23@kernel.org>,
	<gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2]  fs/resctrl: Fix two counter ID bugs.
Date: Fri, 13 Nov 2026 16:35:04 +0800
Message-ID: <20261113083506.4129060-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083539_390596_B74E899A 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

Use the domain's counter ID for arm mpam driver, and give a monitor
domain the counters the groups already use

Changes in v2:
- Fix the mpam bug in mpam_resctrl.c.
- Link to v1: https://lore.kernel.org/all/20261106094537.2337188-1-ruanjinjie@huawei.com/

Jinjie Ruan (2):
  arm_mpam: resctrl: Use the domain's counter ID
  fs/resctrl: Give a monitor domain the counters the groups already use

 drivers/resctrl/mpam_internal.h |  15 ---
 drivers/resctrl/mpam_resctrl.c  | 195 ++++++++++++--------------------
 fs/resctrl/internal.h           |   2 +
 fs/resctrl/monitor.c            | 121 +++++++++++++++++++-
 fs/resctrl/rdtgroup.c           |   4 +
 5 files changed, 196 insertions(+), 141 deletions(-)

-- 
2.34.1


