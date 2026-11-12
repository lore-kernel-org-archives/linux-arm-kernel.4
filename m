Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA08606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GsztaGeS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bILaeQWJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fmAmCt8UxjgYWhWHzgyp6r0DP5B2fOuM65Nbsx1mc0o=; b=GsztaGeSfwgYcN
	vrnysVGl/y7fDY8g+wLOGG32WYboVRVh8GlissFBIchC1IBXQkbFC+1S9HJtWOiMw6UWWln3OkONP
	Iv/CJdq2ro68VhS00nYg74OTvwy/FVigGf5kwWz0Xt/97uHxyPIObPBw1/Rxia8SqXPEYkG4Hv/8W
	K37vFOHV1eeR+ohft3IdNOHfP/pcTJtDDYO/dBHSsuR1D2mymRsQyvbcT+zizVKWYrjo8W8kjwpeq
	kW7aLneohQXdVJsfUBkqRi9BYfVBluWVZaxlNKQSXdDsYlR/68B5+O/85/oVLKSCl6ukOXKVZP3fr
	PDYBVI1yRU1ypdajD0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaUJ-0000000Awtm-34RW;
	Thu, 12 Nov 2026 19:29:35 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaUF-0000000AwtQ-0nG4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:29:33 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so59268a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511769; x=1795116569; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmAmCt8UxjgYWhWHzgyp6r0DP5B2fOuM65Nbsx1mc0o=;
        b=bILaeQWJlYdU/DeVadA1eNH8cvqK8X1kI9qd5y7QfrmahJJCXp3RS4vP2c4W/19y0l
         fdJyemvfhnXcWLhg/VWX9mXwObgxsJhXYcbtTYq06KDVqSzeujYsJWnnyAaRK+bbosZU
         UYykd+QeQ+rd4oQbHtq4Y7SMRq0VvPk9kU9WFyujBk2ydlq5Pxu6+zPE4O7vy3/BDKDo
         tulPW4DfzuyNudUFqRqAm6EAIYjtlXm/+UplsOQMH6lz2KthS3+e6ZPzgYHW0LKivi+V
         SNlCNZx8uj+Ay/z9dkEkGRHMPTNsINrgH4y+WaI3+j8GtFTGh/AVcs+xd5NFSwdbx/uk
         Jfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511769; x=1795116569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmAmCt8UxjgYWhWHzgyp6r0DP5B2fOuM65Nbsx1mc0o=;
        b=Azj1SLZNyinRmRJT8QfAAm3QFLINnUKNfG3CyXtWHunfhq1T1cJR3KVkoGoVwJ4lnp
         LwI/UB7s7l6sM5Kz0XtiGpz0lD3k+RhDSL81vnq4pnz0E6T3P3IcVFC9M1h+KZdETjMu
         88aLn5xGvoBNnot4aBA108ptu26dEQshDcdIsBa0myqw4o1flCCVTf3I+poj19L2tDNz
         uQ6x9djYckVFWd/lJcBIocKGHHtTzTPTxL2zuQar6jxgyMYlT4Y7u29vJcuQpvuDymIc
         zD8xMvDx36BdoBNhQnFCyubj2Gwp8FxHiHazhu2PsDHCH83mIZeh6IHe4T5ikNOSIJWN
         gIuA==
X-Forwarded-Encrypted: i=1; AL+hErFT1p9eNiAHtGToTweAQZEo4QfFzmYsCyjdwOrbIqUHWJ1qVMs/YxzFljgLRsGa2khJ09LyBhQ/S/IYMyqqFx3S@lists.infradead.org
X-Gm-Message-State: APuU4Z/Saxh3iuQWNTEzbkR7OoBOCNLoXYVod0d4pS6Ic3/0a61DVAzP
	UHDSW/lSVGE5+WcZMVo0m07KZVRHYd3Fxp2fJiCH7rFhOE9d4wkMCDGN
