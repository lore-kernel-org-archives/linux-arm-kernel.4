Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7DE606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pcuFk6hP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZaICRG+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9tyMkUr9+zYWv3mAdl+/oTYNIcjMUy1JAChBbK6vIio=; b=pcuFk6hP0W8AaqpzyTiZiK0/vc
	io9xsggPlOaPcCfUxmMfuqQyS9hAXUDPf7MdY6OnlNE3NpzsU/V5uqXlUyCsdipiWvF5/y5nBOUq4
	SUhEdtGYNahI1hMh5ZljyKa9FOa6ELr5khOS3dD+3jYXtcyl/Cv7f6ngRRv7UNhEIov6B6LiSIR0K
	92iR5QjyaIJRq+PhwrPX5OYu0OPQfkZL/SLUyg5I7QZ7ZZQKmGA+0eCk0tjosIQAKZmCDI1chEqEX
	R8/t46BSulYHlKhlkNJPKK5g5Xy2Yy+P8l6nhtsVMQNocSN74tK6oQylqUs0/TaQhVS2LDr756+r5
	A3HipUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ15-00000004Xyt-3vYN;
	Mon, 23 Nov 2026 18:43:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ10-00000004Xvw-3rjQ;
	Mon, 23 Nov 2026 18:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FDBC62426;
	Mon, 23 Nov 2026 18:43:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459425;
	b=rS8/BpRu8JViWn+uNqzMThet9tLlOrGwVslpiPi3R7aqJmTiCv8nnIRmz+z80SVxEOSK
	 usET9LKy8Ap9o4w6C5KoIvjRCU1ztJBKfBKF5NIO7We4tQ6dSh3ZzU9qwA1mkLL9cdSx5
	 L9sJV/nwKXi2FijXyZyFZlTAdjhihUyYug4NBtN7+psz3dTo+U6E8cWNAandl00eb/K91
	 81KH1yim8xOedZDzsrAZYb5RLcjM0vS/ZOjR85lYgJRQASffLXBHvFb0pgRS+idC8EE7X
	 kbrMvUmfUZfXlellOf5aJlLMdUw7NkE9Q+eV//aLqa2QGmZyPuw61OY0DnB6g5wDMoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459425;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9tyMkUr9+zYWv3mAdl+/oTYNIcjMUy1JAChBbK6vIio=;
	b=oi8DjRiejntaobIbm6ARr0zB0EKoDT22uDDLVvonQP/+ov/UUSHAz6/fsqevH47P6KlN
	 Ail1aiNPQdjKLbTIhsi8gkefow5oElpW+kwI2kUPRXNCD+05wTQ2DcRnZtk3OS0egMr9Y
	 bn5Bm2y+tstKrlY+q16EBC3m9rbXnheHLnK+Ude0axrrYTdTIowXW3krAIaJmXWzcSpMl
	 4kdSuS6bhMKsYm/Hsk+75iNhFUUz+Xnv6IRf1IlFP0E1NFC4VNg3vRKJamwaXKGFIO1Xa
	 pHxj6hZ12thBx3nEeSdRiLA+S0vE2sKbiYTq9ci4NwSk5XCfP/EH0AbPEFm9vynnm0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A1261F000CA;
	Mon, 23 Nov 2026 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459425;
	bh=9tyMkUr9+zYWv3mAdl+/oTYNIcjMUy1JAChBbK6vIio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZaICRG+PuCQK60fTxvNdKR9GV0MoPdOeTGvRCALhWL6hhkHfcAthrT5/PgBL6SwCX
	 7Z5/5dnwVajLkhJsKFqNTRSrxA4GzpryMYUjGYXqW1GWJWD3ITaBeWTRnOoEJ+7dYr
	 LjirD/7nTQ3vmkkJFJVIHmkrg5fQ2yN8eve6K7vH1hoQAe0AitGOWeF8vXfSaMqG9M
	 77qO0D3TtCnIP+Qpb23IR8i4t91nnlMsfjTe4rSVi636CA3vPgkOM54v2P3UftkdHj
	 YdZ9LRTM18Q4Yb+iArm3YXIAhySYqZ8aUP8qer17f+grXkSVvUhe5xYYJ7Y3os1RC8
	 TmSZKddzNNtVA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF6F94C5D5;
	Mon, 23 Nov 2026 18:43:33 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:43:29 +0300
Subject: [PATCH 1/8] PCI: dwc: Export the multiplexed MSI interrupt handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-pcie-v1-1-4cde5201d404@gmail.com>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
In-Reply-To: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Krzysztof Wilczynski <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459409; l=872;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Mna9V2FvctfGCov2fj28CrWMP+FmQdEcH5a5uq4pt5U=;
 b=qNvzbOacLh6x0fSN7zTi0mn1WbwON1SuHXMEhUFL6l3FtIOVmrgsRFMGLDeZuslgdgYoJHppc
 LWit8E7cf8GCfJgcPzOkf0z529lNCweFuB2AAzTM/guTvcrVyYhMeW7
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Allow modular host glue with a combined application interrupt to dispatch
the internal MSI receiver without installing a second chained handler.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index bbb02458a..1d076bb62 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -85,6 +85,7 @@ void dw_handle_msi_irq(struct dw_pcie_rp *pp)
 			generic_handle_demux_domain_irq(pp->msi_irq_domain, irq_off + pos);
 	}
 }
+EXPORT_SYMBOL_GPL(dw_handle_msi_irq);
 
 /* Chained MSI interrupt service routine */
 static void dw_chained_msi_isr(struct irq_desc *desc)

-- 
2.53.0



