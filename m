Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B38606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6VtdJ7U;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=t0Gz1Geq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xyOPebxqczNB/gJfDkZwbXaMote1MbilyqqQ/50z+0A=; b=s6VtdJ7UomqY7lmdCJc2davaWh
	pZDkD41TFkhR+tVhLeHpVVG8Rqlxhe5gsuhAY/co7rCDySIMswFEJLXBh9O8w5tHb+5gwxQd2dJuN
	GuOhq/I3LGVuCe9k75CKZ+v4OtjarCfe2scCXlEs1dMzzQR0TMuoeIYUZdSYtVid65doAZ+eapCCk
	cuJm4ELxzcw2I6e51Qq8FVG6ajzFaYA7sU4YQ8fHEvG7MJs6ZV3AUrqBfsMM0gyQ6mdHbtrNB8G6c
	reB9XlRaSasaYH19tZCFyOa2H7HNk2TNxQLv4N0/iaOj7rJIz9c0gLGPdqLt1pUpV0PKSJNRukeGZ
	OKEFlghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx0h-00000002gCb-43PY;
	Mon, 16 Nov 2026 13:44:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx0f-00000002gBr-086q;
	Mon, 16 Nov 2026 13:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xyOPebxqczNB/gJfDkZwbXaMote1MbilyqqQ/50z+0A=; b=t0Gz1GeqYdligw2G0195Np4K7S
	J4qjzX/g7YT7Ah4vixjvHNMBSUKX4e8o10jS3yArLjMJ7D30wHuxXkxL8YO1F8GiL0WQp8QZ6CFGg
	NaV159lQ3Xn9YmAmpWNAVdeVBeOOCVAjlHSB8oz58yMWc/cElf/Kbu4LRHImYIWnegqs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSx0P-00GvLr-61; Mon, 16 Nov 2026 14:44:21 +0100
Date: Mon, 16 Nov 2026 14:44:21 +0100
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
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
Message-ID: <03378e2f-4667-4cfb-9662-f65629e04321@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_054437_087214_043E5F9A 
X-CRM114-Status: UNSURE (   9.46  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 03:39:14PM +0800, Cunhao Lu via B4 Relay wrote:
> From: Cunhao Lu <1579567540@qq.com>
> 
> Add the rockchip,rk3572-gmac compatible with the snps,dwmac-4.20a
> fallback and require rockchip,php-grf.
> 
> Mark tx_delay and rx_delay as deprecated and disallow them for RK3572
> so new designs do not use the legacy delay properties.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

