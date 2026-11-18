Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4C606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Al6zEzNc;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=J9u6jso8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fSgwhlmKyQGQwctHqc43zOlvjdBzMgAkGZ09qlZCKuI=; b=Al6zEzNc0ixhZPOcOP7KK/MQYl
	SmVAtwxYujohdaunwlM+J1oXHVDNxRXvH1hWTsULV3/dcO3cSxxIMm+1Hjb03NhxHcYP114/39J9z
	G9/UwA9kIquGQbeOW0TI0OXv90+0mOii3dnNg1foHvusk5beYnoWWZNhO3qyvRvtAIhFxeqqzMKCm
	kwdpGPXykvyxb4p2fMQJwz15fU2pRNZscJ+ogabGTSvqomnOWd0WAMbtTkuP8tRxGvVl0yxZcfmD0
	ReNtkI7GWpmEzMCNRZW+/Vw0k1pB8YPnevOoR0Xfp8a2jxtFtqLwhJRzM9gXop9m/QMpaFVsRR1MC
	7pUkg8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgeD-000000096e1-1HM6;
	Wed, 18 Nov 2026 14:28:29 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgeB-000000096ch-0cMa;
	Wed, 18 Nov 2026 14:28:28 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5526d7a04;
	Wed, 18 Nov 2026 22:28:22 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Yue Wang <yue.wang@Amlogic.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pci@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: meson: Fix potential use-after-free after PHY provider removal
Date: Wed, 18 Nov 2026 22:28:21 +0800
Message-ID: <20261118-324f82bd41-pci-meson-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ef0f076c03a1kunmfe1958691a169f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUhLVhlCGElJQxodSU5KGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=J9u6jso8uxOqF1ixoniwY6KndX5ryqPnNLKDGPlR9JGvTenW6T/GKKNor60TS/vnGbYxX0j8BNgeGR0r0YsTF++W2HC7PNfYDWjjjYnI/B3koqT04ZOX/BoSjjUBFpp6ZiFVZ7KtiIwTKzejsAanv1MECs2sJcjTwO+b9mE5ugY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=fSgwhlmKyQGQwctHqc43zOlvjdBzMgAkGZ09qlZCKuI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062827_443455_6F072825 
X-CRM114-Status: UNSURE (   8.16  )
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

The PHY reference keeps the PHY device alive, but not the provider
driver resources used by its callbacks. Without a managed dependency,
unbinding the provider first can leave meson_pcie_power_off() accessing
freed provider data during PCIe removal.

Add a managed link to the PHY provider so the PCIe controller is unbound
before the provider releases its resources.

This issue was found by our static analysis tool under development.
Fixes: 4b0dc84b2939 ("PCI: meson: Add missing remove callback")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/pci/controller/dwc/pci-meson.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 8559d132dcde..251673bc5963 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -401,6 +401,10 @@ static int meson_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(mp->phy);
 	}
 
+	if (!device_link_add(dev, mp->phy->dev.parent,
+			     DL_FLAG_AUTOREMOVE_CONSUMER))
+		return dev_err_probe(dev, -EINVAL, "failed to link PHY provider\n");
+
 	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(mp->reset_gpio)) {
 		dev_err(dev, "get reset gpio failed\n");

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


