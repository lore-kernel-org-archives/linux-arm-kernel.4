Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B9606A88D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0/rS4gA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YuG9mpz3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eldvn9/5NmqA8Ewg91TTZ27bKSEW+mGyVA1mL/jn1nc=; b=e0/rS4gA8MX/rlmVoBnhb/EHWn
	TRHnt99McoiFZY62skjzLhaoB7kMEd5Xp0E8u3XEK15LEg+EMbXd/GW2NYhRhnu377sj2nNUJ3CYq
	YfzLpF/C1Ola2mSgFTT6mEfsRU5ZlXd1k1MA+kDXofNRIfh5hIzYJi4rx9ua5er/65oKsEW934RxY
	LasXtMvlhE2MgbTTEjCE+3TK5DV7zGHm07PbZXmtlu984bumgvlioi+OCkOFof2ANjHhENdq3OUB/
	NaPRCDfyKYUqZNDvf9PLEmH1ZyDV7tDKPrzAbQCO53ZJQ2fgCwyoV/b39mnwbMSfnx0SJ99KwKMLF
	AS5bDDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7wX-00000006ktN-2ioz;
	Wed, 11 Nov 2026 13:00:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7wW-00000006ksX-0Sf2;
	Wed, 11 Nov 2026 13:00:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6A21472A9;
	Wed, 11 Nov 2026 13:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DFA1F00A05;
	Wed, 11 Nov 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402047;
	bh=eldvn9/5NmqA8Ewg91TTZ27bKSEW+mGyVA1mL/jn1nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YuG9mpz3ABG925h5Qxyb3ASPt4fOXxSfaMpo1i1r05FLsNC1WYAET939MSY/F3YU3
	 KmlskmUi/Ns8duBw5lXabCDNdpIS90opusva2LYRNwMgd4hwof783ta+rZlNupxG9z
	 vANtYrClaSh0KMIhiwHoEg0hR9DEgY6t/xZlOQfpsnyf2s5o/VzjQ4VEtlmnYnpmOk
	 kwzOWHN/zq6BCy/OwOOxYv6UuNDGFIkBnKNMXKkavhDJ+sa6nIUTkMKBkgnHIHsGFz
	 KqSs33F57n1Ox/TkK93ILiOY8CcRARmH8JjBUyHw9AuY6n5f8Wn3uBkgZv1w28VhGG
	 kNSz2Cq6+Qgmw==
Date: Wed, 11 Nov 2026 14:00:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: serial: mediatek,uart: Add MT6833
Message-ID: <20261111-screeching-badger-of-storm-a9bdf8@quoll>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
 <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 08:22:00PM +0800, Rui Cao wrote:
> Add MediaTek's MT6833 (Dimensity 700). Its UARTs are MT6577-compatible:
> MediaTek's MT6833 device tree gives them "mediatek,mt6577-uart" alone.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


