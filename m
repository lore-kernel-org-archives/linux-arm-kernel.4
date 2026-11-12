Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91367606A8B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FmuOAnsZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+WoTq18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ipMr5JfCKk6c0G9yIX+GL1qPB9w1TF1OQ3mRwjAjkuY=; b=FmuOAnsZ0Hm+pw0at9t3krUJAZ
	v+xWNkrdC5OPPqKuyYAAWzZN4/7jyFgj/ZaP+AYDRaQ1LyxCwXaiMDDj6tBK+zyi9stdlIC+hx0sd
	h9huG2fiGAZcr1LNQufScIZKzBWvyoaQKx6IuBung1xw2Tn6gG0eQr7fkTFhXF5tpVZHNHgJIMr8v
	Sg3R2eGEaZNg5TQ5SzTYm6KGFr/XxasOXdQ1hs3nLl4NscRDyYecvVb77AHkVZNf/bOdYAbExY9a+
	daQ4OPdynOBDde8AzaYh9kfK/WcMVOE0N1Cae5oqEVVOXU2J5wa106LtFnEyDKLC6f2VRrlqSV3+b
	p3+UuNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZB4-0000000Aq9R-3hrc;
	Thu, 12 Nov 2026 18:05:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZB3-0000000Aq8q-19eS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:05:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4D654504B;
	Thu, 12 Nov 2026 18:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35D61F000C6;
	Thu, 12 Nov 2026 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794506736;
	bh=ipMr5JfCKk6c0G9yIX+GL1qPB9w1TF1OQ3mRwjAjkuY=;
	h=From:To:Cc:Subject:Date;
	b=P+WoTq18rw8fPYSyQBc8LeJTSl3Cc6iHNjxsVvmu/w0JGwLtCmx3lSPKAQzoGdE5C
	 Wccsd/tUxj8ATufemV6lder1dI/xzeykTB799TOPEyv7I4hdsjg6UAy04aXguWljpT
	 n45Rhp3GXxBIaeAdE521JDPKaOPZdjfvSKLT0G0eiFtf2ddvCLwOUrsDzVKifKieC4
	 g/6wXKXa1s5j6XJglA8DStf4ztTjeQErj0TrUK76nXAmtB+vyD4CThuUoH6t1Zylw7
	 anabnBv3HYL6H5yfniWZkUO9/16whtWEmDAj6jsbephPzoM9kajf1nDnqXeKXMfRn1
	 zsotANzyBHgFQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: arm: psci: Fix unused variable warning
Date: Thu, 12 Nov 2026 18:05:24 +0000
Message-ID: <20261112180524.45550-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Clang 23 and above complains with the below warning while building psci.c:

 | drivers/firmware/arm/psci/psci.c:81:13: warning: variable
 |     'psci_system_off2_hibernate_supported' set but not used [-Wunused-but-set-global]
 |     81 | static bool psci_system_off2_hibernate_supported;
 |        |             ^
 |  1 warning generated.

Fix it by applying the __maybe_unused annotation to the variable declaration.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611091729.V7epDaiS-lkp@intel.com/
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm/psci/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm/psci/psci.c b/drivers/firmware/arm/psci/psci.c
index e73bae6cb23a..01b1ea6a1c65 100644
--- a/drivers/firmware/arm/psci/psci.c
+++ b/drivers/firmware/arm/psci/psci.c
@@ -78,7 +78,7 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
 
 static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
-static bool psci_system_off2_hibernate_supported;
+static bool __maybe_unused psci_system_off2_hibernate_supported;
 
 static inline bool psci_has_ext_power_state(void)
 {

base-commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de
-- 
2.43.0


