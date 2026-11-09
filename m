Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0C1606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZKKCUonV;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=IUfk9EUC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kz1mIgE72+hP3r+p69xSMSWxQatJCU8VHnFXsjFvnWQ=; b=ZKKCUonVu62GXm
	i242CJj1Isbgaa34KTV3WCqXn9cgs1CAorcKVjcfB0ZxpVWoL7cERalXJke9DfFGdkiQH8GGlOA2P
	PZljqru61AS8yA3avN7RLDRNk+4ngmOXyYcofrKn+0yoKgvYLoDJdGUCVkizEZrGpA0dv5wSNwW9g
	+R8YR4OqYjsaa1tNQKKpyQJOpzcVKu8y7Ogj1/oAPm9sMXP4n7q09rkyrYD9FmlVe2FBkeEMLuxu1
	98y/sYfZUUM/t/pb5r99pkn0zUJQ4fAQ1aSMquQFjT2kGYbecFvhDpqB/iTd3DkI8+184BTCyL9e3
	/gx3APSxcwaEgomxY8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEEc-0000000H3mZ-28eS;
	Mon, 09 Nov 2026 01:31:46 +0000
Received: from mail-m16023652235.xmail.ntesmail.com ([160.236.52.235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEEY-0000000H3le-3XRb;
	Mon, 09 Nov 2026 01:31:45 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53ed4167e;
	Mon, 9 Nov 2026 09:31:37 +0800 (GMT+08:00)
Message-ID: <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
Date: Mon, 9 Nov 2026 09:31:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
 <f066ac3f-1720-479b-a2e9-198a96d03dd6@rock-chips.com>
 <avDN3pPY5Qwt9B1p@venus>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <avDN3pPY5Qwt9B1p@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1bdeeaabf03a7kunmf2d328634ebabd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS01LVkIdQxkYTx9OGUhLGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=IUfk9EUC04Ij1avNZ2iP9izXA0sNWFMrwytbuHpkYydV2jEY0bB4dnCsK6Ae76E+cfDOLuAhvaP031e0C1PFsLLcbpYIZAvS9TNh63dXnqVYunA8iQdVUK8SUyrJiWIdApiYxOpIyR9N7ETyffilKiKJruYaXFyO7fPwPdoW2II=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Kz1mIgE72+hP3r+p69xSMSWxQatJCU8VHnFXsjFvnWQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_173143_468272_C8B02534 
X-CRM114-Status: GOOD (  18.50  )
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

Hi Sebastian,
On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
> Hello Chaoyi,
> 
> On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
>> Hi Sebastian,
>>
>> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
>>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
>>> combination. It contains a Wanchanglong W552793BAA panel and a
>>> Goodix GT1158 touchscreen. This adds the DT description of it.
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
>>>  1 file changed, 90 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>> index 6a95a8bb6fb8..327ca13b60f0 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
>>>  		regulator-max-microvolt = <12000000>;
>>>  	};
>>>  
>>
>> I seem unable to apply the patch to the latest linux-next tree.
>>
>> So I tried to resolve the conflict manually, but the actual
>> test screen did not display. I will look into this further.
> 
> Strange. The base of this series was Heiko's for-next tree from
> Friday. No RK3588 EVB1 patches landed since then:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=cabb6811c38a46337d5f4252b4dc390f9296856c
> 
> If your board uses the original Rockchip bootloader, which shows a
> Rockchip logo on the panel, you also need Cristian's latest YUV420
> patches that reset VOP2 at probe time avoiding some issues with the
> pre-initialized panel as a side effect. Those were recently applied
> by Heiko to the DRM tree, so testing on linux-next is indeed
> sensible.
> 

Hmm, the newest linux-next tag which I used is next-20261105, and Heiko's 
tree last updated date is1106. I'll give it a try on Heiko's tree.

And I'm using mainline U-Boot, which obtained from the latest nightly build:
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-image-recipes.

The backlight working correctly, and the DCS command has been sent, but nothing display.
Perhaps I should look elsewhere.

> Greetings,
> 
> -- Sebastian

-- 
Best, 
Chaoyi


