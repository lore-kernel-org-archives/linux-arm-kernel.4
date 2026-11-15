Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF93606A8BF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhDBwbOS;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=EErrNkKM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oi51xaTG/HK0Yfo+7f/VbT3aH6dKHxeareUfdsGr6Fw=; b=WhDBwbOSwAerP/14iESxfZEXJK
	FE6WK5wWIjNg2IFVqzbPYB3siZMeIVHzeUgwfQcfOXC3+xyTajbEyyehOofeIb5bPZf+T9xhTJ5Si
	8vFD1dwJ2igJiE981ngsdzEaNhgHZqa2kI5hMqZAnCs6eTpyaZS7ejU84BKfQ5FCv0+xtElWzFjFi
	0snsHAE+2Jxbcx+egK2gwVDKKt8bWP8FzVeB9CBeTLoCuKTjO+GYgfbfeUyOgumqua3aSnMFQ7TMy
	3qwvCqqjhO2Yjeltzb/1oBCfn9ZfpJw5kG6YLp1G1ApgheLGPEs25cRNFe0B6c4CPn8GW3S8rnHYf
	Yr6s9aNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYiK-0000000HTos-1IcB;
	Sun, 15 Nov 2026 11:48:04 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYiG-0000000HTmZ-2XN9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:48:03 +0000
Received: from [192.168.17.1] (unknown [124.79.98.159])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54b7e04dd;
	Sun, 15 Nov 2026 19:47:50 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?b?V2lsY3p56ZG55Y27a2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH v2] PCI: apple: Prevent module unloading without IRQ teardown
Date: Sun, 15 Nov 2026 19:47:48 +0800
Message-ID: <179474326811.103840.15695658964160156282@seu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1df08fd1c03a1kunmbac61c98bf77e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGRhNVh1DSUsdSxodGk5PSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSU9VTEJVQkNVSk5CWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	JKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=EErrNkKM3bnude6pCFUBL9amXrTOPNrhxd6SCA0ewgEek6EvhfUarntmYQveXt7ckT5ElrNg60CEStL9uhOAOKfjMUJXNIMceZTlewS1lCIqfbsbmV7GjWHfHNKd+ONtCzvhdekiFv2bT0za3DOwEqZ9kEEb6YlNa12vK6xCaZM=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=oi51xaTG/HK0Yfo+7f/VbT3aH6dKHxeareUfdsGr6Fw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_034801_243889_EE079574 
X-CRM114-Status: GOOD (  10.68  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver suppresses userspace bind attributes but still registers
a module exit callback. Unloading it leaves the PCI hierarchy and
unmanaged IRQ domains and handlers referring to released resources
and unloaded driver code. Removing only the root bus does not make
the remaining IRQ state safe.

Register the driver without an exit callback so a normally loaded
module cannot be unloaded. This follows the maintainer's suggested
first step while complete controller removal remains unsupported.
Keep the tristate option, so loading the driver as a module remains
possible. This change addresses module unload, not dynamic removal
of the platform device or existing probe-error cleanup.

Found by the author's in-house static analysis tool.

Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
Cc: stable@vger.kernel.org
Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/87mrrj8ku6.wl-maz@kernel.org/
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>
---

Discovery: found by the author's in-house static analysis tool.

 drivers/pci/controller/pcie-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index dfd0e34..061742b 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -892,7 +892,7 @@ static struct platform_driver apple_pcie_driver = {
 		.suppress_bind_attrs	= true,
 	},
 };
-module_platform_driver(apple_pcie_driver);
+builtin_platform_driver(apple_pcie_driver);
 
 MODULE_DESCRIPTION("Apple PCIe host bridge driver");
 MODULE_LICENSE("GPL v2");
-- 
2.50.1.windows.1

