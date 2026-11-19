Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF036606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nuXZ9tO7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R367VU0l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=82nK9tN4SUSa2qi6vTHtLocU/pi0xXDC9NSq+2U2fz8=; b=nuXZ9tO7mmhWD8
	R+r+7t0Ft6bJ4h1rvmarb344YNUR1Ejz446PPu3bVScFuTx3mNdDmN6KxkrceVruWNtfPxrS+ESu3
	MiYUz6hdCOPghLyGvMRZpM/+fD89czi1cMwvBjvbX5NSZoa3ldUsancqjWo3cFZ5D7UN+IxW0DFSP
	ohm3KgQENqxq+Zj0mLQTz55spQFvrCQ/W2KO3tNp/Nya75CYMKljsje7acVdIB1QRxidZRbak2tTD
	fcm9yV/6WBC8u82HCy2m5yWY2Uwvqy9Ix7AEV51SOVtBUmSUaImJ9sAhr9Ri6YH9y8VvX/0q7nR3J
	IpyBt9s+/q/XM7+my5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gv-0000000D5Ze-163G;
	Thu, 19 Nov 2026 18:54:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FW-0000000D4MF-362h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08FBE45B13;
	Thu, 19 Nov 2026 18:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386CF1F0182A;
	Thu, 19 Nov 2026 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114365;
	bh=82nK9tN4SUSa2qi6vTHtLocU/pi0xXDC9NSq+2U2fz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R367VU0lbn+D1aLL1Cl1NLB0s4MerjRq1WmUQChFHl12UrpbqnZDPOoNoGNFsyV/L
	 EOGN/WCIjC55RhJkYpSzbpqGA8apPMUdD5BfDERoN8BabhLLnq9JYV8nHoRTAHqSno
	 3IyzgmRtIxIjmq4aps2TO4GN1uQQB0ZxSQmUK+TmXHpP5JOwINxaEGtkDXjgx1HTln
	 UG55RMmBMwORM9/OjRe6WH5vrYKDSKUMjhC/ykXbF9t5JXcY6yorRujyasSfMB31gc
	 ilunHo9bZ1xtkXLLp9Enna2/FJUp4l4ttobdh+xoqcG6doJI/AoOKKkn1+AWejH7a7
	 Wdw6a9eYuFSng==
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 James Clark <jjc@jclark.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Rahul Sharma <r-sharma3@ti.com>, Robert Nelson <robertcnelson@gmail.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chintan Vankar <c-vankar@ti.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
References: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
Subject: Re: (subset) [PATCH net-next 1/3] dt-bindings: mfd: syscon: add
 ti,am654-gtc
Message-Id: <179511436097.97786.7515300839199702588.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:52:40 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 10 Nov 2026 11:24:01 +0700, James Clark wrote:
> Add a compatible for the CFG0 register frame of the Global Timebase
> Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
> cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
> which selects the counter bit that the GTC exports as its push event
> output; the CPTS driver writes to that register to provide hardware
> cross-timestamps.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
      commit: e852a51a50385dd737fbb43ef637ba77900a8ccb

--
Lee Jones [李琼斯]


