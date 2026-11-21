Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C86606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oSTRY9oy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y63YgXAb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SBI9zebGnI54N6IhLdlHK17/Eo7wuFwwHTz+BmtuMS4=; b=oSTRY9oyAIOnlAvVIqYtm+XuPP
	eHmUmfykrIMkwCqafoTkGaxea0Yb65Ca+dhpS8MZpjeGucAf0PkqLqRi3HpkZxD+K2ILiliBz2Tgk
	pnN5JDrwPu5p+dr2HKHsCYx8JTrrP7qhlSy72kpLmgpz+JM61kYAl0uXKi4bfbPiEP7gh6bokrhVV
	hhirqKuf77YPhZur2yJHL++Vzix6ba6hBrEBIwDq4g+1qWSAZc+oN1lwBLiY3J/uMRMsaSJhUHNUh
	LGwZNtpNWK3Id8IQ/VrceyxyMtIOqSKUwm4sE3mKMdA2PF0g6I0kHakAK/yJddpZ/Mx2PryPrEWLh
	Mzm5mnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUhHo-0000000GzNU-3zya;
	Sat, 21 Nov 2026 09:21:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUhHn-0000000GzNK-1z5I;
	Sat, 21 Nov 2026 09:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9479060D9E;
	Sat, 21 Nov 2026 09:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7E71F000C0;
	Sat, 21 Nov 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252890;
	bh=SBI9zebGnI54N6IhLdlHK17/Eo7wuFwwHTz+BmtuMS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y63YgXAbz645jzqsSUoiwcfVBcI7QfiRBC29S8C+GCCXkyZXgyMcf0ZGgt/Be5eNb
	 7BLEu4siimaHFT/fzzFH1MsJhJfG0JR/Mc0I6xa0TzYWZPuTBb0YIMCA/64MpQQSiL
	 vii64LUaQQosyw/yO9ZzFgxS8Vsj2zO9u+h0EQ8WfOxhwE8/Gm+8bZ7mZ+5gcz8fXU
	 dxa2oeelJn2/J7ReAiuaFHQuoojwxNkmLoJfd6ov6sdgcm1n/b+ujfghdmXtMlinds
	 fLDIeShKMHMy7ncZMldMvFqhf+aqo6wAz2HqzBp6ax/poUN07jQejFh5Q2hhWVbhYV
	 WBRvpaThuWa6Q==
Date: Sat, 21 Nov 2026 10:21:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang <Gary.Yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261121-friendly-slim-jackal-fecccb@quoll>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-2-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117022858.2210212-2-hongliang.yang@cixtech.com>
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

On Tue, Nov 17, 2026 at 10:28:57AM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, the SuperSpeedPlus
> PHY of the two USB3 Type-A ports of the SoC.
> 
> The two lanes are not separate devices: they live in one register
> block, share the same clocks and resets, and are brought up by the

Neither two clocks from clock controller are separate devices... that's
really not the point. I don't get what exactly is here common between
these two lanes, but you have several per-lane registers suggesting they
might be independent.

Best regards,
Krzysztof


