Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eXwW4/Ra;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JwHmXFds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tfsVJeJwoTJiKqOmwk8wLZHyZsE94at7N5lewUc/Esk=; b=eXwW4/Rar/5IwJ
	PKcwhy8F+Ogqm3l7J+wwNKnHWUkK5BxyeP2P1NfruBs9yeUHUKjqwY+vtmZBdarBA3sMHCIDHYAUr
	G+VZy58AL3kLwns/x3WLv3H4CwmUlUtVSXc+Z68gfBrfku7jnv+AF1UmH+HqWREYHGuWMtS916mG4
	1HAeNZPnZyxACfxTR5iVqZ2/pV4gNUl+y0nQuQlcqfD8Ra3O4sIwLoLfhTQrfea37xsuX7csntS51
	rdUR+Py3uXwUp+bZqAMx6sywkgzWyjG4zBhDiIulTSfUxacCmcxFWR5PnPmOXixJPMvANk8u3o4yd
	W84rXYrs8r4pff4Ds58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvx4-0000000GFg2-1GEZ;
	Fri, 27 Nov 2026 13:25:22 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvwu-0000000GFbw-048g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:25:13 +0000
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795785908;
	bh=p0cocobOgw98O0lkAGSK3F5IMjPJ/CuN79FKcDuz6d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwHmXFds2j7Y+B55qCcGYxj5tU3Z1umtwucK28yxLCln+iBEWphP+kdZsZPXx5x1o
	 ONt01ou++sU+dddBXlLinRp6KVIF/NlK6Xu/x9rjZlIoCzksnT5P6rzFXnVtI01o4E
	 C4RQlzfZaiQ2CxXCnFctSEln6/ouNypiTD2BDRvxzmDKPu6a6O8j4v4NeGPjm26+cY
	 VM20v2c1oYbi5hA/l1b4UA/UB2JG2Ktqzf5bTHX5GhDUIDNcNiflMGr7iSNih+nXh8
	 2fw7BVjDy4grFq0SWlL6zYjT41x6ORYfZ9lf9Y44VwZsf82pJZ1+kb9YsZbBhdSIdV
	 NSERuhk57tUXQ==
To: sven@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v3 1/3] Bluetooth: hci_bcm4377: check hci_register_dev() for a negative return
Date: Fri, 27 Nov 2026 14:24:59 +0100
Message-ID: <20261127132501.262651-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127132501.262651-1-dev@deq.rocks>
References: <20261127132501.262651-1-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052512_202423_EC93545C 
X-CRM114-Status: GOOD (  11.60  )
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
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 72a9f269e8b..8c9833d625e 100644
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

