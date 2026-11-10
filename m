Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C20606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ld0oMrHV;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=G2mrV4dP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GKIy7W9V1DOhRGum57t2Y4YFkP9DEDYp7ywnEyxOco0=; b=ld0oMrHVlTVGI+
	ZpLOWYW05zbwVhUwk1VGJ3eMFmv9WOPZMGNxPvQ0KebdjkBijp6xCybiutbBNhB/6kh2jOZGkB8LD
	5yODnCq+zOiEWOLQxIDXCV7RtKibOO0giBSx0EnCBw7KgdkKxv7KYQmy18qft6Z3pyZs9pPMBUA7K
	ap3hHMtxYaq7rzalu3RY9zOWXN3yhaba4chpO5yYBrll86slmaD1IrFSbMxx1lct+poRiYuYWc6xE
	eZButNhIqFAOMttETr/VH3MVGnFjmY8rBrkB2jBe/UyO5l+jMnNWSqHbmYTLy3Gwjsr3fngpN+iFn
	q8GWDDauBliPU5devdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbI2-000000028B5-3jAl;
	Tue, 10 Nov 2026 02:08:50 +0000
Received: from mail-m1013.netease.com ([154.81.10.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbHy-0000000289e-2ARe;
	Tue, 10 Nov 2026 02:08:49 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54157f5aa;
	Tue, 10 Nov 2026 10:08:36 +0800 (GMT+08:00)
Message-ID: <38fdf732-ffa1-45d4-a436-08d542ed2528@rock-chips.com>
Date: Tue, 10 Nov 2026 10:08:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <avDN3pPY5Qwt9B1p@venus>
 <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
 <5573124.44csPzL39Z@diego> <avIEPncVnojQBqpX@venus>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <avIEPncVnojQBqpX@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c336e29503a7kunm8423815768d9d5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUJNVh5LHx0fGElJS0pCSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=G2mrV4dPhT6SK9ihMPCZt3ZO8snXTozKw2nqL0KEWGC2zddBvJ6jGFGTlBWaeC4v4sNv+DGIOnQilbo5xBHitNVv458i2OLeD7v19yFAjUViMd8hdkAa8dKChvg5wbPQ8tam9+EBf3gI8zeK4zSjx5CzBalS4O7YWjVm8dvMnaY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GKIy7W9V1DOhRGum57t2Y4YFkP9DEDYp7ywnEyxOco0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_180847_122118_E6759E68 
X-CRM114-Status: GOOD (  18.07  )
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

On 11/10/2026 1:51 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Nov 09, 2026 at 02:26:44PM +0100, Heiko Stübner wrote:
>> Am Montag, 9. November 2026, 02:31:35 Mitteleuropäische Normalzeit schrieb Chaoyi Chen:
>>> Hi Sebastian,
>>> On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
>>>> Hello Chaoyi,
>>>>
>>>> On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
>>>>> Hi Sebastian,
>>>>>
>>>>> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
>>>>>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
>>>>>> combination. It contains a Wanchanglong W552793BAA panel and a
>>>>>> Goodix GT1158 touchscreen. This adds the DT description of it.
>>>>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
>>>>>>  1 file changed, 90 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>>>>> index 6a95a8bb6fb8..327ca13b60f0 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>>>>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
>>>>>>  		regulator-max-microvolt = <12000000>;
>>>>>>  	};
>>>>>>  
>>>>>
>>>>> I seem unable to apply the patch to the latest linux-next tree.
>>>>>
>>>>> So I tried to resolve the conflict manually, but the actual
>>>>> test screen did not display. I will look into this further.
>>>>
>>>> Strange. The base of this series was Heiko's for-next tree from
>>>> Friday. No RK3588 EVB1 patches landed since then:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=cabb6811c38a46337d5f4252b4dc390f9296856c
>>>>
>>>> If your board uses the original Rockchip bootloader, which shows a
>>>> Rockchip logo on the panel, you also need Cristian's latest YUV420
>>>> patches that reset VOP2 at probe time avoiding some issues with the
>>>> pre-initialized panel as a side effect. Those were recently applied
>>>> by Heiko to the DRM tree, so testing on linux-next is indeed
>>>> sensible.
>>>>
>>>
>>> Hmm, the newest linux-next tag which I used is next-20261105, and Heiko's 
>>> tree last updated date is1106. I'll give it a try on Heiko's tree.
>>>
>>> And I'm using mainline U-Boot, which obtained from the latest nightly build:
>>> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-image-recipes.
>>>
>>> The backlight working correctly, and the DCS command has been sent, but nothing display.
>>> Perhaps I should look elsewhere.
>>
>> I would assume it could be the SPLL (again).
>>
>> I.e. a recent u-boot change broke the SPL-based forced clock init and Jonas
>> fixed that in [0]. Had the black display again recently too.
>>
>> And it seems it hasn't been merged yet.
> 
> Sounds reasonable. FWIW I only tested with the pre-flashed Rockchip
> U-Boot (as described above). I intentionally keep that on my RK3588
> EVB1, so that I can test RK3588 with vendor TF-A/U-Boot and upstream
> or downstream kernel. All my other boards run upstream TF-A/U-Boot.
> 

That's right. It looks like we've tripped up on SPLL again. :)

The upstream TF-A/U-Boot with that patch makes the panel work. But there
is slight jitter in the displayed content.. I'll look into this further.

Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