X-Gm-Gg: AYBFou3CTmon369UlZ/3jDp5h5ID28hpp3m3vnIrg8xwBMggic4KJ+JeF6evnu0Oj4Z
	HVntMWCauzDW7dvZgWliToBy8TUyYPBAlAhIwHLpS/8iUHHhGjqGGtyx0FpCM4AinQT7cLXZpMQ
	JxilRdCMlTGUyA5LESRYH/mSUFdh0adaOgmayTgEfDXPG9btIcF3ayg6jCg00aWZPZ/CVEBvzhJ
	j8ruO0mrAzS9cmNPiaV75XHfuvIoldmMvQVARJ+u59oarIW6cp9RaF8HNuBAHdATrrI+kFCO3QF
	oNWfwvBJpVqDoLxVafbPI8hUKgtogBXph3BVuoQQ9VrTJeQTElvxiKvrvbXVG6lIjgl2Sj5smoq
	PaAPGVgy6zj5mDK50b1E+ws7F4A9o6n0VeYf5FEgumbV0Mlnu5qAXMuLQi7wCRTl/L/qfRdVMFo
	nXmb3ZxRmjmNtQtoBR3sPymy3cyOZ+nVS4uDcgzDIK1gxaS2Un2Nli0ST+JZAw4gtbwBfn+umWF
	yk1+wzbsAgBET+jyZZC5L+uFXtblc+4VM9BDZ3hgR+oL4AZ89JINEv9Om2eTVHpl3EzZzwd7PIi
	25w2n3z3pOzemLGvtT/vXQDHf8GMAv2ZnMxGNzJm8dAVPIQe/53WHRY=
X-Received: by 2002:a17:90b:1f8d:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b1b0a20e04mr73493a91.37.1794511769226;
        Thu, 12 Nov 2026 11:29:29 -0800 (PST)
Received: from [198.18.0.1] ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm5972639a91.9.2026.11.12.11.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:29:28 -0800 (PST)
Message-ID: <f0b7f100-f8cd-4e58-8a67-beda34ad4d06@gmail.com>
Date: Fri, 13 Nov 2026 03:29:23 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-3-cyan2254650260@gmail.com>
 <20261112-mottled-formidable-galago-eb933b@quoll>
Content-Language: en-US
From: Pufan Jin <cyan2254650260@gmail.com>
In-Reply-To: <20261112-mottled-formidable-galago-eb933b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_112931_526640_FB2426E6 
X-CRM114-Status: GOOD (  21.99  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/12/26 7:08 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2026 at 11:29:17AM -0500, Pufan Jin wrote:
>> Add devicetree support for the ALINX AX7Z020B development board.
>> The board is built around the ALINX AC7Z020 system on module with a
>> Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
>> flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
>> host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
>> MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
>> DevCFG FPGA manager is also enabled.
>>
>> The two SMA AD inputs and the spare differential pair are wired to
>> XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
>> always accessible from the PS, so expose these channels via the
>> driver's xlnx,channels property.
>>
>> Link: https://www.alinx.com/
> Drop link. We do not advertise websites, unless it brings some value.
>
>> Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
>> ---
>>   arch/arm/boot/dts/xilinx/Makefile             |   1 +
>>   .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++
>>   .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
>>   3 files changed, 213 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
>>   create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> ...
>
>> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
>> new file mode 100644
>> index 0000000000..472d9fcaaf
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
>> @@ -0,0 +1,142 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * DTS for ALINX AX7Z020B Development Board
>> + *
>> + * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include "zynq-alinx-ac7z020.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +/ {
>> +	model = "ALINX AX7Z020B Development Board";
>> +	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
>> +
>> +	aliases {
>> +		ethernet0 = &gem0;
>> +		serial0 = &uart1;
>> +		serial1 = &uart0;
>> +		mmc0 = &sdhci0;
>> +		spi0 = &qspi;
>> +		i2c0 = &i2c0;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "";
> Drop bootargs, why do you need empty ones anyway?
>
>
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	usb_phy0: phy0 {
> just "phy" or is there phy-1?
>
> Best regards,
> Krzysztof


> Drop link. We do not advertise websites, unless it brings some value.
Agreed. I've removed the link in v3.

> Drop bootargs, why do you need empty ones anyway?

The empty bootargs is not needed. I've removed it.

> just "phy" or is there phy-1?

There is only one USB PHY on this board. I've renamed the node to "phy".

Thanks for the review!

Pufan Jin


