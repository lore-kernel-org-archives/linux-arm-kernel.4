Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81B5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NXOImmQr;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=i0tdbp/K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1GtwLE2dW7ZsjXW/2HfhRMJDb/gDxI8w5UnCKK1RLMU=; b=NXOImmQrXX3I4l
	rQUxGE/uIrc7lw9dV2cEHUEhkUDCEJVIrkRC8E4dndmUXeQdLLoSVPGOTbP04KdYvoRfWU0Coni31
	SlNR+9DoHPCt+DFa9vo9bnYfMKrXaNe6oc91WUTtqepZcmOI9TrWoL/TBxQN6ZGMHsem+lw0Icci5
	iHLRTIVwjeo+x4Ce9+GWx+8lS09b7581Uyh6GPE2lhAjqV9ff0rmAfQxX/NyRzSXqycJ/1okIM36U
	VYe/ROrT+LfGZSwcKxV+UG32kQ1pJoBJYgE5G/yzuMlkEXDbhjeOh+3889Kk+/bHaACQPGNVOCcEm
	xNv1z0ut8mXhl8/QFAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgoy-0000000BU0R-2GR0;
	Fri, 13 Nov 2026 02:15:20 +0000
Received: from mail-m1044.netease.com ([154.81.10.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgou-0000000BTzG-2hG5;
	Fri, 13 Nov 2026 02:15:19 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54857d4c9;
	Fri, 13 Nov 2026 10:15:12 +0800 (GMT+08:00)
Message-ID: <b961a36f-e7ef-498c-ac4d-efe90f76e289@rock-chips.com>
Date: Fri, 13 Nov 2026 10:15:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
 <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
 <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
 <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
 <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d2b0016003a7kunmdd9bb254ad509
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGhlMVhgYSBhLSktOGhhDT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=i0tdbp/Kds+rR0Vm/TwItaI+X9++Dl3d3CwCBEFhKDTwiVN2vyiHG5m6TEngBlzppXetupZmxmqDOdz8y12q3NvIHKrGYg8GNBBJxV2g3TNRRBC6SrxEE21pZ9V3lkPpfgwQQjmRPHxETdKlSsbiocadM+SWMj27RiYnYsfFObw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1GtwLE2dW7ZsjXW/2HfhRMJDb/gDxI8w5UnCKK1RLMU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_181517_310884_C59955E6 
X-CRM114-Status: GOOD (  15.82  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/2026 9:25 PM, Alexey Charkov wrote:
> On Thu, Nov 12, 2026 at 5:01 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hi Alexey,
>>
>> On 11/11/2026 6:45 PM, Alexey Charkov wrote:
>>> Hi Chaoyi,
>>>
>>> On Wed, Nov 11, 2026 at 1:31 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>>>
>>>> Hi Alexey,
>>>>
>>>> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
>>>>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
>>>>> controller and a fixed-voltage VBUS supply.
>>>>>
>>>>> Describe it in the device tree, including the wiring for both the USB and
>>>>> the DP side.
>>>>>
>>>>> This makes the data roles follow the Type-C port's negotiation, so the
>>>>> port stops being host only. It also leaves the VBUS regulator to be
>>>>> managed by TCPM instead of being hardwired via the tangentially related
>>>>> phy-supply on a USB controller. DP lanes are also muxed dynamically by
>>>>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
>>>>> lane muxing also goes away.
>>>>>
>>>>
>>>> Have you tested this? As far as I know, dw-dp driver does not support
>>>> Type-C HPD yet.
>>>
>>> I did - it works fine for me under Linux with Sebastian's patches. My
>>> primary motivation, however, was U-Boot, where the current phy-supply
>>> hack breaks USB data role switching, due to VBUS being forced
>>> always-on. With this patch it works, and now the DT actually describes
>>> the hardware, as it is supposed to.
>>>
>>
>> Oh, I almost forgot about that. I think it should be this patch series[0], right?
>>
>> But I think we probably need more than just this series, because
>> richtek,rt1711h does not register the HPD bridge, so we will get this:
>>
>> [   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending: aux_bridge.aux_bridge: failed to acquire drm_bridge
>>
>> Maybe you have already added the corresponding patch yourself?
>> Another option is to use the generic AUX HPD patch[1]. :)
>>
>> [0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com/
>> [1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/
> 
> Yes, on my daily-use branch [0] I've got a local commit enabling the
> HPD bridge specifically for TCPCI (69b7c806b334). But that's all
> driver territory, so out of scope for DT discussion ;-)
> 
> [0] https://github.com/flipperdevices/flipper-linux-kernel

Great! Also worked for me.

Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


