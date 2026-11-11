Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1160A262D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P+LpZpjB;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=fENlUVZ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uCuXL4k6bXz1OMpQSYuglr4LnZB1D5NcI6zeX6m9YVw=; b=P+LpZpjBSRDwFb+HhZm9x0efh4
	zTpjh8/vhzZ4RD7jcfhYCMN/KRiwDHuUUIgToVxpnujUidKLeiz10/K1nLEX9vh9rZ5oOy9QUI8X9
	Ozd1f6qqesb/w2ryhluXodn57M5an9+O6phqhH3dDguLKyCsM8LUJhE6sqHCHlbyt/XMhRmq4+58f
	qLDFmu3iBCwttXtwCraOyndWQgjMYvMSvis+FhhWQe6DCVv+l86bHrNOTcEWqZQ/ClGqMqwrwKT7u
	/Tc7wIIhIhA4j/Wg3qj6ZK7KKEqi7qHBmdY3Qtl/IoiHpveouCqqLdr1c69YXJD4Tn90guf5thCey
	gw+pO6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR72e-00000006bdr-2Twt;
	Wed, 11 Nov 2026 12:03:04 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR72Z-00000006bXT-1sob
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:03:02 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: c5a54213-9cbf-48a4-8e1a-0957c13c7efb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398572;
	bh=/2sigmfXWkPzluBSXA1irkkQUfzfLvNPv0N9im65hXY=;
	h=From:To:Cc:Subject:Date:From;
	b=fENlUVZ+IzGo74oxqoF6Zyc0XwlvqAKBDIvQNc47T0rPKrx1aQbXLYBEO51842aK7
	 qiphnBOWcTHVKhxfylp6NEoa+MI4pnMZIgfxpKDco/QxYoOnrAN1YCGLWbJI90XTse
	 ajyNclf9gB+Fnl+zRn0ZtZokpqwr6Dg3mVn+oVi1fJK0wC8amH2z+HQN41hNNx0TfZ
	 +VGK/UHF3UeAQlKiwafAAL8oHA0OOpWUckTjoLEU/D1f93hCrzGXn4d81mtI90ZI6S
	 uGi7tXpHgYAKe5rk/GCM6O+EOZrzK2i9uSN2tXAI4JlHX/wk0ubnbcR35X+Ml5QeoD
	 a/oNcM+6585jw==
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
Subject: [PATCH v2 0/3] Bluetooth: hci_bcm4377: resume after ACPI S3 and ASPM
Date: Wed, 11 Nov 2026 13:02:45 +0100
Message-ID: <20261111120248.21062-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040259_910501_55A07B21 
X-CRM114-Status: GOOD (  11.75  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After ACPI S3 the Bluetooth function of the BCM4377 comes back without
its firmware. Patch 2 probes it again after such a resume.

When the previous controller is still being released, the re-probe
registers the new one under another index, which runs into the probe
return check fixed in patch 1. Patch 1 is a fix on its own and goes
first.

Patch 3 is new in v2. Because of a hardware erratum the driver keeps
ASPM disabled on the whole link to the Wi-Fi and Bluetooth chip for as
long as it is bound, which holds the CPU package at PC3.
Patch 3 disables ASPM only while the firmware boots and restores it
once the firmware runs, also after the re-probe from patch 2.

The Wi-Fi function of the same chip needs the same after S3 and goes to
linux-wireless in "wifi: brcmfmac: pcie: S3 suspend and resume on the
T2 Mac chips".

Successfully ested on MacBookAir9,1 and MacBookPro15,4.

v1 [1] has not received any feedback yet.

Changes in v2:
- Add patch 3, keep ASPM off only while the firmware boots
- Patches 1 and 2 are unchanged

[1] https://lore.kernel.org/all/20261107154839.89941-1-dev@deq.rocks/

Andre Eikmeyer (3):
  Bluetooth: hci_bcm4377: treat only negative hci_register_dev() returns
    as errors
  Bluetooth: hci_bcm4377: probe again after a resume through firmware
  Bluetooth: hci_bcm4377: keep ASPM off only while the firmware boots

 drivers/bluetooth/hci_bcm4377.c | 93 +++++++++++++++++++++++++++++----
 1 file changed, 83 insertions(+), 10 deletions(-)


base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db

