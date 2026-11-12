Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B06606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ha3ihlqp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=joCIRw7z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bidjvX+TRs5sF6hJ4qbvArQhbDriXPM1GfNBRtGdlLc=; b=Ha3ihlqppz9+qC
	l44u7AFV/j8HSZKgx4jkh7+JazxYOHwd97IHETaMeX4BvQ6bWRlqjWTHPyxiMMaSihI2orqyU/+6z
	ndeJL2B667l56+imCorT8XdLa9PguZYkfJ+wOVtWcCb0qzu6mdW+OCKSu8BqEAkUBg7oiYdLEg6iH
	OteToyFB83k2oL04KA/3u9v6JwZC1bkrESlOZTZDHvNG7JZCYvju4/aeAYvsOOlPoGj8tvTrUjDOT
	AD6o4ExdBZPi0dvdcVOHeL0T0pINkbp5HPv4vTOUoIO7bR7EGQXqHtAi+Q9Ti/fv9GVm+EaXj73ND
	ib/T3/vtrM4O00Zhsb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZUK-0000000Arje-3xPX;
	Thu, 12 Nov 2026 18:25:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZUI-0000000ArjV-3YGs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:25:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED16422A7;
	Thu, 12 Nov 2026 18:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32FC1F000C4;
	Thu, 12 Nov 2026 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794507930;
	bh=bidjvX+TRs5sF6hJ4qbvArQhbDriXPM1GfNBRtGdlLc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=joCIRw7zJTF/b3SYVpGkuxCGQXazYIvQWt3WYe/r/R6Nx36JBmLz8kzoWZvPwIb2M
	 FY1LF+7VbSC9VizGWLydT0QiNUwBONDnN6MER0t8Drxl8CW7gNBjnVTxNVmZd34Woc
	 wB8DDo1/V93BlE9DC1yP3xZ8B+vzxqsvN6xGLJHw74OJJDMcqsj600y9FzHTPhm6Ez
	 wTiGz2tEG92K3gHIX2jZvqoozvxTeRKgBmHVLvWYJBq2T1z6DFkDWla/jb/Vc/+Oy2
	 MjJlV2t+J+7VCsd93a4lT/2ALUlgCvoZYHakFv6Jh1VapHYoGEwghe58bEeqK3z/N/
	 SKNPW/oXS5AQw==
Date: Thu, 12 Nov 2026 10:25:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ding Hui <dinghui1111@163.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org (open list:STMMAC
 ETHERNET DRIVER), linux-stm32@st-md-mailman.stormreply.com (moderated
 list:ARM/STM32 ARCHITECTURE), linux-arm-kernel@lists.infradead.org
 (moderated list:ARM/STM32 ARCHITECTURE), linux-kernel@vger.kernel.org (open
 list), dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Subject: Re: [PATCH net v6 0/4] net: stmmac: fix RX descriptors and XSK TX
 on resume
Message-ID: <20261112102529.1b79104a@kernel.org>
In-Reply-To: <cover.1794311618.git.dinghui@lixiang.com>
References: <cover.1794311618.git.dinghui@lixiang.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 20:38:51 +0800 Ding Hui wrote:
> This series restores RX descriptor addresses overwritten by hardware
> writeback between disabling NAPI and stopping RX DMA during suspend. It
> also fixes an AF_XDP TX-only resume stall found while testing the series.

Does not apply, please rebase and repost
-- 
pw-bot: cr

