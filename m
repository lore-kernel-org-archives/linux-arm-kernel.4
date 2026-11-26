Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E761606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hxcXmT00;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MytotL2R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SfN9tjE1qMNBgqH3WtTiy9LIb6nxDFA36oFjP6dk48c=; b=hxcXmT00lYl3Aw
	yKj3CO9Yoc0t5U56MZbiPgylYpYtjd8qDz/kIw7mehdpUkeCyMp45j6iNm+lS1nGqNjvhW47tc2y6
	eMHCpcSGBoZH2UTr1nR39gf8+rp5/LfSNhNJiGS+s0njowXk7cPLTLSp2lbuyfcfdD5kSogCon/bs
	iTBLPVj2YeXtfm8N4AslQSgJpdA5QycWlFPoNwTxvBNGm1ZvymjIOdUCPPzyPL/bimGdtT0iZtTSE
	HX+KXdaxYrcZdQtnzrEOPvJoLsVDtMr7bNqhfrqHHVGbs/iV/3ngAhOCtYPqR7lnF4BiVQPAcCYew
	1LK+BnwhFXYIJoUPqkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOil-0000000Bq0o-2CnC;
	Thu, 26 Nov 2026 01:56:23 +0000
Received: from mail-m12793.qiye.163.com ([115.236.127.93])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOii-0000000BpzN-03xK;
	Thu, 26 Nov 2026 01:56:22 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5608936e4;
	Thu, 26 Nov 2026 09:51:03 +0800 (GMT+08:00)
Message-ID: <962182b2-6fa0-4aaa-a47a-f78339b5d89e@rock-chips.com>
Date: Thu, 26 Nov 2026 09:50:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Midgy Balon <midgy971@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Freimut Diener <f.diener@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
 <oJj2NKd1Svmsn320H8YWrg@sntech.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <oJj2NKd1Svmsn320H8YWrg@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2158c924b03a7kunm45f8827fed3801
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk5JVh1ISk1MHhkYTU1LSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MytotL2RABnbZ7kXKpcgJJfOfMZqqLOZu0eLKudmYI89t89SNQugmLgZi/eApkau5sbmpblihOSnLYLQimqZHDIMdd4wPMbHyTHpARTdbV5fgHpZOR9tnHJIFVyVBzki9SsoXmlRXEG2JzPbDiNVmJxrfFXwNRl64BUOSFBbxpo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SfN9tjE1qMNBgqH3WtTiy9LIb6nxDFA36oFjP6dk48c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175620_288321_1D819822 
X-CRM114-Status: GOOD (  15.56  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/2026 4:37 AM, Heiko Stuebner wrote:
> Am Mittwoch, 25. November 2026, 11:33:57 Mitteleuropäische Normalzeit schrieb Freimut Diener:
>> A Rockchip power domain can have a supply that is required when
>> powering on the domain but is not required to initialize the power
>> controller.
>>
>> Allow post-init-providers on power-domain child nodes to describe
>> such dependencies.
>>
>> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
> 
> Interesting that this exists since 2024 and this will be the first
> user it seems.
> 
> I've looked at the dtschema for it, and this looks really great for this.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 

That's exactly what we want. :)

I guess it's because the kernel doesn't include this part of the
binding, and it's only included in the dt-schema repository, 
so nobody noticed it?

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/post-init-providers.yaml

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

> 
>> ---
>>  Documentation/devicetree/bindings/power/rockchip,power-controller.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
>> index b41db576f95de..d2b512dd95f63 100644
>> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
>> @@ -147,6 +147,9 @@ $defs:
>>            A number of phandles to qos blocks which need to be saved and restored
>>            while power domain switches state.
>>  
>> +      post-init-providers:
>> +        $ref: /schemas/post-init-providers.yaml#/properties/post-init-providers
>> +
>>        "#power-domain-cells":
>>          enum: [0, 1]
>>          description:
>>
>>
> 

-- 
Best, 
Chaoyi

