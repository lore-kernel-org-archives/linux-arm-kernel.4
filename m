Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B526606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8o4vqcT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDNxLs5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sUoDtLVA9ljXZnRKq2GB/Pv0PB8RT4+TCqXc44SMSuE=; b=A8o4vqcTJEm5AS
	abSOa8a50mb6Bc1xzr4xrpXTIVZIQHVsPjvHrUfauBNZBKQLy6HXa/Gcheto3ox3iB/xzbJ+awoo8
	AEjoYkO/ka+Pi5fzPLvDk24qjH4+Xm/haMxX2wGxqUFID9mKgn6vtdaVoe8CiSCOd98DigvkiM8qT
	Fl/7bVx1ocjznHce2Ro/hPvusCR7xr9wGoUAAo8sY9QJjvg3UjMkX3H9z6Ko+xWvgLP1SkxhjPssv
	+Y6GiPWBmVqBEx0CMFX6puj3qpmd+3yLe+/wFqNjJqaavtksnjmIFE7MCFgwSS9dQIjSHl+RXk3rr
	IrBuKe/r255yjpXJwrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbDU-000000003UV-1J2H;
	Sun, 15 Nov 2026 14:28:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbDG-000000003Rm-24yl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBC6960EF2;
	Sun, 15 Nov 2026 14:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9091F000C9;
	Sun, 15 Nov 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752889;
	bh=sUoDtLVA9ljXZnRKq2GB/Pv0PB8RT4+TCqXc44SMSuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FDNxLs5fRdTX2OfiBslbQl1uCUUqAX35bBWAmyyH6l3nAqHkyF3K5oOAbL2ofbzAX
	 wz0wFXqmOVOgqhHu+E/lK+tg2N5ZUkEg27SsRTUgVMN0hQ/ju3UkJBK8rP5/NVJr+X
	 PgBUIfNMgB/2Q+R2s8hJ5RVPt+HO+7BqGqmh+gE5a9jWvromvmK4qsKtXWUgiMJiqM
	 IX06SfdO5Bhg5oP7KKacBJR21OClkn314dQDKMpy8wUoeQdnyVoHZ3mT3Iv0r4Td2Q
	 hbm2hGsouezxMfZ6D5PdFxJ5pgLbKYtN9WuzAWgV9esBrb/RxfZY4WvIEgGSaEBRvp
	 nmCbGLBE0bFsQ==
Message-ID: <cde80ba1-a424-4467-b052-785931822014@kernel.org>
Date: Sun, 15 Nov 2026 16:28:07 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] ARM: dts: microchip: Use new per SoC PMC
 bindings
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-13-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-13-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 13:06, Alexander Dahl wrote:
> The bindings were split up per SoC before adding new members for
> missing clocks.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

