Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45A60A6F41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4b+yAiB+;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RDi9sqvQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=; b=4b+yAiB+O/JEqcrg6XX6WgFozI
	IwOUUlk2ySIraeNA+rnVLOvmnNGaxtue/En3PTKl2A5FX+vsh0YnwZdRBqUygynr2T5tzZF4YVIMn
	QHRfpcuIM7ZRV23prl2RuqxRabrunDFDVKv0JYLOhvfj7cUQYNQHkIX4XCDFHXdroQUkLSeitS5nk
	hFL5UJFdy7tUvbBdhRHzocUt5aqduGkz4lrYlLbVWeF115w1nNLg7WccJl1A9Dl3GzWvZ6vjrpRb4
	VYx8rUSv0YVaHYIgeRFK5UselRi4XxMRXUK85YCr0LYZqGR/Qw37UglPkofxijdMWCQsGzWdXSiYt
	q4kW22Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJH-00000002VOJ-1wl0;
	Mon, 16 Nov 2026 12:59:47 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJ8-00000002VEo-2kWj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=;
	b=RDi9sqvQcqUUiXoJvYPkjsWO3kL7JyvV/wAgS2GQ4J7Kxr4nmZZQYZahupS82jwtpiewQV9/q
	7vDwE3uxIQeHUF/yqp0k9IJcCmDectsntLoK6cAMnyVj7FnLCJFkIJaI1b9OoZv5ID4eP7O+fWq
	rAcoKrXBIimdTsdw4quHXxY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxk4SHvz1prKT;
	Mon, 16 Nov 2026 20:59:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BB6640679;
	Mon, 16 Nov 2026 20:59:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:33 +0800
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
Subject: [RFC PATCH v3 04/19] resctrl: Remove the L3 monitor event names
Date: Mon, 16 Nov 2026 20:58:59 +0800
Message-ID: <20261116125914.498841-5-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261116_045938_954190_85E70E8C 
X-CRM114-Status: UNSURE (   7.71  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every user has moved to the resource-agnostic monitor
event names. So remove the old ones.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/resctrl_types.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 8679cbe589ec..d0e56de038f0 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -71,10 +71,4 @@ enum resctrl_event_id {
 #define QOS_NUM_MBM_EVENTS	(QOS_MBM_LOCAL_EVENT_ID - QOS_MBM_TOTAL_EVENT_ID + 1)
 #define MBM_STATE_IDX(evt)	((evt) - QOS_MBM_TOTAL_EVENT_ID)
 
-/* Old names, kept until every architecture has been converted. */
-#define QOS_L3_OCCUP_EVENT_ID		QOS_OCCUP_EVENT_ID
-#define QOS_L3_MBM_TOTAL_EVENT_ID	QOS_MBM_TOTAL_EVENT_ID
-#define QOS_L3_MBM_LOCAL_EVENT_ID	QOS_MBM_LOCAL_EVENT_ID
-#define QOS_NUM_L3_MBM_EVENTS		QOS_NUM_MBM_EVENTS
-
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1


