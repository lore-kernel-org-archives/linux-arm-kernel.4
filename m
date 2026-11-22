Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E23606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QtZB9tnI;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=kF+a3xZN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m0n2SYcY79h2AUU1BpwbEVohNWmGBSP6n4I5dcaBSL8=; b=QtZB9tnIJdeFP9
	uxFWPrGJaXSdV2POeKqYVcMzX8XzNUlt0fop88PSUfAXpzono0UGLSQzkc/3fvpcQZ4GW/pFX8puJ
	Z46kDfl0LDc+bBqwFmCmPg2M9fY/2bRlEWlFaJrCCoAjgG8EeQQzhxfojOwJ+Zt9NXn1F80kexefd
	u7iOzRVgJef4Ra3bpqcOBUgkXisvhU6BUFRldhpln1WXmMsDfe0bRJMHDgzsBPUSa9TC+OkRTeUlT
	wmYHUdZK0RHqpavr2KPi9Bg1dMyG9J1NyXlGdrNboY6uQkWF9mXbpFmb6merYXLV/+4/Opw47M9sa
	aLgshY3JfJTPdx/B8efw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGRy-00000001sMn-1cys;
	Sun, 22 Nov 2026 22:54:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOV-00000001rMW-47lc;
	Sun, 22 Nov 2026 22:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m0n2SYcY79h2AUU1BpwbEVohNWmGBSP6n4I5dcaBSL8=; b=kF+a3xZNaGXJEfbrh3p4y3vmue
	7Lx+LfyXqZJRUliEFzkvHVMK9XySoBiDcm7VsOFc2gjV4AyTT77D/3kP+S4LeHxIdYaw79jJmSYVe
	yY9JHXwHpRM8khH+7hgYerkVRNjnmNc/9zIrKB5CTbg7pQuElUJfu9QtuE20okjw0s3WgjAJZ6iPw
	tRXBTxYj70uwYwxV2ed4wifSnPkJoSj7sBPY56S7MaY/pMq/QJxuh6TLS0xsVUon0CVMtuh0CyH+F
	9PQ4Zv4IPNSue7B9TZjRtsnP8no+4lzpNVlnmQlH0P4pux1v1Qu+DseWIoVj7Z198ygUy1VGyMLQq
	9JadTD7w==;
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: Add support for Axelera Embedded 111c
Date: Sun, 22 Nov 2026 23:50:28 +0100
Message-ID: <179538782470.3150822.2574967572696059189.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145049_681823_A5164D91 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -2.1 (--)
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


On Fri, 13 Nov 2026 12:38:05 +0100, Patrick Barsanti wrote:
> The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
> SoC. It offers efficient AI compute for multi-stream computer vision and
> generative AI applications in a compact design.
> 
> Product page [1].
> 
> This series aims to introduce basic support for the board,
> which includes the console, the eMMC, the two Gigabit Ethernet ports,
> the four USB ports and the HDMI connector.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Axelera AI
      commit: 26688b74c3706b4e890517f6add709446b214102
[2/3] dt-bindings: arm: rockchip: Add Axelera Embedded 111c
      commit: a74cd16a74e3ecafedf392105d6d8ab6c2dfc1fc
[3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
      commit: 4cfbc536b8728b6c217add4f321a6e80d7c03cc8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

