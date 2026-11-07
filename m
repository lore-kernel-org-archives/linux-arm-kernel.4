Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00F5608363C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jr/eFFuy;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=xb1V/8vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jtXfHdYWCtXKWv9mf/2Ht3BVfSpNnPeOBsCh2ZBabNc=; b=jr/eFFuyMRx8e6mZT/30c046DU
	VQ3vzwPs0EYfRHP4Mop0hBpcNnh5lmSxLudEfJccRJxoxekO0BJMwwdtP9dHZ58pJKJGTqOEaZil1
	kaTw3yXoAUlEQpc9W45yD6Uxb5cX9uronG9n1Vtk9LLtygEvHoJddD7RqwQAOAWgfS+k5ebJIhLSS
	vNClvD15rLs9yZBiLlOsBmHkzVBCsCnQMwMabb7D/vD88S3TxdGeAy4PzVy+0iMD63RNS908Jzwo6
	6i6hykI1le0V2CHPL+jO4APZgJNFqHnmrEnJZlvoQiv2lzPfNxfEBERT5TGiZJCouQbxkVROw1mFA
	0dkhMX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiex-0000000ExGQ-2Ojv;
	Sat, 07 Nov 2026 15:48:51 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPieu-0000000ExEc-16Md
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:48:50 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 62c42788-fd3b-40fc-b502-00516516e72b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066522;
	bh=9oMB0p4H6SKMJlxQ7LbkQ0+0DRnlDsn0JitxiNh13XA=;
	h=From:To:Cc:Subject:Date:From;
	b=xb1V/8vdoooE3cVzf4DGaq8SqBROrIzJqc35M1sc2pJyDj+PH7/+P5k6eIrkE490Y
	 H9nM2IiQJDzdkQqtX0H57l6M6yCgHyHYMcEvLutfo5klavFuHjEn6XFyqv/UEv/JUT
	 uiBTBXV9psXcu65h/I79jpA4l8rzCMdzaAkU/Qq39nBnGWQK2cQ+rEg7Vn3nJd1jsc
	 fWV0LHu4OqpK/EC9b2Oj9FEnXYW4lwQIvd+qvTCstN3y8WyYhWL6MKWzDfrF4NcsfF
	 gA7BlEj4VE2MmUUZKrzd63J/jm6XiKgbF2qcGoRAPVexxQF4FZArw8GSIuSdJj4vuf
	 rSyefVwKlIx4g==
To: Sven Peter <sven@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Bluetooth: hci_bcm4377: resume after ACPI S3
Date: Sat,  7 Nov 2026 16:48:37 +0100
Message-ID: <20261107154839.89941-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_074848_733505_B3BEFB32 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

The Wi-Fi function of the same chip needs the same after S3 and goes to
linux-wireless in "wifi: brcmfmac: pcie: S3 suspend and resume on the
T2 Mac chips".

Tested on a MacBookAir9,1 with three S3 cycles, holding the old
controller across each resume so the new one comes up under the other
index.


Andre Eikmeyer (2):
  Bluetooth: hci_bcm4377: treat only negative hci_register_dev() returns
    as errors
  Bluetooth: hci_bcm4377: probe again after a resume through firmware

 drivers/bluetooth/hci_bcm4377.c | 61 ++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)


base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db

