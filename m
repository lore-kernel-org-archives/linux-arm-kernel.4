Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6CE606A8B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 23:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXqzh+Zu;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=NwCSwwiW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DyAnx0ByVIsAT/f0Q66p40vTde+JF3ipSreAz2l30GU=; b=vXqzh+ZuXjzGu1
	gJV6JJzaBarsVMcJY3vkVztPYXejiTHcjr6I1EP/lzLA7/hNVuTYLbnbzuixC5wyOBXgakhBEDowN
	1NTpdc0di5pZI59cfHR/idjMCUEEFPBBQeJpHUmcRIX+eT2WNE7MN4grGNtocUVGvm9Dwt8CRU873
	nysHmnw7Kp7zOjrMmJg6zFEvdpFgqGvoy1j2AX3bNR+pm9iP8eqPRlHfqX90gbiR3jXdndkfJq6dc
	DVUVtzfWtrvpSrVrVhe1I3Cz1uAeXCtvZBreocClCgRj6KwOaeFQoDciGN/S24Bq+fh+s9FY1ckKO
	7/N582Iv1aTIKqM4UdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0oQ-0000000EoKL-3B5c;
	Fri, 13 Nov 2026 23:36:06 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0oN-0000000EoJ1-3quk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 23:36:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3F6B10E7E8;
	Sat, 14 Nov 2026 00:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794612958;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DyAnx0ByVIsAT/f0Q66p40vTde+JF3ipSreAz2l30GU=;
	b=NwCSwwiWQbQHDDLCsQhCbyzc63tJLDIL73/nT4Gn+keHWEYFtv/LEwySStIS3hLesioadd
	pHaLCHR1f2xsNRhdDtK7oTfaAHP95uKBzVbP5nh+idg8uE5Cf2fPp1pqkS7cI1QzkQCKHW
	Y9j+kl5R3sGyptA8wzR8psVlDBYJVvK4gioZJ2LZf7/KZQHv+qUG3HVnIvNHEsrL1Z8oFE
	ymQ4ETQg/6OIJMykskqtYCyxRygLJtNP708k58kXcBBtaL0H9/Dxtq2H5P53MDHpfQTBjI
	ATAPOC5LiZKezsq2AHZVRq5rDLC1SLYWYaAHJmo28Mb6kDJF3ybra4vzTxjoww==
Message-ID: <bf2c6945-f72d-4aa9-a077-7d86f2071da5@nabladev.com>
Date: Sat, 14 Nov 2026 00:35:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH] arm64: dts: st: Update gpio-line-names on STM32MP23xx
 DHCOS SoM
To: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261026125240.76753-1-marex@nabladev.com>
Content-Language: en-US
In-Reply-To: <20261026125240.76753-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_153604_096453_E680357B 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

On 10/26/26 1:52 PM, Marek Vasut wrote:
> Adjust gpio-line-names to match both STM32MP23xx and STM32MP25xx DHCOS
> SoM pads respectively in their matching SoM DTs.
> 
> Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Is there anything to do regarding this fix ? It would be good to include 
this in 7.4 before it is out.

