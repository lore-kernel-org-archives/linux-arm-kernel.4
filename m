Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A91606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F/MwE+lA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZe2Wat5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wPo6XzhRTx3j5aIDGsDw0wc3PGsWDGR9H56Krm0IMPQ=; b=F/MwE+lAOJmce6
	Gf+JL4eAWWmrLhvG6em5iUNLI7icHPyrcfVjCW9aiLT/HG92VgzANVVXE+ENsNGplcj2QjU2pFugu
	BnXvpxDgJHeI9v7fP3MZ9SLodFk5dQojtbOQJq0s3L+ApBvrBFVixZ3GY7DQpl8kC8h9dJBa415PR
	/VT9JebS2P0Pgp3OBZHXshpozDuIfA2fDWFVphytLxII2cyqu7grYZ00dwenqPTYy2PPeqCbzO97k
	ajicXpog/tbo2mbj4rAz2nb1W3v7U6QP1qqjMCatw7CdhgYTM+FfGGFrDb+k/De88GNeyWPjPu3L8
	Cbjs3OxchYGj/Hb5BhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBEc-00000007CX8-3OSe;
	Wed, 11 Nov 2026 16:31:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBEX-00000007CW6-2ogY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDDEB609FB;
	Wed, 11 Nov 2026 16:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE801F00A05;
	Wed, 11 Nov 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794414696;
	bh=wPo6XzhRTx3j5aIDGsDw0wc3PGsWDGR9H56Krm0IMPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JZe2Wat5q3aPIbmoHdO4tpoPCfvK4dKbzi/i8sep1PyLkkoGGeHNHSj+2N+W0nzVT
	 TDl5H5z4slZ+pMdOJCpM/Asy52zCApiw+zr4X5F16ID3eRM2WU0UTqfeUHeQT81LZU
	 NSUaXTJ7lctEIbGjwwLrE8BLvIrE0d2EXYdChU1hBX9LKM6ZiWBBkAEjwsczBGVbVH
	 htyrr1RjRiIkopgDgnjZOQauWon4GjGpy6LVGCA47m+Hu4bZHzKCtPhfkXYWhsF0h1
	 1QmnP3DhgbFgnjW8lIwga8WkARbYnWKaJg2BJV8WgolDm7cd0biyIgAh68Bdx5eLNw
	 9tJkyRebw7gfw==
Message-ID: <01fedef8-9c96-44ac-89d7-a7efdb1cc879@kernel.org>
Date: Wed, 11 Nov 2026 17:31:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] Bluetooth: hci_bcm4377: keep ASPM off only while
 the firmware boots
To: Andre Eikmeyer <dev@deq.rocks>, marcel@holtmann.org, luiz.dentz@gmail.com
Cc: j@jannau.net, neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111120248.21062-1-dev@deq.rocks>
 <20261111120248.21062-4-dev@deq.rocks>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261111120248.21062-4-dev@deq.rocks>
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



On 11/11/26 13:02, Andre Eikmeyer wrote:
> The BCM4377 needs ASPM disabled because of a hardware erratum, and the
> driver disables it on the whole link for as long as the device is bound.
> On the MacBookAir9,1 this keeps the link to the Wi-Fi and Bluetooth chip
> in L0, and the package does not go deeper than PC3.
>
> Disable ASPM only in this function's Link Control register before the
> function level reset and the firmware boot, and restore the saved value
> once the firmware runs. A non-ARI Multi-Function Device enables only the
> ASPM states enabled in all of its functions, so the link stays in L0
> until then.
>
> Tested on a MacBookAir9,1: with ASPM L1 enabled by the PCI core the link
> returns to L1 after probe and after the re-probe that follows ACPI S3,
> Bluetooth and Wi-Fi keep working, and the package reaches PC8 instead of
> PC3 at idle.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---

That quirk only applies to pre-M1 machines so you probably know better 
what's required:

Acked-by: Sven Peter <sven@kernel.org>



Sven

