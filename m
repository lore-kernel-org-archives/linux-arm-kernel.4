Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F03606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KPGS0Qh7;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=K1dX8zWL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q1f0lb7RWc9Q15urz+o+3HMy+hoargnMfYFL2uvHrRU=; b=KPGS0Qh7+CAXMb
	+cY5xHjLAhhULpL5Sfd3kptE3GukLcCFcoqzxC+rLOxd9j3+wErgEpURsqB5xM4P6a9i5uu8hZjaV
	J0vNdluWe8Mj/FoOM7smpkv1qH0R+rbnBDuK80o53pkt+yLGJTf1Zv4gibnQIjXWGdeq6/WmVh3Qv
	4oT3wrS2O6BvYtFl6KyE7CTBq2prZlZ3eSRJCsBQWU5sir0Xdex2LoqHgEUK9Kae2+1hfIEQgabLm
	OeAwTQn+y0j8XFd9P2xw2M1mkH7dX+9OiDeKQ4GQsmTUPq6XHtvlwKV6hjr3X6KkuDlOx4mnBHb9/
	cBHZMkeRHvHwzZ5opU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJVj-0000000BGk4-3M8C;
	Wed, 25 Nov 2026 20:22:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJUQ-0000000BGBV-4AEs;
	Wed, 25 Nov 2026 20:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Q1f0lb7RWc9Q15urz+o+3HMy+hoargnMfYFL2uvHrRU=; b=K1dX8zWLZlhzTMNu8QgVojp258
	Xaij/I2WT0cmw1TY1uFV6UetbqGiDcNe9lw9rIDc8bUw3kL9HgM8Jat8lQ7lcw4V/Zesi6cFqDFBA
	yoxp/Hi8WlHIbi3CrmVaTRipAfA5GKpZLE8EbEMLfrMaJWV7VJdBaoFejUnFn0thM5s7WsjLajJed
	/rWkqmv3XAPW+bo8CiN3IrVKHIv3dt8a3wAizh/SbdoThi6CxgObO1bhDQXyE8nK08G79cHEvTQ17
	/QVXOmGdcT/M14LgBi+wBQN44heHaNqD2Bz/Aeo3EyOCm2azRE3F1PpliM0JmVTlayCwDo56zqOZ/
	4WMdHF5g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI RX for Orange Pi 5 Ultra
Date: Wed, 25 Nov 2026 21:20:59 +0100
Message-ID: <179563805244.3885553.95572502382355679.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120090712.68178-1-jan@jschaer.ch>
References: <20261120090712.68178-1-jan@jschaer.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_122115_028710_20A0D68C 
X-CRM114-Status: GOOD (  10.12  )
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


On Fri, 20 Nov 2026 10:07:12 +0100, Jan Schär wrote:
> The Orange Pi 5 Ultra has an HDMI input, enable it. It was missing
> because the snps_hdmirx driver was introduced after the Orange Pi 5
> Ultra DTS.
> 
> The pin definitions here match the schematic and the DTS in the Orange
> Pi vendor kernel. In the schematic, the hot-plug detect pin is named
> HDMI_RX_DET_L.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI RX for Orange Pi 5 Ultra
      commit: 74ed9de2297d3b7e1542a263966aa8aad8617579

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

