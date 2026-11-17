Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8BB606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKRHOs2Y;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C5Qz2oVa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b06WvxswBrT9inOTA73+vuSETFIJ937S5Ls5TCRecAs=; b=IKRHOs2YdyrsCo
	CRspqUb5BJrvBeEpWEDzTca4KY3lRmMaxkT+DXYC/qB0WNMZ0fJNBAtPLF3c5ACL4HHS8AdtAbhwj
	w9V9bVL83GOa7fnQTWe6NcrrruNFPWqfoMFZb3Lvv34SvA85Dyvws0gbpPxJcpEzh7IKiBEFubzZn
	gMaB70IL8tUZ28ZWOl0PvpdzdeRKw6YZ2+K+sWtBXzG5+PhDmZ+PACtAYyo3Y9hzf9tKb7HlN3CkJ
	lhsUbX+nKoyVGUCi9jVN2z3VsZVrlf5iQwrHftVPUmOR8x3fxP0LqyPSFxB5i/dQhJsbPZIImENQZ
	14AY7mthwVKQZMIqxSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJRg-00000005zww-44Du;
	Tue, 17 Nov 2026 13:42:00 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJRe-00000005zvs-1M5m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:41:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8D6810F579;
	Tue, 17 Nov 2026 14:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794922911; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b06WvxswBrT9inOTA73+vuSETFIJ937S5Ls5TCRecAs=;
	b=C5Qz2oVad0GZ4Yu12p6RqGcVZxeD9I5PIK0QPek4aQwyKLi88SS5FAsLc4x7nBZBJZpsrB
	1pWMR/cPTrnMHVc9VnsSuFi5Y0a0X3EPzx0NEOjuw8NGpU1tp+y04Ewn7SLkszXOb4fh9u
	sv/aDXDs1aYiBLteizJDCXt28Kz+XAG/PV6+MgKcABp6ehOGD62dwCPWJiFBbSgwvtflYa
	9ciGHKw9hvS2gqZr6EjXEWKxzjup6YbNuIv/VDhdppmTkyqY5TU8JXKUYr+tR7m1P+a6BI
	hC6xK5az0xsUbrhT4ZbdeIoPVHFYkwd3YsjuQZKh3yNFY3UHzAd3TEhzek9G9A==
Message-ID: <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
Date: Tue, 17 Nov 2026 14:41:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_054158_512633_601D0003 
X-CRM114-Status: GOOD (  15.16  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
> The eeprom0wl alias was never approved by Devicetree maintainers,
> because it was never documented as actual ABI.  There is no in-kernel
> user of it, although there might be U-Boot.  External DTS users cannot
> rely on undocumented ABI, thus these are pretty safe to drop.
> 
> No new custom aliases are allowed for years now.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> index bcf63e2ea989..5795b352fccf 100644
> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> @@ -10,7 +10,6 @@ aliases {
>   		serial0 = &usart6;
>   		serial1 = &uart8;
>   		eeprom0 = &eeprom0;
> -		eeprom0wl = &eeprom0wl;
>   		rtc0 = &rv3032;
>   		rtc1 = &rtc;
>   	};

U-Boot depends on the alias, so please don't drop this one.

