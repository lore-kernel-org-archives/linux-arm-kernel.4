Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF322606A8B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLAJ5YMk;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=z8M2B9r2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pDpjt8VglQ59WLlsERaR/X2OODsiatxf33CQhvLzv1E=; b=rLAJ5YMkIzibDbfBR5hCpHgGNP
	qBxeIvqfi8EFqdtmqyP6++YmLuWI/4LE3DcBN8xzBsDC0qBC3Yfda6pRoM0p5Spz6pydiBrs4V42F
	OrU44x2nGwYFOcJGGzQcN+UIcItkp6c8VRfkSOH6sKEGrXKWyFBui7fhBuqeYLiJvVtITs9wGvcPn
	7eRieOeDz9mS9t3Dc74Rsso5CeNksLZgfTJfe5EUEwGRJerfQ8ZLCsRdJ946srnezAuJPyKkx3+rI
	CrSGTxl/PDqTgXS4JgysuAwgKM24+/nV4pQH+GFPf8m6ouLzL/YNCxkncoj09qesNBS06s+BXje5E
	VVvH8qIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcZ-00000009ycv-27bC;
	Thu, 12 Nov 2026 13:13:43 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcD-00000009ySd-428F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:13:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pDpjt8VglQ59WLlsERaR/X2OODsiatxf33CQhvLzv1E=;
	b=z8M2B9r2M2uLanCqzT0oLyqagHMgMPnWUSJkp6BvxC4lhfAVUoxh2fUmUnavLAsFgLC+oO2L0
	XinoAdPGlC+PwjzYVZTATB5IqLiB84CKlcyvD4lkwtuUDeS7+emizkoqYBTRjE++QCQdDvamb7I
	rt63m14fe+l79OAprDcWfno=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRN1PV1z1prlH;
	Thu, 12 Nov 2026 21:13:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C49D40579;
	Thu, 12 Nov 2026 21:13:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 3/9] fs/resctrl: Do not update bandwidth from a failed counter read
Date: Thu, 12 Nov 2026 21:12:48 +0800
Message-ID: <20261112131255.4043381-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051322_598932_81487C46 
X-CRM114-Status: GOOD (  15.16  )
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

Every second, mbm_update_one_event() reads a monitoring group's
counter and passes the result to mbm_bw_count(). When the read fails,
rmid_read::err is set but the value stays zero, and mbm_bw_count()
runs anyway. Subtracting the previous sample from zero wraps to a
huge bandwidth, and the controller moves the control the wrong way.

The read fails when the architecture reports the counter as
unavailable, and, with assignable counters, when the group has no
counter because the shared pool is exhausted.

Update the bandwidth only after a successful read. A failed read keeps
the previous bandwidth; the counter keeps accumulating, so the next
sample spans the failed interval and is larger. The controller steps
down once and recovers in the next round.

Fixes: 30442571ec81 ("x86/resctrl: Calculate bandwidth from the previous __mon_event_count() chunks")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # v6.1+
---
 fs/resctrl/monitor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f067329e92c6..49a4b4ce95d4 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -801,10 +801,11 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	__mon_event_count(rdtgrp, &rr);
 
 	/*
-	 * If the software controller is enabled, compute the
-	 * bandwidth for this event id.
+	 * If the software controller is enabled, compute the bandwidth for
+	 * this event id. Do not update it when the counter could not be read:
+	 * that would store a bogus zero sample as the previous bandwidth.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && !rr.err)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
-- 
2.34.1


