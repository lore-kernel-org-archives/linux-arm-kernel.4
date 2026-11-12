Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CD606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vdEL97lT;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=UJrrNbB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J/c3tcoG7GcYlbXefXjlJeyx373M02Vm7zIx6yg8Deg=; b=vdEL97lTMb77aNLbhR54i/wskQ
	C++BflnLoWImGmVJ+Lff/OohjraMT8NgvBuM9UPKQlyWlUdr/T4RSpjlaapvY9WeuRMQclpc2NVWG
	S70AVbhMZAbrKzr8icz/MPqmYPjLCkYnwXjvnrNcn8do2tmfVM1rh6i504aRhAq/blfSlc729ic0q
	+mbIpr36a87IXkG+TmLXehslaZ8aLkZV5LnbU48vhaR5Qq2qKaZKkWq/WS4kn99jcaLmB8kTui8+1
	BoGP0xAzXN1385v0/A/7+xkXVLZ4wzkc/2QqGBaUE/sftQoglGncrtIE4L+GfTlX2eewJn7t04fH/
	XAhcpo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP41-00000008u4g-2t2H;
	Thu, 12 Nov 2026 07:17:41 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP3C-00000008tlj-3Isu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=UJrrNbB14wg/m8Kpw9Vk+uKbzi6OdjsQqKFH5X74DQnAaISJntdro5NE1XYedrJ+Bwum4JddsCeua
	 j51loo0aW2POMXCfAEaJsarb8UmeUhREj7+2nvP0NGPJLOXROeRb/+HSeOxf5MrGrqxVksEIppNyGc
	 pkcBDbh1PEO3rTrI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af567d6f73-abcbc;
	Thu, 12 Nov 2026 15:16:41 +0800 (CST)
X-RM-TRANSID: 2ee66af567d6f73-abcbc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af567d7bee-f710a;
	Thu, 12 Nov 2026 15:16:41 +0800 (CST)
X-RM-TRANSID: 2ee96af567d7bee-f710a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jassisinghbrar@gmail.com
Cc: michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] mailbox: zynqmp: Put the parent node after reading buffer resources
Date: Thu, 12 Nov 2026 15:16:40 +0800
Message-ID: <20261112071640.154439-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_231652_044698_CA693ED0 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

versal_ipi_setup() obtains a reference to the parent node to look up
the host message buffer resource, but never releases it. Each setup
leaks the reference, including when a subsequent buffer mapping fails.

The resource lookup copies the address and size into host_res. Drop
the node reference immediately after that lookup.

Fixes: 0ac39d85a741 ("mailbox: zynqmp: Enable Bufferless IPI usage on Versal-based SOC's")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 2b81bedf0653..0c175f0b048a 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -696,6 +696,7 @@ static int versal_ipi_setup(struct zynqmp_ipi_mbox *ipi_mbox,
 	mdev = &ipi_mbox->dev;
 
 	host_idx = zynqmp_ipi_mbox_get_buf_res(parent_node, "msg", &host_res);
+	of_node_put(parent_node);
 	remote_idx = zynqmp_ipi_mbox_get_buf_res(node, "msg", &remote_res);
 
 	/*
-- 
2.51.0




