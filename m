Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70C3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pcc+Y9zJ;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=enaC4ze2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RJkBieSQOuKW201Esz2nbY5TuThXbohwekU+5kyjExQ=; b=pcc+Y9zJmRVqWh9PTBMgZAjUEA
	RchnT/39zH+Q02ICEfoRfvVajjBvnn8oreuw+KwlaC4fj/mnA+xeO2zNiarOChvE6DeuSREj42db5
	f6e5jxHQsVeY0zD1bYcuJ+UXj+q4z8kWQYSQ8NTS5a7+IKAOJkTYWaZnpCpTm4XUSZtrzbuXaxk70
	l/JgTXYayWJ8NGgxaqI0rNnkUA290GPP1PGZiugHoSs4RVpUjJApucqjHsCxW4AFrQHKmGuLrIDqT
	RUUtDEc3NVISLzqzdzzUiFaDP53hPF/kpXoEmUT7Fl3uZc0dzXwSyhzczQZEywPW8KyRr9gR3YHQx
	xEUNtG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdxH-00000008jDq-3jtL;
	Wed, 18 Nov 2026 11:35:59 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdx6-00000008jAP-3Z7e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:35:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RJkBieSQOuKW201Esz2nbY5TuThXbohwekU+5kyjExQ=;
	b=enaC4ze2wnB7QXaCwsr6uQmdExen2ZpkpBc/c+MZgl1xgta4AhfRa+RfwOJt++DZvMXhVqAGm
	oVwU1dUt3NWPpMMigzYdGU8nzsz+SW7HMB6MN2MX2t4UUeaTehKDpkDuEOBZ5yc74L6XuObr7S1
	7ZrmhWsKlFkU/6zNsia/qLQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jTzzs5HRPz1cyT5;
	Wed, 18 Nov 2026 19:35:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A1A174057A;
	Wed, 18 Nov 2026 19:35:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:35:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<tan.shaopeng@jp.fujitsu.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 0/3] arm_mpam: resctrl: Fix several CDP bugs
Date: Wed, 18 Nov 2026 19:35:29 +0800
Message-ID: <20261118113532.638039-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_033549_435469_F3417489 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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

Fix several mpam CDP bugs found by testing and AI review.

Changes in v5:
- Add Reviewed-by.
- Rmove alloc_capable check when switch cdp.
- Remove the unnecessary stable version.
- Simplfify the commit message.
- v4: https://lore.kernel.org/all/?q=arm_mpam%3A+resctrl%3A+Fix+several+CDP+bugs

Changes in v4:
- Only enable CDP on a resource that supports it (Ben)
- Limit num_rmids to the CLOSIDs in use with a simplified fix (Ben)
- v3: https://lore.kernel.org/all/20261106081923.2333070-1-ruanjinjie@huawei.com/

Jinjie Ruan (3):
  arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
  arm_mpam: resctrl: Only enable CDP on a resource that supports it
  arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use

 drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

-- 
2.34.1


