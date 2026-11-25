Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+e8/Z0J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZiFsYBw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/a3VIv4ZFChd5kfdkP0Njkg9UeMRh1Bzcl+P/hsLLVk=; b=X+e8/Z0JRKW4eW
	kGcWGnXAltXfIrXR6L9k1kvBCp4/1Zn5u5NO3o4gTke0kMlvR+I/6kD+JXALwdxKuTtyRpGJgVnbb
	3O2PTjX8hayAx/Dh5CLuwU9wy2zCRztXOvK3xzt2+mJMAl9jPq2dFkEqdQEUswLwBb0IjD+eXhHb6
	m7uMWCYRasIm1aTSeXtQF0d4vydutZxqZqCQcgIG3gGlmHO8gmF36c+5yo9sG/GfHk4JUHrd8NS+z
	Kay/St96DuMfEYM2GKFhWq+TlV8NcU77NvlJr0Oi3gY4877oCGZp6+H42jVF13fQg29aqCIdX146Z
	x1BSmqyVJ9nmOCd6E1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9e9-00000009N2k-1Ovc;
	Wed, 25 Nov 2026 09:50:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9dc-00000009Mqy-3sIp;
	Wed, 25 Nov 2026 09:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10810623FF;
	Wed, 25 Nov 2026 09:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B991F000C0;
	Wed, 25 Nov 2026 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600203;
	bh=/a3VIv4ZFChd5kfdkP0Njkg9UeMRh1Bzcl+P/hsLLVk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oZiFsYBwIAITHNx9qYWcwD79bQsidds9woKsGWfyGltnnsGKOOnWJLrcZ0u+Sahwi
	 QJHMPEFiA22BW+xRoMgcF6nwZI6YA1W1731lW1ambRMnF0c2VoFLb0Kyjr0hrKsabk
	 TBcK6GMeBuZQkgBH4X3GIX7ttsE7p203zUDaEOrZVO4/U1UxEnxdG3ohk+bHDG/v9M
	 VOehlZSSx/OkYFdSHw0vD1RDmIE5zDctBEXQin41poY4M5q6HRxDOlt8RycX/CW09a
	 uCmij/R50qmVjoUOrcy28sMY7mbXHdWqjg2gNgyhSw+gLs4nEIG1glEb3BE5DTnE4f
	 Njo2EdpASSwwQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: rockchip: Add Luckfox Lyra
 Zero W
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-8-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-8-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:50:00 +0100
Message-Id: <179560020032.14607.12958715929059549043.b4-reply@b4>
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
> Luckfox Lyra Zero W is a compact wireless development board powered by
> the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
> SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
> MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
> peripheral expansion.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

Same commit, squash.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

