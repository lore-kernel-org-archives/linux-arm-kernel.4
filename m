Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69E60A262A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RgIqAfkT;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JbpPxQlk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GU1rR6DOyFxE66mLliEw1hVk/Ddk8r/dNCEfmv4kUDw=; b=RgIqAfkT4Hhccl
	8jCycQ2lXX1V/1bEHywZS6cqsIZNYPoWEFQiI0cPA0zrmw8JkL7MLTw6Z01bcnylGCKJ8244xv8CY
	1vPbvDUPaSHhwuH7eUEACtB/1s9mrXJAwXrftp23AOdJjbXJls18ZKOhBAzV0bW3unpLvy/6MQ/G0
	MD5Gr0Xin33SVhSP7+5shJmEk1Ysvx/kQ/aQNUa7NyphoJMxbdbQC+Z46zaEamc8xToc+JM4c9MwZ
	xy44JOVVfX15LYQarFcEIuYvVkiPh27X4FCNF707rKZkh/IpuF6MzRmUmbH7Awb//2ZwX6xBIE0Tz
	fMwSdBHEI/mYCyD+EuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR72e-00000006bdc-1pZE;
	Wed, 11 Nov 2026 12:03:04 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR72Z-00000006bZR-3Qx6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:03:02 +0000
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398575;
	bh=yawQ4E02fUTwAlaYm0llbngJGLthGeeE2ZDGDd72jJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JbpPxQlkys15RVAJz3GjgfOx3YBNrGh80v6rH8HnDaHjqxID5IuXUqB6zQ2vd660j
	 jGtbdlcNKFhOb6V386Wy4c5KKcrd9ELSJEtC4U3VFdWt0cVYVndEibYWDXyuw3BNqM
	 8mrUTHkB41bMQoshQjFj9YYORvHnoDQqGK2fLAqC1xV8Et/xjDJVpQzs0h9Y4crNUY
	 PpPoKx4x8qjr2Ir2D7x2fvUAgLm/QwneO44IZFkoLJLEH7Hq9H9Q///wtWMrUO4ASR
	 kvYiPjMvCAsyNOjU4cBeqdkuZhIL3pjcCPt6OgpdH2E8FEZeyHUUiSWy7tJto7VTSL
	 CiCz4Be2+tXBg==
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
Subject: [PATCH v2 1/3] Bluetooth: hci_bcm4377: treat only negative hci_register_dev() returns as errors
Date: Wed, 11 Nov 2026 13:02:46 +0100
Message-ID: <20261111120248.21062-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111120248.21062-1-dev@deq.rocks>
References: <20261111120248.21062-1-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040300_003427_10261A0F 
X-CRM114-Status: GOOD (  11.90  )
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

