Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B25606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z7TD+55p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8nshdp+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TtL3KqSBk5DVOvfn0ak4MET3pxYYw6bVU6RQLBouPhw=; b=z7TD+55pRo7oVhDGKvgOenVuUn
	gFrShkDXPI0DHAsymFWMgJ8B0mmELlTYdrzHXdX7n0DVGvwHcOuAmSTAk8vYplWmbnTJToOCjalyY
	zV656x6TbVvjDaXgtDeJt3bu9tUFb66StLyyQp4lL5vr2bjc4uRfPsO/osQW/MIzJRhd8Q2Xv+O9A
	fuBM1bEPPk35RAz7ing8ZhOb47rr5RWmDr9onJWTyykh0l1oJzvjvdhKhf4tuvNE2TctJi5rlr56D
	rwe8WVBk5J73cjVowzEc4YAnAYLWIq1grLrX8xy4gdlyg1+1gTxCzgEWQHXAQZnxBwmyMdNo7c6fX
	w206gk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgc0-00000000Px4-1J4V;
	Sun, 15 Nov 2026 20:14:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgby-00000000Pww-2Bfu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 20:14:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F56960F01;
	Sun, 15 Nov 2026 20:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1AF1F000C4;
	Sun, 15 Nov 2026 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773640;
	bh=TtL3KqSBk5DVOvfn0ak4MET3pxYYw6bVU6RQLBouPhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8nshdp+1cTplpWg+u6HgSU7CEFtJe60caolIUkF0dIR2yYAjATUBxxFqtWPOz+oq
	 j6/0Wp5hxIf9CTn6FJZyxJdrJf5RXeqtFUPCsoDFZes3Q3XWqiIqDUo0GMBUHih+ok
	 WJuyL+qnoLFvSpiAFHs+h8uUTGYH6ljAga6S/3lvCukI47sRcq6+M35w9cFBRbCcFu
	 8jfLGZEqs0DvJMzUDvL1O/VoyPUFZGDsTcD6HN7Vpl2/EBP7EpiBL3zBNqHmifNoQ8
	 BW2y+yuz6G1YXZIFa37k6z9N+KVyKB70L+UeXlay6NpXgCUjA1mPBfrRMMWCKGE5jY
	 IFLquyDox7uFw==
Date: Sun, 15 Nov 2026 22:13:54 +0200
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Kendall Willis <k-willis@ti.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, s-kochidanadu@ti.com, a-kaur@ti.com, s-tripathi1@ti.com, 
	vishalm@ti.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: at91-kizbox3-hs: consolidate
 gpio-keys pinctrl
Message-ID: <adyxu4zmj4e4wuzokolhpixrkvigvbx7skddz6rwvpc6yq6nl6@lxo2l7tzxqfg>
References: <20260928-gpio-dt-binding-fix-v1-1-552e4b324a36@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-gpio-dt-binding-fix-v1-1-552e4b324a36@ti.com>
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

On Mon, Sep 28, 2026 at 03:33:03PM -0500, Kendall Willis wrote:
> The gpio-keys node had five pinctrl entries (pinctrl-0 through pinctrl-4)
> all mapped to the same state name "default". Merge all phandles into a
> single pinctrl-0 property with one "default" state name. This causes no
> functional change, but is inline with the current kernel style of one
> pinctrl entry per state.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Applied to at91-dt, thanks!

