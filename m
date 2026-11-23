Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63BD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4H7vKgR6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQNLeil0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9tyMkUr9+zYWv3mAdl+/oTYNIcjMUy1JAChBbK6vIio=; b=4H7vKgR67mqh82YROCbQwsiXYL
	Nztk4NgPFcNE0TGsdq4UQuo98Yslbh/9A/1vo5lIToLAACAf9P/t924rCPyxqiOdFum5p7j5XnRmb
	AEyDrzMjMGOHPHvKQXrzOd6KAUUp8vfoALtyTEiaM6V9d8h2u+xKvhzR/dEkIUoSuhliXXTxZPFXS
	fRQvC9a/1Eq/JN+tOmu6dzYh776Q+RX9jpy9w7NJFLqHAHvAli/OMAgu+QNctLKCl9DG37RIL0SVy
	gImYlrrUfwhnov8A7D2IKycmA/EYhPtLBzTWJOuniuOrVVDFoY7ClNBN+A7F8+sksBycxjMpbWAQa
	iFMZ8h0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaiN-00000004qVt-2nQM;
	Mon, 23 Nov 2026 20:32:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaiM-00000004qVC-1K3z;
	Mon, 23 Nov 2026 20:32:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00F7144287;
	Mon, 23 Nov 2026 20:32:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465957;
	b=iOtjEsL2Q+i3LzgiE3w+KuJluBjxBbo8EwFX/moGyUba1kn+UbIuLex6pPFm5UeHFvwM
	 H8ig3agIoHRCwwAunmlZwX97AMxtqOHoGlWKGT1EGb8JqLmM/gMIroTAT2KTR9qDfcueo
	 zjblP0hyjnZN6ba/DIXf/y6FsZrDJbUxVsUnsWWI6fVbVV+Omq2hvBr2ArRGsAmT/+QWt
	 vwEnOc5GFFDMiJj7Xyv7r+PX9Gr+UuThajO/M5OI1guQfwEWNqaxut7Nwk/utZLNwWUVV
	 ejCn1PmvuyXnT2R8yVeixCOr+daR4TqjN6alCpOrKTBNdExupWsQSJeRYemPSd9axEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465957;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9tyMkUr9+zYWv3mAdl+/oTYNIcjMUy1JAChBbK6vIio=;
	b=z9dSqIBGAboFrpQnMo61whta9IURKSojLxc9ri2KnSbBYbMYyOhPLoyTlRc9cNjszCwf
	 PkH3D2rXPc9XDqbmNukH9j+1AW/VhrhMVJqg0jj9k2AaAk6pUKF+2HcoSD1tao7Bg4OCs
	 wcb77IF7/QahfMs5CMJKz1IYLdydkkKAaUFzsU3bxM1pFhtofvDcsrTifK3ilV2SeWUWD
	 JeSOc3wCnMmxC7J1TWE27yZ1irO7Tw3Lwl1j+vQq9Dd49t31mDqIBALGWaFcamQE0DSVM
	 THM9swcm4VhGHluEQ4Gk3KuAs/dbKkNOy7tB4HT49jlw+dGvf4iPYAUPh7nwilLCDHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC98B1F000D3;
	Mon, 23 Nov 2026 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465957;
	bh=9tyMkUr9+zYWv3mAdl+/oTYNIcjMUy1JAChBbK6vIio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KQNLeil0pnY3SrpZpmzEetia+5h2ujIhwz395ANnl5+CGDA4FJrm6su6cs0RtKQR1
	 b9qrMND+GQ4PWNWC0tdvTwcrjjFt9HXQV7Scq5uXfnixwVAZ/gdYI6AldMGh94GSpH
	 aA997h2qIxXWaumeCqUxezbRuMZ0abYn6PlOQkT70461iQS7lz+V4J4kToFJ4UdZFb
	 WKPJ8G13SlT1HYrc76oYGqBSEe1PqxyAWVw7RtvkurczwjVIPpvvNHaCISMiltdMQs
	 eTQ/cDaZU3EvFhWcNB9pw7H9cDHSV+ZU2+g0u53vUm0VDHPya55EU9ii81hnS6L49r
	 kagMxuPPI0wsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E1B54C6FF;
	Mon, 23 Nov 2026 20:32:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:32:15 +0300
Subject: [PATCH v2 1/8] PCI: dwc: Export the multiplexed MSI interrupt
 handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-pcie-v2-1-f589a9cd0bef@gmail.com>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
In-Reply-To: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465935; l=872;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Mna9V2FvctfGCov2fj28CrWMP+FmQdEcH5a5uq4pt5U=;
 b=iPA0bYRf79FFPZCfNmPxcL55dq3dCI1ypOQzRlCncf7ujc4VHkSd+c3JzvJjVekdl6zTVt/SN
 I53Le0IATu0AVXqUzEOQetC/fcE6WJgt8jFDHqqTTa+3cqZRXGvbTNs
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



