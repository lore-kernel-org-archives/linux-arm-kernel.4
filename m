Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A723606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UwMhBig0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zd67dRc9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=; b=UwMhBig0M5UCY2
	1GW/YuVBXZW3Vpd1h1z1ybjonRJBMG5MOyhPpbSDZb2WCayiLw/4+SOsPBAyy4ULZt+IbmcfD35su
	P3j1cI1JgSjlUsGyAtuyL3mUkVeV7IvzyRVrCFRQnsVb4xNdVrbaS/zT9zFnkfNmR6nIiBYyJqwQS
	J43GKGTkJsc89oqZ/Jg6/lEeA2jcxiz0ki9LGcDiLCW5yhRITnNrlsPkmnaKZ1Iu9loickS/LzSNG
	AZj51dbk5UiVteHx2dM9JuvlQxxNwTkKQVmoZKLz5WtwjNYyQZrmoXz8zcBRcOdnjWnZP5efwf2gY
	A9PQJwrFuun61sQK1lhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZtk-000000022FO-110m;
	Tue, 10 Nov 2026 00:39:40 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZth-000000022F1-3oKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 00:39:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so965900a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271176; x=1794875976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=Zd67dRc9W4dBgSDAte92Pd1ulCfiwCT5OnnFyiifRXsL4PTY8rIPCtDlwME5nD4y46
         9sJZEDSoq6kIdwYe7OQTAKV8hkeI6ujk5PS9/Ekj0EwxPG7VqL+45PbmrvLY50Yysnrv
         80PKkP94Xh4cqX/0kn8cMEAcMaxvJAh8Li64pZwbHOlAaza5OfVweeduzOZ8SIyYesxD
         ae1j5u7kfBy1ujtm3pYytUE4eZAX75ME9fVuFJglIYgh3Cb/Q02gsiBQcuFZWGcMBv8j
         9lwXFTCH0OoTYTL89FCUlRg1AnK1bjrRMyiqYgDKL/ICfbroXO/LQufYH7e4P0FA2YCj
         PDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271176; x=1794875976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=zPEevEYLYx43rUT/vI83PMiSo9rChY8bNlc2whGHVVgrMjZmGlc3rOlbECVTmkpsQU
         Tf1B436BInL3pWkJblc9yJdjR3bfaoaJCxmm3PNZf+IL0qbRcKTBY71FeSSQnLlIjrI6
         S1WjKIshaKsS7QY4WZOI4pXwbhXNNOe/xxkRKffR7pI+IoofigKn5PSRxmuVXUjYVAdp
         mxkSQEPFrrxd6jr9QrePAHHs1t8Bo87Os2hRdz9KVuGtTrq5z8YlFoRrUW9oFblONFFJ
         qfeknVfe6T0zBoss4Kb6I++xUc6lwbLsuwftgTWFJJ9mom0l61IO1SXQuh5m6E9Ys07m
         NxfQ==
X-Forwarded-Encrypted: i=1; AL+hErEOtnQVa2MZoKY66wI8U1089wzkttp6Qb+6M2cSa26jJbXcUHGVFH/pNdx3xFF3WujKuSIm+RC4p93pKRU+z4Ux@lists.infradead.org
X-Gm-Message-State: APuU4Z/hMOEmJAyMsCDA01xxpR2P6Jmn9YaB9iO5yJnc2dbUhrJlD8t0
	j2EpUYuQIC/4m/31WdRmV5TLONEgKBVpwa7WHU+kRFTXUpjv+lOaErk9
X-Gm-Gg: AYBFou2SipWyLPZjRpSQTkAeipI9+4I6dY0IYDPgp++UKDw8v7oUY4YWrPlPxefr1QL
	8kDSou7uFdHStfcI15hQ//tDqvadHhvp1ZY7V2Zc+yJLD1zcefzgMQ7zlJ0/UMJo3xV1XsWi34k
	ZLX5RrgfmAHeC9escJeEXUDhLRe+B5nHukomIrA32LvZpgPgx3JvfxRXzbDX4NE8jSYNAQAwTqt
	X+BS99mHPz4XbNYvoaE8p2wwU/L1Qbum+JOUTUoNvithSiy/GPU2Qzza/nIJotxli/GHNhYgyHq
	jeS6E3SpEBUYO8NUeoLhx0w7o1JJsxBmLJsHMleTNxj4OhQqetLX74T425xnLbCLM0BpwFc/hHq
	KLjMirNnO+4StjwtJGwvkZNGv05lmod5lYK8/ZYDg8zsuR9JqqQ3WkEGwxItxpIVwDKeOTtaj6H
	rZqlZx9f7VWz8jM/Mzuh+DgaJ6/Z+NlTGbWroMmEmEyLkdAnaqZWPEMw/zAU+HkQlwza3L8qT56
	v76zlka22Xf07vdTaA4Z3QrVkbt6dnnVOQJehRtKNsMNJlO2s6+xxxv4xjwx0yrjVT2jMDT+46X
	ThC0Eno9AkNAHJacOVMKwNAQehZNXZL33e6XOYo+/8+WGjOSCaqrMcF1Xy8zf6aVxc7ov1Hpkss
	d1wwP
X-Received: by 2002:a17:90b:4ad0:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3b166ad1ee5mr1415032a91.9.1794271175917;
        Mon, 09 Nov 2026 16:39:35 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779d5c8sm1512711a91.2.2026.11.09.16.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:39:34 -0800 (PST)
Message-ID: <d2f451a0-33bb-47ab-b31e-aa40df9d7ab7@gmail.com>
Date: Tue, 10 Nov 2026 08:39:18 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_163937_978022_B86703B2 
X-CRM114-Status: GOOD (  10.70  )
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

Dear Krzysztof,

Thanks for the review

On 11/9/2026 9:16 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Best Regards,
Shan-Chun


