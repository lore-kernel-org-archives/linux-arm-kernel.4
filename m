Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6202B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJLFU5vL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChPoefq+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lAoigsXFf7M/yibkKbnUHhQT3j3jKMVmefA5lOY4trI=; b=cJLFU5vLI+xj9O
	0B+tKRqiLpZrKplT5dge5U7G4qxBpuDs7KA9SBiluYiOkrYJGis9heYksuT6F1PJYiKKFyVfQg1w1
	l5Ivcj3+4Oip5FazMCvsKLnjh+BJFuUB/T5j7mtcODcVb5+VfCNEZRkIfN1rTgUzXayiaula8NQwN
	9zdQeQfeuKm4xqLDgj3IckwXaGsWSUG6Yh0E7YgikL7o2EnfjuJSIg8DYr2AAS7ha9un7BNhOfzqz
	mPPDa7itu7wKHavYhwhuLSGfI9vTIhikETol4MoAV+f3qYqO3eoycEfKMMyA6LuNgvOBVHXqmzDUP
	NX1OdiqsZZjbcVl+GQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEO-0000000691U-2L6r;
	Tue, 17 Nov 2026 14:32:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEN-0000000691I-2AX2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:32:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 041574002D;
	Tue, 17 Nov 2026 14:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1201F000C5;
	Tue, 17 Nov 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794925938;
	bh=lAoigsXFf7M/yibkKbnUHhQT3j3jKMVmefA5lOY4trI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ChPoefq+x4qiVkQnlZzPxjrq0rPP1Hxs1FwjrlqmQ3Ej1A/FGCSWV24MrnyE67NVd
	 zwotUju+txYF7P1DN6AnR1H0DHc45dHybFSxRVdvqjLzkhdnPTJBtOqVRPrO6rraGW
	 0tEvQ1T/Gx2IE1Mavk1J5lms8ilTXPMo67GJQdXP3TO5TJ52BFeE1nn3X+p2m/JV2/
	 tTElOhxKRUVHA9bqnpJAqPW8eENF9/ceArsGyEhNVHT/Tv6Wp2McIEYaysc1RS9WaO
	 mTStax5H0VXyOn98EZIGa/CX8+HSf1HMnT8Sb+QIGzQduBjLmF/oq+uYdNmGj0+Ymg
	 x2YMlkgLq3Ujw==
Message-ID: <2412a591-1612-4fd1-a806-7918a3df98af@kernel.org>
Date: Tue, 17 Nov 2026 15:31:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/22] arm64: dts: apple: t8103: Add USB4 ACIO and NHI
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-20-1f80085f93fb@kernel.org>
 <ef65915b-7a61-4f59-926c-375d654ce2d0@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <ef65915b-7a61-4f59-926c-375d654ce2d0@kernel.org>
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 17.11.26 13:39, Krzysztof Kozlowski wrote:
> On 06/09/2026 20:36, Sven Peter wrote:
>> Add the ACIO host router, NHI, DART and M3 mailbox nodes for both Type-C
>> ports on t8103 and connect the host routers to the Type-C connectors.
>> Also describe the USB3 path from each host router to its DWC3 controller
>> so the NHI driver can create the required device link.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi |  95 ++++++++++++++-
>>   arch/arm64/boot/dts/apple/t8103.dtsi      | 184 ++++++++++++++++++++++++++++++
>>   2 files changed, 277 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
>> index 686fb1dd215d..01c942b0a75b 100644
>> --- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
>> +++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
>> @@ -17,6 +17,10 @@ aliases {
>>   		wifi0 = &wifi0;
>>   		atcphy0 = &atcphy0;
>>   		atcphy1 = &atcphy1;
>> +		usb4-0-acio = &usb4_0_acio;
>> +		usb4-0-nhi = &usb4_0_nhi;
>> +		usb4-1-acio = &usb4_1_acio;
>> +		usb4-1-nhi = &usb4_1_nhi;
> 
> Sorry, but what is this all atcphy and usb4-foo doing here? You do not
> get own undocumented aliases.
> 
> How did this sneaked through... where do you have DT bindings maintainer
> acks on this ABI?

Huh, I just wasn't aware of any specific requirements for aliases and 
thought they were just there for convenience.

But sure, I can just drop them and identify the correct nodes to which 
we have to copy tunables in our bootloader by just walking the fdt 
instead, no need to change anything in the dt-bindings for that (either 
in this series or the atcphy one)



Sven

