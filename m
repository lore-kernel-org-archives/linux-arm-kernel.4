Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313CF60A380E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RWOqShp5;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RwvIkZTV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fY4d6y47CamDA7G44TSptxryAErHvm+2SddM192y+64=; b=RWOqShp5vlJO8F
	If1WADN49H2rsyOP7W6WWXfI7QJtT/4ZMB4Fhtv9s1f5V1Irx/Em+IGwC/o4KTLmK/IuCwGhWdFjM
	Nd3RO6z5KA0uShNoDCyOlt+6vKzYkBJFd8DCxsrndA4AWuiGHGyZotgslaxI8dkxceRlNlD1wYGrY
	zXEu1r8ewhdnlrRCfTDcuTMxJGvMbVMZeg09I1XR69jaFSJ3YLV0HyeTHC8628iyqB97ODNKtnOVN
	elgCSUxevOChj/5M6mNYu4gQr0e5WIAr6Omc/v3EKMQNrtgTS6I25r2RsNLeHjtZ0Tfs8+EhxrI+m
	mpWtlUv+5K09v92XVhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJC8-00000008IlZ-11oR;
	Thu, 12 Nov 2026 01:01:40 +0000
Received: from mail-m12859.netease.com ([103.209.128.59])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJC3-00000008Ika-2ob1;
	Thu, 12 Nov 2026 01:01:38 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 545e00560;
	Thu, 12 Nov 2026 09:01:30 +0800 (GMT+08:00)
Message-ID: <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
Date: Thu, 12 Nov 2026 09:01:29 +0800
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1cd462be103a7kunmad3109128fdea8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEIaVktMTUpKTEkeSEkZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=RwvIkZTV3jQpd5yHEhMQAJE6+49uXKgn5dUqP2jzosXCm8+6dUU5dw4KqqX/DoivJuUINoenbcsTAmcpB6BTQ+CWfDl9iRrua0VavXKaDAXLL/UcF9IXvO/F/f/XVsAi6kHyZHe2zbWlOQwtfMsVnRU16rPU1itMv9XWPFY5810=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=fY4d6y47CamDA7G44TSptxryAErHvm+2SddM192y+64=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_170136_348781_2EACF711 
X-CRM114-Status: GOOD (  15.78  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexey,

On 11/11/2026 6:45 PM, Alexey Charkov wrote:
> Hi Chaoyi,
> 
> On Wed, Nov 11, 2026 at 1:31 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hi Alexey,
>>
>> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
>>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
>>> controller and a fixed-voltage VBUS supply.
>>>
>>> Describe it in the device tree, including the wiring for both the USB and
>>> the DP side.
>>>
>>> This makes the data roles follow the Type-C port's negotiation, so the
>>> port stops being host only. It also leaves the VBUS regulator to be
>>> managed by TCPM instead of being hardwired via the tangentially related
>>> phy-supply on a USB controller. DP lanes are also muxed dynamically by
>>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
>>> lane muxing also goes away.
>>>
>>
>> Have you tested this? As far as I know, dw-dp driver does not support
>> Type-C HPD yet.
> 
> I did - it works fine for me under Linux with Sebastian's patches. My
> primary motivation, however, was U-Boot, where the current phy-supply
> hack breaks USB data role switching, due to VBUS being forced
> always-on. With this patch it works, and now the DT actually describes
> the hardware, as it is supposed to.
> 

Oh, I almost forgot about that. I think it should be this patch series[0], right?

But I think we probably need more than just this series, because
richtek,rt1711h does not register the HPD bridge, so we will get this:

[   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending: aux_bridge.aux_bridge: failed to acquire drm_bridge

Maybe you have already added the corresponding patch yourself?
Another option is to use the generic AUX HPD patch[1]. :)

[0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com/
[1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/

-- 
Best, 
Chaoyi

