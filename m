Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21412606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JC94F3+N;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8DQrljj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z4Y9dHJ0ZeVPS9YGhg84jRxvoO3miOq2kd20onnIAEU=; b=JC94F3+NFuabiN
	/lXmkAuPkOTV1UmT7/8TOG8K4GWYD1znthPAoS6cyR8IitwVwGePBeHj2lbYgN/2UUdaU1WsI0QH4
	dqGktQc5TySl4ZD7uShvIWbZQw9QfTPJbrpdRoKP2TFpWScLxxcXO/1FmB3BVfrO6P1kkX+YFJyiS
	/h8loky5380gyQ7aKwZmmfUFEmGnx26gKjvZzynG9yg6OeXES9w2EoABLxCQhntCj8BG7HqzNjUwu
	oPDfpc0omXWukr004k2WaaQto+oIV2p2CMa5isTUq0/YAFGe1XkuS6c4Jy4R6JCDARzniS06UtmAn
	NNZxj82K1tnK9F3oQHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp5q-00000006Qfw-1nfH;
	Tue, 24 Nov 2026 11:53:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp5o-00000006QfX-3mPG;
	Tue, 24 Nov 2026 11:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E247562014;
	Tue, 24 Nov 2026 11:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25F31F000E1;
	Tue, 24 Nov 2026 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521227;
	bh=z4Y9dHJ0ZeVPS9YGhg84jRxvoO3miOq2kd20onnIAEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E8DQrljjt6Y9V0W0q/3UmGz40Z4NfF+SczkB2scmuxWSZFHr1krz0MSJ5KODrEWLo
	 s57LDSJqhEW+j1UYqHwNiw6c60ijJQH0vnoCjE7UIj+5Sz6kvr5xsslxfgA0Odws7U
	 T1Vv9fSnwkC53ovBZLJcHGARkwJyKpXBmyBigbFk5JZ5mBeb5OVbXqeAiqg5LUMby4
	 g7Xhm1igbfmpkS98mQARr4kvnrQ1Kan/W8hChUnGGRLlA8sIIbdIXxhCMLCRwKxyCx
	 94dgRARP5KhmeTRLAEiKDOB/W1COxoGKp08b+m/EiHrY1m/Sn17WIEaRMkULhGD0gk
	 HYpYa79TsSZHQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Niklas Cassel <cassel@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109184948.477095-1-robh@kernel.org>
References: <20261109184948.477095-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: rockchip-dw: Allow endpoint supply
Message-Id: <179552122328.34281.17286958680139728283.b4-ty@b4>
Date: Tue, 24 Nov 2026 12:53:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 09 Nov 2026 12:49:47 -0600, Rob Herring (Arm) wrote:
> Rockchip PCIe endpoint DTs describe the 3.3V PCIe regulator with
> vpcie3v3-supply.

Applied, thanks!

[1/1] dt-bindings: PCI: rockchip-dw: Allow endpoint supply
      commit: c72d9039a00dd28ce9f99ba73112c68ca0462b35

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



