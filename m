Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ijTwcUhm;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=XIee0nPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v3yEbC+AJmlftdTFGRLi1VzGahJ69Ti/aAE4/7WZpZ8=; b=ijTwcUhm0zhHaCGS73d+1obI+W
	NqyIBs6EMld5Gl4rUd7foS4/nO3QtNi5RMlNSXbSYzB39PfhRBCW7eS+8h9AUq60xnR95EMhW350+
	mPQUozAYz4kZ81rjfU3asfEwByelvtwEf6+lPn0rAdew3WFzAQylepnirmAYaJmEW0U6Z26jq7aK0
	gNrkIogAjckMCGWY9TxRYiBrJx6LO5XAfwRhL6zmPxDGi0FDjMj4iQjO38sIVrnQ6hJLU0ymzTgRf
	2INjuZH++HcatFmliQ7lyCJZ2l+zbjIPt69Bl28RV1/RJXZpCKvL33ulw19RKA/7tsdofnZtYdwUv
	eeT9Qe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvww-0000000GFdD-0nNx;
	Fri, 27 Nov 2026 13:25:14 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvws-0000000GFbi-3gec
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:25:12 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: be76e0bf-39fa-4763-b198-36333ccb8c8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795785905;
	bh=jCbGfbLhz0HJs0XbEZQr5LjpS053K2gG8GUfQl41Qr0=;
	h=From:To:Cc:Subject:Date:From;
	b=XIee0nPOFMYsVn0LGgyRbwD8r91BOqjTLtTGbqQmsNLRzh8eYtV+hjX+XvGwjd+lv
	 3KUvI0EfxBWmO6WWZEr6pAmHVwxDOnhkdPu6EqnXv81YHXbEvCXzH6D6Jlj3h+0fHK
	 a7Wuw5atrgwrygc/xxbVmxua/FcftRx5W//K1a29xiy1d1zTLlhnKg7Y2UNURE310O
	 Huo1zb/ZTMWF25endityMHWoquAMfRCzNh1oWEVQ0cXUZQiqb49fzZx+9qw5B01oJT
	 JwuJDH1YOTMk9VLE0FYsK5CKRRcdiFgCnN3PVXg1Hyg6Gavxz5rHSD93A8lVVw1yF5
	 LFU2hbOFyuLXA==
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
Subject: [PATCH v3 0/3] Bluetooth: hci_bcm4377: resume after ACPI S3 and ASPM
Date: Fri, 27 Nov 2026 14:24:58 +0100
Message-ID: <20261127132501.262651-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052511_375192_14FE540B 
X-CRM114-Status: GOOD (  11.82  )
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

Because of a hardware erratum the driver keeps ASPM disabled on the
whole link to the Wi-Fi and Bluetooth chip for as long as it is bound,
which holds the CPU package at PC3. Patch 3 disables ASPM only while
the firmware boots and restores it once the firmware runs, also after
the re-probe from patch 2.

The Wi-Fi function of the same chip needs the same after S3 and goes to
linux-wireless in "wifi: brcmfmac: pcie: S3 suspend and resume on the
T2 Mac chips".

Tested on MacBookAir9,1 and MacBookPro15,4.

Changes in v3:
- Rebase on bluetooth-next
- Patch 1: shorter subject, add Sven's Reviewed-by from v1
- Patch 3: add Sven's Acked-by

Changes in v2:
- Add patch 3, keep ASPM off only while the firmware boots
- Patches 1 and 2 are unchanged

v2: https://lore.kernel.org/all/20261111120248.21062-1-dev@deq.rocks/
v1: https://lore.kernel.org/all/20261107154839.89941-1-dev@deq.rocks/

Andre Eikmeyer (3):
  Bluetooth: hci_bcm4377: check hci_register_dev() for a negative return
  Bluetooth: hci_bcm4377: probe again after a resume through firmware
  Bluetooth: hci_bcm4377: keep ASPM off only while the firmware boots

 drivers/bluetooth/hci_bcm4377.c | 93 +++++++++++++++++++++++++++++----
 1 file changed, 83 insertions(+), 10 deletions(-)


base-commit: f57f78086ab54f3b3122fbaeba2c842ba7bb6d00

