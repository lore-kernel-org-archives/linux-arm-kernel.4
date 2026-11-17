Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE537606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 02:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cho863Sv;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=G4CQ1Nzw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=arhGKT4vqWM3pFfwqlJs9HcULxRZyX/HFPSkv4gVspE=; b=Cho863Sv8sKl+/
	nNuKUCY9uivWoHLlQIDq1SRGva7/A75RUzBf+QETbIMq6wf1fFIikoqrfMx+ceYsh4l9wfp1cKPi1
	eMZCgQ2POLDU2BnO3vclOO5FEuJCdDHP2Tyet5Pp92F3mYP7lui5XEbZ3eL6kz6JljTjRkdt0VlZX
	QoJTutq/tUiCsewcmeGd1BxKsHZTskA0iGVf5Bba+R2+sdiM02/NaW1OixuR5xa1aDjdhXHpQc3Y1
	QyyDVz1V94+Qykzyc+QIZRn/nuHG9ZNfF/bwsOtRyzeVJtc+zL+br7PU2wQWjLUswSjGKc4Vwg4HJ
	pdDA1uL0PdUy3LSYZJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVSS-00000007XPR-0ewl;
	Wed, 18 Nov 2026 02:31:36 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVSP-00000007XOy-0XCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 02:31:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25BED10F884;
	Wed, 18 Nov 2026 03:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794969089; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=arhGKT4vqWM3pFfwqlJs9HcULxRZyX/HFPSkv4gVspE=;
	b=G4CQ1NzwskCWEv+rGKnsUUbD3uvX1w83G12cEVIAQKyt3RxxMljAMQlJmZCUjWMfd+I2zH
	opgZk8hU8Zd/cBziwYJmL+ISphfBMkeKHJ5QhFX3/jfbZfrZkTA6jcH0cEpNlA29wNIc/X
	mXoyFJ8KHGCag4tjxn2cy/pq4MGVhdV39wMKNqzYmw5skocKh1GgKuzOKpMoEMKfh55xM+
	Y2ZfqAM4flyE3pV1LL6hDjnTCE9MGWOTftzN1M80Lxjs3/z7hxh+nrTOj1rqoqnLJiVBGX
	+f9kWh3L8fsCItBWXkOABbe11JlGUTftmdXsnzsrUuQJjWI0GmD3bNJ086++ng==
Message-ID: <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
Date: Tue, 17 Nov 2026 17:24:49 +0100
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
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
 <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_183133_411652_F269770F 
X-CRM114-Status: GOOD (  16.97  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 14:41, Marek Vasut wrote:
>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>> because it was never documented as actual ABI.  There is no in-kernel
>>> user of it, although there might be U-Boot.  External DTS users cannot
>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>
>>> No new custom aliases are allowed for years now.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>> index bcf63e2ea989..5795b352fccf 100644
>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>> @@ -10,7 +10,6 @@ aliases {
>>>    		serial0 = &usart6;
>>>    		serial1 = &uart8;
>>>    		eeprom0 = &eeprom0;
>>> -		eeprom0wl = &eeprom0wl;
>>>    		rtc0 = &rv3032;
>>>    		rtc1 = &rtc;
>>>    	};
>>
>> U-Boot depends on the alias, so please don't drop this one.
> 
> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
> user as understood in Linux kernel policy "we do not break users".
> Especially that U-Boot does not even consume that DTS! We do not break
> U-Boot as long as it is about documented ABI.
> 
> Here U-Boot won't be really affected, because updating DTB in the
> kernel, does not update the one in bootloader. It does not go that way.
> It could go opposite, so from bootloader -> kernel, but not the other
> way around.
U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .

