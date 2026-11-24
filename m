Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92A606A695
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y/uJT0zI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHqkHaCR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V+4F6I7uCMsa56sY8qxl3MrFvsZqFdQNXxT4S0Y1kkE=; b=y/uJT0zIQHtJ1o
	bAM2h0WX5dxyji3rkSiW5INvI9eFTfm8k6ljiR9+VEEY3Wrdcp73r0k/P+R0YfUu74WMVJhO/VrDk
	Mgt1/Ns6y8T/FPMOrLv95cyiDrLpbbeUikB5nJB39cI/Pa3yC1QRJXp1LPGrOAlPvDuBfrHZ/EdQv
	A/BZld8sG7lE+WzC/l3hEbxl0k8Lf1PrBlTeqe6FBB6YwfjfdWNQKPC7p+bJ5TU5KRSeIt5KQXmLH
	4pYHqKJA0xRCOfr3OkrYaZXX44fETC78OLKHCxaFgjkyH/wg9j5W5vPG/RAEjlzKbq11GbwpVaKxY
	mzdJPCarYtCoYT2Jh5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoxp-00000006NoT-1Ecm;
	Tue, 24 Nov 2026 11:45:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoxo-00000006Nnb-227t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:45:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E57D943BCD;
	Tue, 24 Nov 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520731;
	b=C+jFIU8X9PNNhjltL0ZCA9cpvqRvZ4ph1MajS+tNo442V6mTJKLhIlRsNoGB6Z7NJGjP
	 AhvXyFC4T5Ay8vdt1QZDnoCCAf6wMV280AwpxzF/OlAP3WMl4mKKM0r1ruAoMinR0nt+B
	 N4K/tHJq3pTK1Bl/wO2VjKoa7hF3cWL3l/CKA1Uij/0MTLCtPBycejTXHn2rmCw1p3BJF
	 PwLXIR0/ermGQF/2AJF+epSaZg9EJQrU1L7Oz+zbufap5CAdv1qWIXeSsYRzc/vkNkTQB
	 DCg6qAHOYI4WlkToUcEYOjNx9hK6faLOgxQY5losYIXRWgqFPyCngJ2SkXtnYuCGrPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520731;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=V+4F6I7uCMsa56sY8qxl3MrFvsZqFdQNXxT4S0Y1kkE=;
	b=ESojCyUJZYwyGgD3qdaDaoTFA1WFCeEHEBKN9QGKUiYuHGCwex9TnLKy5jNoAd8IVsVa
	 ulMOdZv0GbUZOAaitsWNyvdfwqBtJ+kNrh8xtExLPgFh3h2WI6VoI/dnA/6YFAxlsVIYS
	 CkjXDUT1d8bnG8j8E0SmZ7pU1kkk4JnsbkfB6sUDLB8b6Vu+2zRprzG/eXvuXyzIfUETY
	 dFiWjszA48VZtwgzhSKbyjXBbrxKymhXwvVSDhsq3C9DkdtDujv+Ni8rgxzVxc5TfPDyk
	 K6GU3SmYYU/ZQz4xp+ic9VhDz2e/Ukc3iNRfYYppAJhNVifPasAe4OoGOccWBV6eC3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C7741F000D0;
	Tue, 24 Nov 2026 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520731;
	bh=V+4F6I7uCMsa56sY8qxl3MrFvsZqFdQNXxT4S0Y1kkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VHqkHaCRz3S0EON7z9scfxhtaAz5gPNZ7pYtBLwuSeogN6V9WHpYpLc/7ETrf/U72
	 dKOFSjN7dZDMixTA1efJVvKaoJ8bsAcyv5Mn2dVNPKowwdbl0xrAZWKPlL5RM84ojZ
	 zAZxa7gnGbpZWNunxWECVHxbU57AKe/KYpd6zgXQ1SAYzyUi6ikqkivGgqGh73OoSP
	 lj1fAz63OmvqCpMjwWTegmErABkC79itJQopvXJ7l9PWc0DMM6bZZPt2GZeBMyhuXF
	 KlEnMor+mNjbfPjs2lX3BMwcWwjBVCoUp+ZJEdlTCCli+nSHnpuXr5i/vNaPV6Vg0o
	 XE7oRzS+Fe3MA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4E414C9B1;
	Tue, 24 Nov 2026 11:45:26 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:03 +0530
Subject: [PATCH v13 01/20] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dma-upstream-v13-v13-1-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520723; l=2302;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=0QbFZNXvvMb+ue0ziAGKkg7DBgtCKZ+KVB36CbCIP+g=;
 b=MRewRL5HmtOr8dMHDtNNoJPPgWV02lzo2xXfLL/qI8dUiJyKIOfFBiHACm9/3gPEyXhCNTLlm
 ZN6RO5wDQ1CBKlWU1ak3bBEsCgPHEAKHEZuEqw0OTwXvAjJqtCbOeIS
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: s-adivi@ti.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and left uninitialized, so any
field not explicitly assigned afterwards carries garbage. Every field
that exists on struct k3_ringacc_init_data today (tisci, tisci_dev_id,
num_rings) is set immediately below, so this is currently a no-op, but
a later patch in this series adds a base_rt field to the same struct
that is not set by this call site. Without this fix, that field would
carry stack garbage here, and k3_ringacc_dmarings_init() could use a
junk address for the ringrt base, causing a crash during ring pop:

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this proactively by explicitly initializing the variable to 0,
before the base_rt field is introduced.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 75bd1977fb423..6f3f0467fd5e0 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5467,7 +5467,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;

-- 
2.55.0



