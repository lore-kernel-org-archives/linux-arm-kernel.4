Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C04606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SEXl3Wwn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3LPJ2HrlKN7oBMUZEavDpBpJi9yr4o7ZrCUYt7Dpr8Q=; b=SEXl3WwnPaHy3q0EkqXPBE1Hvs
	p+RzxdLKtj30/0kYVbdfpdZ2BUpVLww9FErblVq/tXKAESlsAiSp3On1xyO+YOq/MI8oIdW5nQPAq
	DjJhva5o9LZXos+ltBriC/vbQP/hYhtjJJV7LsTaNZ5YbUlJon4cS8kKfoK2K6JkidQQfzCNikgfP
	RgS/+YDNiiN0Tiekw8nSXuSz9Z0gPlItKBwNyjMFaJZhxttBZgEIwNAMYpougIqCEYT627fWodLE9
	prmXsFc7feE7jLTU7ulBjzUd4vAZDy8PoGyNbS/zwl//ty5gp66ZnGuPHgewIT40CL0DQlGm5q5Ld
	iGOrx7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO0j-00000000ak4-0my2;
	Mon, 09 Nov 2026 11:58:05 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO0b-00000000aiM-3Bmq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:58:04 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 9 Nov
 2026 19:57:48 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 9 Nov 2026 19:57:48 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 9 Nov 2026 19:57:44 +0800
Subject: [PATCH] PCI: aspeed: Drop PROBE_PREFER_ASYNCHRONOUS to fix
 enumeration race
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-aspeed-pcie-sync-probe-v1-1-71cc9e718623@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIADe18WoC/x3MQQqAIBBG4avErBvIgsCuEi1Mf2s2Jg5EEd09a
 fkt3ntIUQRKU/NQwSkqR6owbUN+d2kDS6imvutHYzrLTjMQOHsB650853Ks4OhMsCPWwcNSjXN
 BlOsfz8v7fi+WRZZoAAAA
X-Change-ID: 20261109-aspeed-pcie-sync-probe-fa1d96eb3ce9
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, "Billy
 Tsai" <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Jacky Chou" <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794225468; l=1635;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=s6Law+1V/WSTB0M0wQ+df/1sBAiY3koHL3kisdnpil8=;
 b=LUMFJRsfpnYqDcQzTsKxiRuUo3UGu9RdRs4M0DD8r19Mo94UXrSlUGkK4aZ/qKCDzkk8T4S2+
 QRj93BW4SwtADPkEpcmNMfvJwqPuLiA0vtNXhKM0+cEhtqH8E2JXCYn
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_035757_810087_B0C919CA 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -1.9 (-)
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ASPEED PCIe RC driver opts in to asynchronous probing via
PROBE_PREFER_ASYNCHRONOUS. This allows the driver core to probe it
on a kthread in parallel with other drivers instead of waiting for
it to finish during the synchronous probe pass.

On boards where a PCIe endpoint driver is bound early (e.g. built
into the kernel or probed from an initcall that runs before late_
initcall), this races against the RC driver: the EP driver can start
probing before the RC driver has finished enumerating the bus, so the
EP device is not yet present and the EP driver fails to bind.

Remove PROBE_PREFER_ASYNCHRONOUS so the RC driver probes
synchronously again, guaranteeing that bus enumeration completes
before any downstream EP driver's probe() runs.

Fixes: 9aa0cb68fcc1 ("PCI: aspeed: Add ASPEED PCIe RC driver")
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/pci/controller/pcie-aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
index ecb7562f84c0..def5591010ca 100644
--- a/drivers/pci/controller/pcie-aspeed.c
+++ b/drivers/pci/controller/pcie-aspeed.c
@@ -1104,7 +1104,6 @@ static struct platform_driver aspeed_pcie_driver = {
 		.name = "aspeed-pcie",
 		.of_match_table = aspeed_pcie_of_match,
 		.suppress_bind_attrs = true,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = aspeed_pcie_probe,
 };

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-aspeed-pcie-sync-probe-fa1d96eb3ce9

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


