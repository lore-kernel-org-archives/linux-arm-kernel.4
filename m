Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gdnivhdh;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=k07RwCpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fsWGnEZ5RKV6lIzRH7Tlw+9LSGwafYEQKJ+xp4OkgK8=; b=GdnivhdhBysdLa
	r5JEtqytMTNTiXuVuFEiI5F9MXH5+Mp9/Ek5Ov4A1PctvJVSfs0ah6vo/Q8iCm/QPDYPzQ6LvSgHs
	4TY2LKa5o2GUtXy/268PzHFTyZP1sAbeSksJ+Q5lw/YIAEKTpd/yED3SRApb/LySW1VoDgnPc3I34
	CUG74+TUd/5jSZxZ9e0qJJ80I2PbLWdALHY8sw2DoZynoeFxjiKZ5aIVqhvDLNLL92IQH7wgXDVt8
	aMeBHQD6wR2tjNsTv0Gq1L6y0dbYMFqaLsV8ARVSBsmTXMJxOIIhdV8OswkmA6CEmqM9dU3FV9ZPb
	VW5sxpCE5p62j1fLEN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvxf-0000000GG0B-0nQa;
	Fri, 27 Nov 2026 13:25:59 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvx7-0000000GFj7-1aW4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:25:28 +0000
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795785923;
	bh=I+5+4Cp5p5qxFPp6obALvbtUZY0z9Ceb02BWKTkXBvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k07RwCptZdv3JTqfF+mHnPZiENqluG+INjymvqRGYkYhNet6clZItckwiqQwqi/Mp
	 enXdS1HnVWlVtToaCzHCi8iDhXnu/OvYjNTCSBuPDuHdaZTF34vjszcBZcmQcN++kP
	 yzEQA1gAOkfrN282rPIA/su0LmvunYljaXBdmsrK9+bgcUslobhldghOcpuZ5GUa8B
	 /wBz/wEKHmuBggxiLvmuoBaAxzFDw1Kw1ICB03RAneHo/y7qCcUDTBdGkNWAGLqH8l
	 BoB5PMX86keSe/YUxp8fYyZV2p5Ft4G7qcJQ7Yc1oJiYf2gSGtUAapaCkI0SqHlUmP
	 IQn+U2xmtz1sg==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Myria Sarvay <myrialsarvay@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH v3 2/2] Bluetooth: set the strict duplicate filter quirk on Apple Broadcom
Date: Fri, 27 Nov 2026 14:25:13 +0100
Message-ID: <20261127132513.262754-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127132513.262754-1-dev@deq.rocks>
References: <20261127132513.262754-1-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052527_481381_A3C3A8EB 
X-CRM114-Status: GOOD (  11.40  )
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

btbcm_finalize() sets HCI_QUIRK_STRICT_DUPLICATE_FILTER, but bcm_setup()
returns before it when no patch file was loaded. The MacBookPro15,1 has
none for its BCM4364B0 ("BCM: firmware Patch file not found").
hci_bcm4377 does not use btbcm_finalize() and never sets the quirk. A
service discovery then scans with "Filter duplicates: Enabled", and the
controller reports an address once per discovery cycle of about 10.7 s.
A Mac that changed its advertisement data on the same address was
reported 6 s after the change, at the next cycle.

Set the quirk in hci_bcm on that path and in hci_bcm4377.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm.c     | 5 ++++-
 drivers/bluetooth/hci_bcm4377.c | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index d2fbaf7cfbc..d85554188b5 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -604,8 +604,11 @@ static int bcm_setup(struct hci_uart *hu)
 	    bacmp(&bdaddr, BDADDR_ANY))
 		hci_set_quirk(hu->hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
-	if (!fw_load_done)
+	if (!fw_load_done) {
+		/* btbcm_finalize() sets this after loading a patch file */
+		hci_set_quirk(hu->hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
 		return 0;
+	}
 
 	/* Init speed if any */
 	if (bcm->dev && bcm->dev->init_speed)
diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 7900e8ca2fb..3362e017bd1 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2391,6 +2391,11 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	hdev->set_bdaddr = bcm4377_hci_set_bdaddr;
 	hdev->setup = bcm4377_hci_setup;
 
+	/* The controller reports an address once per scan with duplicate
+	 * filtering, also after its advertisement data changed.
+	 */
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
+
 	if (bcm4377->hw->broken_mws_transport_config)
 		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG);
 	if (bcm4377->hw->broken_ext_scan)

