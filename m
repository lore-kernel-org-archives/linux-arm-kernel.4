Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81676606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cR6y3RMR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9OlPYx2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xunVIrIg01k9dWl2kATM9x8o4Anfrw/KbUh3MVWvjx8=; b=cR6y3RMRAFdhU5
	+nES1EEP4fF6Kd4HRZ706sTOHFBKk2Hbd2sgiVjbE2TnHEKvsImUpwkQG1XQE3n2jt1xO9LuO12gm
	bx6jCL2+xMu3Dcp60hPjvB58JC3gFxuQk3K/mIIb/HK2TRKdz8o6NuAaVsI+5nJhgm2F+6prsPvY3
	5NujSXiJQDfFzbO3XluMEowd2DmCf90506vRVHmmaeIeATB5FMjrg4kbc44OQ5DHJA+PcgzYfWYzR
	ru9K1l5TBMjtRPi1Rcyy3dABh635NjbQx36g5rnykE1Sa3oAhl+O/5iCWW8lweTDYKpUrHCDfuJYe
	0r0o+F5rMEBTCDIliGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9e6-00000009N1Y-1SmN;
	Wed, 25 Nov 2026 09:50:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9dS-00000009MlH-0FY8;
	Wed, 25 Nov 2026 09:49:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5331861FCE;
	Wed, 25 Nov 2026 09:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE881F000C6;
	Wed, 25 Nov 2026 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600192;
	bh=xunVIrIg01k9dWl2kATM9x8o4Anfrw/KbUh3MVWvjx8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c9OlPYx2PUb+TnnyiKOi/AM/pSJQPhY8w0GpFwH7x6KuDmzvMvoFeUe03oy8IH28A
	 e83D4o/FNEUNVJ8lxP4q59b4RV3vP9htyOLPp6ibBlYHJDZL1wH4kAujhXA8nOaeCt
	 L6yZhC6EV3WVT1d+YmEIAluNYZ+ahmfbOb5t2Aki+GHhArOPfBH0BcplK2dLDhsTpi
	 FYuaOzGZATGZYemP1Kr5f5rQKtVXxXSTn8+cpjGzy8neqIEZ4xCq6p9su+XoClKwnb
	 U87p0ozEys3cwJt838wrptAU0CZaneC8nvQKMcCGjeu2bEHoGOVAfM/J65diXkG3hC
	 1VwaPWUhkrotA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/8] dt-bindings: arm: rockchip: Add Luckfox Lyra
 Ultra
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-6-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-6-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:49:49 +0100
Message-Id: <179560018960.14607.5906486541495491849.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
> integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
> 512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
> IO expansion interfaces.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - No change

Same commit, what's the point to split such trivial changes?

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

