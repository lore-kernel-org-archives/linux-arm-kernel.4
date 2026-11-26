Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B89606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucd5AiWo;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tHz6dPBS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iqm3te1UR2ujnjZtMygIZQEOrWGGYyAcufMmQQvLEvY=; b=ucd5AiWoKked3DpMFfJY759gFm
	l733v2lAiWjuwWYBlDgyQBYaf5+4+3I8q/UCb2OrkOhykhckjq/jFjHF6SEo0qfGCUcqC2D82RLf9
	IGOIyt17GfhGtd4JhIdRL/e8Z0vVARv9ZYj4kKTc8Nx8rlOHNecy9Fm6vJ/FYUCuC4FncKOXVe/y9
	0qCCShqJ10uZ5Wu0pHJnVnBzVCDn4T4ZDzj963eHYZplhavXq5mb8yawIONIFlrpd0XYzyl08SK64
	yZY0BWBPED7XFsVDuKVcQC4rhCWgbJKTS4Ev6j4GcF7yFt19PAijLtIzd/BTjg6x5TX2ZB2H1SFIH
	Aiw/gHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1i-0000000DGDK-15Aj;
	Thu, 26 Nov 2026 12:56:38 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1Z-0000000DG3L-32Sm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:56:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iqm3te1UR2ujnjZtMygIZQEOrWGGYyAcufMmQQvLEvY=;
	b=tHz6dPBSXZcWMmdNq0vb658AsLd2eh6WDFBR0sEU9WnD0bYs30b6m30oQTLxToUoXbhI4+/dS
	+RSJJ9JtUy08yWHpcnG1/dI3g1ygaoW8E0iGLn75shERLSn2MiMlO8y+yhxojRgdOQO5Aa5V2ky
	UHAsatQM0npFBt97LqL+2xY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jZxP72ssTzRhQT;
	Thu, 26 Nov 2026 20:55:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B9CF540575;
	Thu, 26 Nov 2026 20:56:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 20:56:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 0/2] arm_mpam: Save and restore the MSC state across system sleep
Date: Thu, 26 Nov 2026 20:56:05 +0800
Message-ID: <20261126125607.2304487-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_045631_437144_77D52BB3 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

The arm_mpam driver only saves and restores an MSC's state from its
CPU hotplug callbacks, which never run for the MSCs reachable from
the CPU that suspends the system, so the configuration and bandwidth
counters are lost across suspend-to-RAM and hibernation.

Add system sleep callbacks that save and restore the state while the
MSC is still accessible, and stop the unfrozen resctrl workers from
touching a suspended MSC.

The first patch rework the CPU hotplug path, and the second one fix
this problem.

Changes in RFC v2:
- Also mention hibernate (Ben).
- Extract the mpam_msc_power_on/off() helpers first to make it
  more cleaer.
- Fix AI review issue [1].
- Add fix tag.
- RFC v1: https://lore.kernel.org/all/20261124082708.1705024-1-ruanjinjie@huawei.com/

[1]: https://sashiko.dev/#/patchset/20261124082708.1705024-1-ruanjinjie%40huawei.com

Jinjie Ruan (2):
  arm_mpam: Factor out the MSC power on and off helpers
  arm_mpam: Save and restore the MSC state across system sleep

 drivers/resctrl/mpam_devices.c  | 130 +++++++++++++++++++++++++-------
 drivers/resctrl/mpam_internal.h |   7 ++
 2 files changed, 111 insertions(+), 26 deletions(-)

-- 
2.34.1


