Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0BB606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IivsJcC3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDJJ1utR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xpYnBnPeqsYWxfb4QGuaNrTB79jSdlLwUmQ1VbIDPSM=; b=IivsJcC3C2k60MSKtPPOxRqP2+
	pdVn3hSgXyBuJAPt0X39OhmMQ2wz97NB5v3jNQQg+6eZmTrNyLVAFVErSf7+u/OrYOJH0z4EmKWaJ
	DpAqu1zDEnUmG1yF1RO7/GXpwccBiumsexoTCKjC5dsi7OPwF6qZvhrKpGd1Lk7HCAdl+pK/zqsxx
	MnhIyPztV5ZiO3xX2fXDmAgVjxIe23V8E6Yn8vq6s7JJ+wn+M+z/r9hRv8L1NfBQhCLzBOPv32mGO
	F1JwYkd5C8+yoHzQNde7CwzjMYdJy+XSbVYnYxDicXC0wCH+ADEAZXqx813/Dl4GN+IaxnRZf62ez
	R5NAcNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZBH-0000000AqCG-174q;
	Thu, 12 Nov 2026 18:05:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZBF-0000000AqC0-2YjO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:05:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4940646268;
	Thu, 12 Nov 2026 18:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B40C1F000C4;
	Thu, 12 Nov 2026 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794506749;
	bh=xpYnBnPeqsYWxfb4QGuaNrTB79jSdlLwUmQ1VbIDPSM=;
	h=From:To:Cc:Subject:Date;
	b=GDJJ1utRfxkMArZ7wXcQS9RijOynlQzYpTpVDZiKzg6qrLK/rF7qCx2FZRRH24KXu
	 +TiDJ1LxHPxB19pw75y1UItvCcYghIsCOXVoNgUL8YvxuuYXnaAY2Y3emxaQSWseuX
	 xv21fUQQumsvrG9Mv1btZKgXNECUaTgLCykID7xHoLgm5qPXkrPtLup8EhRtorracI
	 xa8i2WSLhMjV9kqfICb88e3njfx6hkO7Y4xxljJa6kucdWHrvvWzpQo+/bBEpNX6Fi
	 xSoZMInmgKK/VsE9aJ/MH2lO2hK0xD3EvCU8vWzfT+Ug6HboZKeLBhZLm+YMRXQTtB
	 cRUVavy9JNa0w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: arm: smccc: Mark smccc_soc_id_{version,revision} as static
Date: Thu, 12 Nov 2026 18:05:43 +0000
Message-ID: <20261112180543.45606-1-sudeep.holla@kernel.org>
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

Sparse warns:

 | drivers/firmware/arm/smccc/smccc.c:21:21: sparse: sparse: symbol
 |		'smccc_soc_id_version' was not declared. Should it be static?
 | drivers/firmware/arm/smccc/smccc.c:22:21: sparse: sparse: symbol
 |		'smccc_soc_id_revision' was not declared. Should it be static?

Fix the same by declaring those variables as static.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611092008.peLqOBq7-lkp@intel.com/
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm/smccc/smccc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm/smccc/smccc.c b/drivers/firmware/arm/smccc/smccc.c
index 5dc768ac4143..5901ca28887e 100644
--- a/drivers/firmware/arm/smccc/smccc.c
+++ b/drivers/firmware/arm/smccc/smccc.c
@@ -18,8 +18,8 @@ static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
 
 bool __ro_after_init smccc_trng_available = false;
-s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
-s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
+static s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
+static s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
 
 void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
 {

base-commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de
-- 
2.43.0


