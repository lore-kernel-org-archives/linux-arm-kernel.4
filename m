Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCDF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llszObZV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Op4H5TOV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mgbfeuq/xgidEkDD5o0IBk/6YCU6OhVBNmaVODqbeKc=; b=llszObZVo/nhlE
	AlMP+V1afFdj/rbzoRg2w2CW75hdRlyvBh0/87uEvhLPnt/AnQWKpgmiwjgg2WjgIBC/LWgxx/aXW
	fO5x/U3wDVcOfISYtiH0Sa0UGBPJG8/MN6k2kjBeb7lZfCmcDJE1CFJ5s9zvtwoWEJ8OsW8vy9fqV
	NhO65sW1p2zkWej+gT71eR1Au6ax0WMeFdoje4oNLgLuwDrvtCYbC9sHYe9wYgDC6FQW5QzUQPXJK
	m8C/IAbWhfLMjGFg4cR5abaNEXYd/9INd/dzPA4pMMEze/7AkstH6/9yJ7QE50wEaJzW3W6mgSKEU
	tKCSFLxcZeLCSjMQ0Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsr-00000002Mfi-1C3a;
	Mon, 16 Nov 2026 12:32:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsj-00000002MbQ-0n4n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EF61A25;
	Mon, 16 Nov 2026 04:32:15 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9226C3F632;
	Mon, 16 Nov 2026 04:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794832338; bh=41qx1n/Bz2MPufwYho2JV7zrCW9+nk5uF24gI+UcA9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Op4H5TOVJzUKY5+u4AQ+7Ks2uPMWoB3GcYlfQRuFnkUDrCgzZi8Tn7EafMIuZf9cG
	 odmMAprqTlc9dgiVKbLGIsY2NKatT8h4OcmwpVn4K3uTMOKTw8XD9Hr7bSFY/5gWv7
	 VirHqLb0eCHPRFC7vmXTgWbbty/49Q8DEsAHlERo=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
Date: Mon, 16 Nov 2026 12:31:52 +0000
Message-Id: <20261116123153.2672631-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116123153.2672631-1-philip.radford@arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043221_327391_3EFF8B60 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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

Replace switch by setting scmi_shmem_io_ops to use default and only
changing if reg-io-width read suceeds and has a width of 4.

Fixes: 2cd7f3db25fe ("firmware: arm_scmi: Support 'reg-io-width' property for shared memory")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/bug/linux-dd042f6f-0b76-40b8-9435-cbc53370cd08
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/shmem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm_scmi/shmem.c
index dadb37557f8a..8a4557a1e5c2 100644
--- a/drivers/firmware/arm_scmi/shmem.c
+++ b/drivers/firmware/arm_scmi/shmem.c
@@ -234,16 +234,11 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 		dev_err(dev, "failed to ioremap SCMI %s shared memory\n", desc);
 		return IOMEM_ERR_PTR(-EADDRNOTAVAIL);
 	}
+	*ops = &shmem_io_ops_default;
 
-	of_property_read_u32(shmem, "reg-io-width", &reg_io_width);
-	switch (reg_io_width) {
-	case 4:
+	if (!of_property_read_u32(shmem, "reg-io-width", &reg_io_width) &&
+	    reg_io_width == 4)
 		*ops = &shmem_io_ops32;
-		break;
-	default:
-		*ops = &shmem_io_ops_default;
-		break;
-	}
 
 	return addr;
 }
-- 
2.34.1


