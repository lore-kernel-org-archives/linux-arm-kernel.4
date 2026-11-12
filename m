Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64C606A8B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GC8JIZUG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnFxgbB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cs0q7B7MSfaibYoJpjt1BO5ZEbu817EWGpbNhNP+bzo=; b=GC8JIZUG5j92O32GgZYKgnxq7M
	5bt92ayhecMyd6GmjrODruzHQhZUtpo85b0J8GdWSMcMfuHCBsjDdp786Nhx5hhIT2H/Z5Jgz9Kv2
	WdUKfFgncoCdTgTAchqJ3cdkf0oTjtHPi4QLM2peMJgoZEpHfIB/4V/JNRIvQHbG+tI98m4jI5PQz
	3ZZ8EqlsPcenaDoLOB//3ZOQLrxI1YbHVfj3PLEUHsau3ONyfTb5iIbNFPkqO3vTUCGCCD6+jVZ9Q
	m8oBwwfXLKcRSXxKAIhMadCuOTSHo4TMTbDrc3ql2xw+nyt8IRRDv8wFjiX2sRTCWPX+ljMN85Yrg
	OeUjHqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSrZ-00000009fOQ-2SMd;
	Thu, 12 Nov 2026 11:21:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSrS-00000009fLY-1OJ9;
	Thu, 12 Nov 2026 11:20:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90C5160D86;
	Thu, 12 Nov 2026 11:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA131F00A05;
	Thu, 12 Nov 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482457;
	bh=cs0q7B7MSfaibYoJpjt1BO5ZEbu817EWGpbNhNP+bzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jnFxgbB1Do3DL4+8PW+K3S2xaYDWkSDo7VNra7peWZf/0ZN/lxX9wrk7E/jkQEOVv
	 EiGhNfdQmHWk8lZtnd+M+F3nVNU2GrI6FwrymYstyvES/t+9o8EGAZs/ub6ay3VMBF
	 VvHezW8pswmNW/f2ubLsHEqOkvk3G28LwoZkl5HO6YYvYVGs5Mz4S1BRU6xITv4lJW
	 WcQb9RvJ67oLBra0U0f3MRuZgnoUp8deWk8kETX4KrlaUSl3TkP0Is9E0zYEx2Hka/
	 RmUxc1uLyIMHVTr+FcInImdUkOHsIQX52CbxtETLn9lPynpEpZHM/WeVmVzHv9rYFf
	 K1PFz1/frwHvA==
Date: Thu, 12 Nov 2026 12:20:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: atcphy: Add M3 series
Message-ID: <20261112-daring-lively-skua-aae32e@quoll>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-1-c2783b2a53a8@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-t8122-phy-v1-1-c2783b2a53a8@chaosmail.tech>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 04:43:40PM +0100, Sasha Finkelstein wrote:
> M3 series SoCs have new phys that are different enough to need
> a new compatible
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/phy/apple,atcphy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> index 0acac7e3ee67..39461c5dcf20 100644
> --- a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> @@ -55,6 +55,12 @@ properties:
>                - apple,t8112-atcphy
>            - const: apple,t8103-atcphy
>        - const: apple,t8103-atcphy
> +      - const: apple,t8122-atcphy

These two are just 'enum'. That's preferred approach and more
obvious/readable.

Best regards,
Krzysztof


