Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D960A3803
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VIARW37y;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=io3J3QGV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GU1rR6DOyFxE66mLliEw1hVk/Ddk8r/dNCEfmv4kUDw=; b=VIARW37yVtGuk/
	0N/sntq/3Lq1dTTG6wa13adju5KGPz/6R4TCuh+LubQrNbyoJUSYaUHMj1iCR5ubMQVQTN8/q685d
	bUBFRLYja0rjmaEDuozhd/E8Ew70WZ+V3+qJ8keFoPQ4pmbUtVggi5ulKkWslTop/9N8LSYwDSiNf
	+Ve57y3qLCXus56UNvuK27dWpzLQh+/GqiuR90aoBECUbVTmgACQPpMNa46CaWvOpaUWOnix6CP+9
	ibhr8EkYda6MV1AhrHmIyIFoS/4w0ItRItdGCl9l+1r40mctJAoM6dWjoCuN5y5tm3m2ZLj8kpZB8
	nKxnnBMkinko59uILlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiex-0000000ExGi-2pK8;
	Sat, 07 Nov 2026 15:48:51 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPieu-0000000ExEj-16h1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:48:50 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 8ae99b4b-17f8-4abd-a4bf-a9849e4dc355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066524;
	bh=yawQ4E02fUTwAlaYm0llbngJGLthGeeE2ZDGDd72jJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=io3J3QGVTIYcd5iHTXWWiotKzNwqsPL7uYyu7D1IMdBYJJAMV+EhCztkYdYGe7QWH
	 catJ/qhuTC8qWdOg0YlWVNMmDVL3MZRZXBBiTWcqcn70WuqICYYj2sA/18uoV/DRaJ
	 j2jMqznTaiGbSUL+VQx+9m6YZi0hcm+1u+l7Z6C4GIY8QIArMdVo8WW581UpoYb/eD
	 9zwdWGjBQkB7YJ3ca+25zqtf/3mPJfErPiOKopfkkN3lG7VxX89Dlfhc5yr3c8Ckq1
	 Sg0HA5pir6MWFOAoki8/hcQP62Hi+qNPVwnC+kNb5bznRbvGo5wyh2gmf2K0ijEW3L
	 OJI1Ut6QnhWSg==
To: Sven Peter <sven@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_bcm4377: treat only negative hci_register_dev() returns as errors
Date: Sat,  7 Nov 2026 16:48:38 +0100
Message-ID: <20261107154839.89941-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154839.89941-1-dev@deq.rocks>
References: <20261107154839.89941-1-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_074848_732773_6FD712AE 
X-CRM114-Status: GOOD (  11.32  )
X-Spam-Score: -2.8 (--)
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

If another controller already holds hci0, a USB Bluetooth dongle for
example, the BCM4377 is registered as hci1 and probe returns 1. The PCI
core takes that as success, but the devm action that unregisters the
controller is never added, so it stays registered after unbind while
its driver data is freed.

hci_register_dev() returns the index of the new controller on success.
Check for a negative return, as the other drivers do.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 66d49b47154..da0a48c2be3 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2410,7 +2410,7 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return ret;
 
 	ret = hci_register_dev(hdev);
-	if (ret)
+	if (ret < 0)
 		return ret;
 	return devm_add_action_or_reset(&pdev->dev, bcm4377_hci_unregister_dev,
 					hdev);

