Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E23606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxL/QV/R;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=RIvUPb5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9HyvOPa2UhLzmeJoxn3FVY6hx1fLNyYLiAGZU5rDFMI=; b=qxL/QV/Rey+YSm
	tT/bLG6bc/DAgXQFviWhMuOB6zU/ceaFqdAyrKZ10HV8N9GYND4CWHsa9iliyO4yFoNG2XBzx7AF0
	12PWvoAPrafwbmHOIf6diNqayUNCu8KaYrWGbWVE+idXlM6Q+8jh5iTgtrgXFqjH0Q6jmiNIBhshE
	LfJPy9hoX67n3qCcOqpg39UuWYiX9cqYJgiIj/UkPChXbzwKNkvGImk6JEMx00u5fxsrhm3qcCNpz
	IwA7hk4ZNhTA5zoTIgd0o2WLVDHrMujTVJ4u19A0/oYRt7XXd/8xx8xPJaNTDu/75cysKJ7xbusUD
	Xgy9RPO+daSu+/aphTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyXB-0000000EXpk-0UWj;
	Fri, 13 Nov 2026 21:10:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVM-0000000EWmc-2cPq;
	Fri, 13 Nov 2026 21:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9HyvOPa2UhLzmeJoxn3FVY6hx1fLNyYLiAGZU5rDFMI=; b=RIvUPb5fDU60DynvAvDuW4rbXJ
	vuilFTWJBxMAgN7oDMQZT7daazrCvZ3jkoEBJCccTivqbH5NFKEtZL36TcyL/deFE6fEI4q4mLU/h
	MIdDCa6copyv7Kucd5zZ7S2kgz/RreaNh7wkz7+6yf+lP9uUQ56bhB3K03Cua6AAabReO2XynzBfC
	qkrcoIWGKPwY0xegS0CDRpDBHE8kA2oIFnR36kH/eErIHpdx2/BFRIckJtPHR/D5Vu7Bcd1/5JbeN
	TuSMBTWyHs2NvCYyL8sq19BkQkye6srdLU832WTFw9C3Fs8WUQnw1jY+26u0d5k1DNgmtzk33RAaj
	Ad1kRmpQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	kernel@collabora.com
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: Enable more features on RK3588 EVB1
Date: Fri, 13 Nov 2026 22:08:08 +0100
Message-ID: <179460406451.1165597.16868636622919014871.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130818_611125_52EA1A0C 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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


On Fri, 06 Nov 2026 22:57:05 +0100, Sebastian Reichel wrote:
> Enable a bunch of features on the RK3588 EVB1.

Applied, thanks!

[1/5] arm64: dts: rockchip: Add missing PCIe wake pinmux on RK3588 EVB1
      commit: 57c33a45eab35579a73eb0cf8a742dd54a5e6566
[2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
      commit: 38e2bfcc44fc3694c4ab2aac896ad9fa6abbeca9
[3/5] arm64: dts: rockchip: Enable HDMI sound on RK3588 EVB1
      commit: ea3b5dcefd88c6c433c0c0f05221e058f60b4b26
[4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
      commit: 61e97442ca409f577816699aa203461b76b24e9a
[5/5] arm64: dts: rockchip: Add Bluetooth to RK3588 EVB1
      commit: 914eabb8b872fe1298be5d397525f0a0e39b25b3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

