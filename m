Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE7606A8A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxV5w019;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SC7wFltQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o4e6DKn8it+1Rse/95SmihcJknRsQkvOnDfeAvHPjno=; b=FxV5w019+b83EH
	lbMKIhVqGvetPFuOz00Fk6o0NFksSNqfHmKNqej3vpRTHD5hN8eeh2iDqGWFLDhdTJRcsvtDRwGYJ
	K7w/ZwncE9+QRiaghhWNRngAp6B0HH9/0rpDR3yefONcAV1RURzO2GpGpuiKzt0PcQwjXoecM3wK0
	loX9lEYCIHdJ+hLYcTOVAaPgV4QFmOjd5lfZKOcEFxqNAngtTFQBQ2P0IF5l3Lyqf4sgWF3Asojxt
	j6NBL0e4OX7mL3RFzKd+aEcYw5Ah0aLMjT+RA94ruP0xsQjRokvVYPcSxn4i7dHLVqn0Cdm9BL5a6
	2yzdQhIcGVlWBVtLz4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVPg-0000000AB42-07kL;
	Thu, 12 Nov 2026 14:04:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVPe-0000000AB3b-2Ze0;
	Thu, 12 Nov 2026 14:04:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BBC5407F2;
	Thu, 12 Nov 2026 14:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEFF1F00A05;
	Thu, 12 Nov 2026 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492266;
	bh=o4e6DKn8it+1Rse/95SmihcJknRsQkvOnDfeAvHPjno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SC7wFltQpC0qBvf+HrMVnoSiX9K/cUcaMV+YboznfByvgaonrFSS3vntGSYRB/tae
	 bdo4I+j5s1PugdHuoTkacVr60PsW5iNQxMKss2YHFRsBz4d5uS4d2/8TViTRO2LySj
	 CdQsKYyR+cuC7LOly4VolHyFn9PWLHcDQquWPDbXpgy5iytHTeA41eOmXL3BVua1zu
	 oL1LuPCC+9hFMobz+GT0dyigZiMka2J22dh/k+QG1rZoxYkVt9jzx+tMsTfUqu+K1n
	 W/FThAXAuhZfwfV0VKLshZ2lI1QYRh12sIv4kdEhHLopuqeAipri3PDbii2mp8hWxq
	 Zn2eL6n05G3Uw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vincent Mailhol <mailhol@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Manivannan Sadhasivam <mani@kernel.org>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-can@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20261112130506.12823-1-wahrenst@gmx.net>
References: <20261112130506.12823-1-wahrenst@gmx.net>
Subject: Re: (subset) [PATCH V2 0/6] ARM: mxs: add EVAchargeSE board
 support
Message-Id: <179449225983.539829.932909223688582860.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 19:34:19 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 12 Nov 2026 14:04:59 +0100, Stefan Wahren wrote:
> This series adds support for the chargebyte EVAcharge SE, which is a
> ISO 15118 compliant controller for electric vehicle & charging stations.
> 
> Changes in V2:
> - add Krzysztof's Acked-by to Patches 1-3
> - align writing of EVAcharge SE (reported by sashiko)
> - add "dts:" to subject of Patch 5 (reported by Andrew)
> - add PHY ID of LAN8720Ai (reported by sashiko)
> - move enet_out clock to MAC node as in imx28-btt3.dtsi
> - adjust IRQ type of PHY (reported by Andrew)
> - add new patch to enable EVAcharge SE peripherals in mxs_defconfig
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: phy: ti,tcan104x-can: Document Microchip MCP2562
      commit: 06f194589afdf29e85176b358ecd5a38aa467a95

Best regards,
-- 
~Vinod



