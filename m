Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3VoikXw1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NzhE4WrA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OgpKVi56iYyrqQb1XrLNVi7ftcITPhmk6C7+krOK81I=; b=3VoikXw1z2/OK3ZodoFuC9Q2Zh
	8vU9IPaDq0LHrHzLtTOBcE4u+y7wzeEH3f1K+hCTqDyr6Ibq1arvczHtfXjhippIFkQSniVtILW2p
	3eeugBOBFBbT3LKFc0AxkAgHAq/Nx/2dWXQUJfMqb/iOCqSzSSvjE6CTjYg2o12AuJ9ApB5tG5R/t
	+LucIBIUYV63ZdpDC6C9j7knt6mL+kt7N9LHCHtb9EduAbMj8KTrCPzQoORU9VMX51BtlV1OLNPW6
	sFNYd7RlyGghMnBlRS/2mDvyGfay24FsF0cdKnrE0cr7ifkUIWJxr7vckpHa8w8XoDYsbKJQD8wTJ
	3Z0iEoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwzz-00000002g4I-35R2;
	Mon, 16 Nov 2026 13:43:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwzw-00000002g3f-31zP;
	Mon, 16 Nov 2026 13:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OgpKVi56iYyrqQb1XrLNVi7ftcITPhmk6C7+krOK81I=; b=NzhE4WrAx6sZNQUV4/SVRdwpX1
	6Xt5b3BQMx6CM6lrifP4tOmcFTEPbB2/61J9kecr/gJvgzWS+IGsuRTW1yM+/spsRSki3b5pvmzxW
	p69T2L2cWesX2gauOjZ1EA7x0kP/6vGP0qVHV94jhbUh3KqJz8Y8vvwfZ2YI8MYLEGgc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwzV-00GvKE-JM; Mon, 16 Nov 2026 14:43:25 +0100
Date: Mon, 16 Nov 2026 14:43:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: 1579567540@qq.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Add RK3572 support
Message-ID: <d9114295-47ac-4fa7-ab4a-db631a46b363@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_054352_780671_82734560 
X-CRM114-Status: GOOD (  15.50  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 03:39:13PM +0800, Cunhao Lu via B4 Relay wrote:
> This is one of the subsystem submissions for RK3572 support.
> 
> This series adds the RK3572 GMAC bindings and support for both Ethernet
> controllers in the Rockchip stmmac glue driver. It provides RGMII and
> RMII mode and clock control, together with RGMII delay configuration.


> 
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
> 
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module.
> 
> Passed functionality:
> 
> - SD and eMMC complete the firmware, kernel, and root filesystem
>   boot chain.
> - UART console works at 1500000 baud.
> - SD read/write and data persistence checks pass.
> - All eight CPUs start; CPU frequency scaling and hotplug checks pass.
> - Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
>   transfers.
> - All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
>   and reconnect persistence checks.
> - Type-C host and device modes pass in both plug orientations. Physical
>   reconnects correctly select the expected device, host, and device roles
>   in sequence.
> 
> Stability:
> 
> - Repeated cold and software reboots complete on SD and eMMC without data
>   integrity failures.
> - A combined CPU, memory, network, SD, and USB3 stress test completes
>   without a crash, lockup, CPU offline event, or thermal shutdown.
> - Ethernet error and drop counters do not increase during bidirectional
>   network tests.
> 
> Build and checks:
> 
> - The kernel, modules, and board DTB build successfully.
> - The series passes checkpatch with --strict.
> 
> Untested hardware and paths:
> 
> - NPU
> - PCIe
> - GPU, video output, and audio
> - Other low-speed external interfaces

Most of this is irrelevant for netdev. Please write your merge commit
message for the subsystem doing to merge.

Andrew

