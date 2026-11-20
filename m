Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0m/L7Tad;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UkpFrErN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cqjUXY2lS/ifY7N0hU3WutIFq+hkCUqoWWB4fNr8nFI=; b=0m/L7Tad8ENFYv
	QpqUEsLMp2ZDWQDKd366Un69wjkVjXfhD1ehvhMq4QY5CfwpHSa2BvTgQx9kO29E9ACYDWmb82E0B
	QWctLUNM6kZQOgJTxaVWDUka/abtyRiazrHUT4H1sRVH0R2y0IEG+iFyW8qmrB9xDrJrNDM6hMAop
	wDF8l8XvSqPXFNF2H0Ynv9C/KrDR7SdbkFGfy9AlHKGzIWHs30f/zfiYH5vW/0D5K5kgaII2slCmP
	0/XLUq85qoeumzwMY7V70O66DWUZmB8xm54OcBxw8Cf3iu1i1fHccZXXWDwK3if7w+n+BoBeE4iyr
	9RXPdgLpcW0ulfMcQAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJFu-0000000EGO9-3hOw;
	Fri, 20 Nov 2026 07:41:58 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJFm-0000000EGMD-06Oh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:41:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2944410FEAE;
	Fri, 20 Nov 2026 08:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795160497; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cqjUXY2lS/ifY7N0hU3WutIFq+hkCUqoWWB4fNr8nFI=;
	b=UkpFrErN5qeJm8+O+gxMVUi+gYgtTmWk6xHNw/Z08CnjroEpkxTOvW1Z3JUjz4lkGakeTX
	QO6AmOShUtPlWSj5eMkhcWSN4VYORcaeruez71cCWMh2TbO4V33Y5imxL+wK8MMXUVn6pZ
	yOWT6oOwGsb7F0QnUkwl8k/1+42Vv3GxApfHL+KOknTnou91nlLbcF+mWha3Db8qaU29YK
	sLKG+PAyPhRr204h5XmfTKMnK583cLDUE3TVxlo3cbzqtQHv2jyzOM6w2hJVmoamUKimFg
	FwZ9Liyix+2/dR1zUVkT5OMBW1f13potj6VnFd8yKPxHQcrqJyCt+ES4WyOeZg==
Message-ID: <77bbefd5-3e05-45e4-9e0a-02063ebf3e06@nabladev.com>
Date: Fri, 20 Nov 2026 08:41:33 +0100
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
 <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
 <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_234150_290028_9AA9180A 
X-CRM114-Status: GOOD (  15.83  )
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

On 11/18/26 1:07 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 17:24, Marek Vasut wrote:
>> On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
>>> On 17/11/2026 14:41, Marek Vasut wrote:
>>>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>>>> because it was never documented as actual ABI.  There is no in-kernel
>>>>> user of it, although there might be U-Boot.  External DTS users cannot
>>>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>>>
>>>>> No new custom aliases are allowed for years now.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>>>     1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>>> index bcf63e2ea989..5795b352fccf 100644
>>>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>>> @@ -10,7 +10,6 @@ aliases {
>>>>>     		serial0 = &usart6;
>>>>>     		serial1 = &uart8;
>>>>>     		eeprom0 = &eeprom0;
>>>>> -		eeprom0wl = &eeprom0wl;
>>>>>     		rtc0 = &rv3032;
>>>>>     		rtc1 = &rtc;
>>>>>     	};
>>>>
>>>> U-Boot depends on the alias, so please don't drop this one.
>>>
>>> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
>>> user as understood in Linux kernel policy "we do not break users".
>>> Especially that U-Boot does not even consume that DTS! We do not break
>>> U-Boot as long as it is about documented ABI.
>>>
>>> Here U-Boot won't be really affected, because updating DTB in the
>>> kernel, does not update the one in bootloader. It does not go that way.
>>> It could go opposite, so from bootloader -> kernel, but not the other
>>> way around.
>> U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .
> 
> Cannot, otherwise it would have document that ABI. That is the
> requirement of using OF_UPSTREAM - you also use upstream ABI. You cannot
> use upstream DTS with downstream ABI.
What option do I have here that does not break existing use case ? (I 
can patch the U-Boot board code which depends on this, that is a non-issue)

Is there a schema which lists approved aliases now ?

