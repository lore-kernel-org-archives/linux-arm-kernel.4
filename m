Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p4aUvV9l;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QhaavtxU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qWeS0NgDvcKbIEpxfzf+p16AQC0TcpaMh9jlYpEYTd0=; b=p4aUvV9l8PjY9h2DafbgsqNJy/
	n3XDwroedyRcIdN7sumgateoyqCG7mWRf10mzfVt3Wfe3CHDOnE0nrdWCZumwwrJy53gWz+pOG8h+
	mdCOLzGphfv0uiPW9tGto63Y6YIGUdmtagoWY1P57JVFFAmsZlot6EgEqFGalJAtQc74T/gNf4ET8
	xtSfun2gN5ee7LRty1F8JT7cE8PYV1o43HfR9Uu7gmAjs3sTAhc73W145RgqGBZkbzTDdNNdw4QjW
	TMLXshDugbg1FtqlOODUCp1rvAj7rIuz1lf4k9x7B5Sl3C6faL8/DDoMCj0Ww2eNKjykqfNigblEv
	5boEY62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSeI-00000009cSO-3HYi;
	Thu, 12 Nov 2026 11:07:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSeI-00000009cSI-0QG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:07:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75D2C6061E;
	Thu, 12 Nov 2026 11:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC4E1F00A05;
	Thu, 12 Nov 2026 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481641;
	bh=qWeS0NgDvcKbIEpxfzf+p16AQC0TcpaMh9jlYpEYTd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhaavtxU3Cm/0IiltpMBMkzhBEsLePlMEHpQEmlftFSzjCYvqxNk9TxD40Qf6at8l
	 vvGgALTEByUzOh5Q807X8FoGvVGQZXcvQSgz/JmJwD00HwVV4o6w037ZqtM9wTgnK2
	 8qrMerHZhm9y2SKYwPHd8B58lzGTo5Nrkivt79K5kjw4LITM4bkyQYby1eZ7R6+dLy
	 GBBq+2xG3/ZRn94s7ylcfP672ZrT7Cz/BbD6B7EstjbKrV0C9wz60RPaOYNUKYNo4g
	 2ZAwZ7H2nvPgx7dLiFFYA98QE7yRzvswBu/sC++RX9cQcWg3JDfGUVxOyJwwRfooaV
	 0d2DxG1Yg0yUQ==
Date: Thu, 12 Nov 2026 12:07:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Message-ID: <20261112-hallowed-cerulean-viper-fe5d4b@quoll>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-2-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111162917.97532-2-cyan2254650260@gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:29:16AM -0500, Pufan Jin wrote:
> Document the ALINX AX7Z020B development board, built around the ALINX
> AC7Z020 system on module.
> 
> Link: https://www.alinx.com/

Drop link, pointless in this context.

> Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


