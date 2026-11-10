Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52B60A2625
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VFFhFArb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqDRPYoz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WsYeUNFxqTV/OrzlGq8nTsJX+pIO5uXJFjiMxn/sKnk=; b=VFFhFArb/Nf1kF
	ZPeQPvSI1bd4sxzLoMrQc/S4XOSfXzzdprM6Pf+wtfjIhAsS+A+32MBNHFD49P+FfCYvq/ErCP2t4
	f4ircfm46A/bV5ELBHSyUjYqUYEoArm71KaG2BioFGxaVAYqm5QDtv2ucAk0FRXQeWumrjnyKry9q
	N9xR/d+uVgp/1A4xSo0SdWLLbRsQVWh51+Bvc/O0osIj4BYuiFcZlnrva7s2iTvIPVQuVAyhqlRwl
	WcC3NRPPuofwKHy9oCEk63QA2YfmokfgtBN4chfIOMOmqqlcOeihRK2dgi38tZSxYHCaV2RCMAc1i
	xJG0QVYxfIhoyN/8uN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsPS-00000004yZ0-2rez;
	Tue, 10 Nov 2026 20:25:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsPR-00000004yYs-2we6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:25:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27C374004A;
	Tue, 10 Nov 2026 20:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D6D1F0089F;
	Tue, 10 Nov 2026 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342337;
	bh=WsYeUNFxqTV/OrzlGq8nTsJX+pIO5uXJFjiMxn/sKnk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nqDRPYozbIG1nBv8/k/gcOOKng47zpBZqf+DGqN8vXDDlb035WFKnFUBhO37LQoAm
	 GHhtDOwe9m1mobKNKwOTWa3Tx0JGnTKozylJev3ktIgKNdniSuawX9Vny/hp6yevXJ
	 Ry/fIP8qQeAbR3fgm7Z25ik21jwFWmixWizekQNKoaHtSA/5DDoaaRO53Y3j0U5Xtp
	 g2ih3XCQo6iamZfoVDyYa+PpGnUs1XZ3YKo+gfQBtmjSZaA0bwWIquVaZMQqmHzYWn
	 MYAzyDQ/VmuLAR2k4YEgwrvFfKG57bRvCoY9OJqhC5hVUTgmhEb7/azmvbGU5MzmZF
	 KUuLMKHmywd1w==
Date: Tue, 10 Nov 2026 12:25:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Schmidbauer <opensource@grische.xyz>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, Oleksij Rempel <o.rempel@pengutronix.de>,
 stable@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
Message-ID: <20261110122536.7cca85ce@kernel.org>
In-Reply-To: <20261104151914.2651241-4-opensource@grische.xyz>
References: <20261104151914.2651241-1-opensource@grische.xyz>
	<20261104151914.2651241-4-opensource@grische.xyz>
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

On Wed,  4 Nov 2026 16:19:13 +0100 Christian Schmidbauer wrote:
>  /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
>  /* Disable Drop TCP/IP csum error */
> +#define DMA_CONTROL_DT		0x04000000

Maybe just me, since I don't know the HW, but what does _DT stand for
in this context? Other bits seem to be documented with a comment,
let's document the new one as well.

Not sure what the comment above the new define is deferring to, either.
Should it be removed?

>  #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
>  #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
-- 
pw-bot: cr

