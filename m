Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F25A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gy/QD/Co;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCDVJEEy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lb3fYY47wnHUevyvaDmgtyRPvaV2N/l1ui/X6FH+mpc=; b=gy/QD/CojTPQux
	i/JBqC1lI80GgeVsrGq9CvnKQkJSGHXfcWUL7qCjS3v6RonjxppuXui34PKMu0CdtQ40u0DAILOU9
	Q8dqQietoSWKX+Hz/W5z5Ajh4+5OWnNaYSZxKf7tav9ws952Bzr3IyGhrGAHDe05I8qE5niTKQ4pk
	lmi+3eKH+SQqO9EicTG2zoSdN9B5sJ9D/OunxRKuZBqwfthUgLA5I11xn9uWt/uLrQ0jbVUm6wkMb
	SiASho01ol00KfR7cKe8vv4w1eBtaVMkFrblMRfEEtTzEQifSTWWa4L5YQHdS0dorR72/JoIn0DZo
	XbqovivwNz8cO002SQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwZe-0000000GKU3-0Zsh;
	Fri, 27 Nov 2026 14:05:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwZc-0000000GKTs-1Lfr;
	Fri, 27 Nov 2026 14:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80039612A2;
	Fri, 27 Nov 2026 14:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319AD1F0089A;
	Fri, 27 Nov 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788310;
	bh=Lb3fYY47wnHUevyvaDmgtyRPvaV2N/l1ui/X6FH+mpc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eCDVJEEy0qfkoW4WtYAnv8Aat5z/4lVPYtKEVRyj/jJVr9JzlYMEqhCDgfeWooKUz
	 0t7mqvOC6jOdkIkxSOrMBx5hyzYU/pjan869QceTe4y3Z3IW/+AIP05YmxCp4uqSdX
	 bwIuHlzbMgxYn4V23IHo/N68OjCP9ESVlbKHtyrSRDRET19MRnQL91GU/J63ltGd2u
	 krwU9eZ2IagM6BHleqJ5iZ0lTK/zoq+4es0D3myWIPVRqXF7dydgXtuR5tgyokpPGY
	 rhhFgW9/M77uWaMpLuXF09o+/4Llcqcv8fEDgz+i5EeEykYm9KkG7Z4zuSmcU9G3F0
	 aPVbI7VEU2UrA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] phy: sun4i-usb: clear SIDDQ before the PHY
 reset on A733
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Xu Rao <raoxu@uniontech.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
Date: Fri, 27 Nov 2026 19:35:01 +0530
Message-Id: <179578830124.13164.6448969213727096361.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=mani@kernel.org;
 h=from:subject:message-id; bh=8QzInF1J2qP/fK9TJarJMLOvNe7VwTxh+pNNVzDPp7I=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCY4Q8c7TA9KmMf5FaTcXemES5U19AI1NFr3ll
 g1OhyyGwgeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmOEAAKCRBVnxHm/pHO
 9Si9B/48tsiZR3y/6Bvlnzrcq+i+gsShcLe6X1adsXbuj5XxI8KFhAZSfU/HWzcUrhIfQg3h55p
 9taAi1gw9EbB1WudUGXwbtdj784gAhgAzlow5LGpabP2s4OcGXivHnRVZwF2fiuVxzp3CUnuAp2
 ECcpBizzW2i29XwFpreGXAxi6tRv0/mINwfaMR9IxaNClbuJOWtc7trQyVyP5qPt4Ay99M92Jq6
 u7eoYeg6Z/A00ANiq7i8FrpO2hbuIc0zThZfOldsBMphwCHNDyvpCPpo+GNHhKIpAMpKNhXyRGb
 e1ogBrt7QE6411mEuZxUN+5a2xsRRC2/cCmMB4bbmANujZBn
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-16 07:55 -0300, Vinicius Pedrosa wrote:
> sun4i_usb_phy_init() deasserts the PHY reset first and clears SIDDQ in
> the PMU HCI_PHY_CTL register afterwards. The order comes from the H3
> support and the reason for it isn't documented.
> 
> On a Cubie A7Z (A733), the Wi-Fi module on USB1 sometimes came up
> at full speed on the OHCI companion and failed enumeration with -62.
> This happened in 3 of 40 warm boots with a separate local PHY tuning
> change applied.
> 
> With that tuning disabled, the current order failed once in 31 warm
> boots. Clearing SIDDQ before releasing reset had no failures in 60
> warm boots in the same interleaved run, or in 10 cold boots.
> Why the order matters is not understood.
> 
> The vendor BSP clears SIDDQ while the PHY is still in reset, in its
> common host path.
> 
> Add a config flag for the early clear and set it only for the A733,
> whose config is otherwise the D1 one. The other SoCs keep the current
> order: the manuals don't specify one and they weren't tested.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



