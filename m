Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WLW63au8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjL+all9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=; b=WLW63au8ZdFhns
	3Ml8koj0fY7bY8zYLmRYarb+ykh7LeKIVotQ6/cCoLSkS2WdYBpIsbJs/jEya9yGdgIvXQspaaFl/
	chymO59N1zRXrsnTmFqPkCBs8Vw3c2L5ji1nuTjwaESq16Ecd7UDsIVLARGCI59gf9DXM1mv5Hmpl
	zb2mzugfZ2vA57Sz3HVRVawZn9GSTrXNsfe54O2XxBo5KSO7LSNBHRAKEuU3Ba1quz/uClE4G/QjV
	cF7kVIR0WWBA1B3QeVkXYXjwyV91Hp5iExpAyCeEogJN3gPf4fGjJjgsLolAcy4dzJrefOXLZdPU3
	kOlemGMKvN8wXFKC3/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWIN-00000001gRa-10pa;
	Mon, 09 Nov 2026 20:48:51 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWIE-00000001gPr-3Bwa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:48:49 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso605302b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 12:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257322; x=1794862122; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
        b=LjL+all9ExEOV4mAtJICa7Oc1iTqej7cHDqW6mKbu3yEE/VwkmOZimMB/e+dicJ4qI
         ZhbXnC1VPOZ5d91SzDjIqI9t0n+tup1urb4wdwLdoXinUDQkl/3nERSfCOYp2d/x+G1L
         07qlVbq+sPHIiyiRZq4znYQ08aYKT+GYQYkiMq7GRza4ggUoYFMkKrZaGpSBXTMtuDD4
         9/ui4z81TtiPlhNpj6CT1pUmzSOQNKX85tcxUMhbOFAdF2iYLVd08eamqGJkX5pXHy5r
         D5Gx9knOmv1w4bWa4Tp1dPNqv8Wbo2zw97vNcV8oLmwtvDA2tf9l6WXj6mhpIpjoQshe
         HoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257322; x=1794862122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
        b=n7ewpoizcjaufJQL9BHJBYJiQBunYzgrcFcC6LEEQzl58ylUk/PqrKT1eIu7sU5ovt
         AXEAjBF3X5UAQgsUuzRzJxXgAuPwkg0L19UnG2WayPPU7ObU2r25S3bnf5cm4qMSnqWk
         adkLwdWzidkJeW3sumIY+yW/hftyRZEsphIMTR4Ik5TaCTNy4gHKa3D12u639PrqaPuC
         c4+ollqc1xGpV/ftynAvWWgaOabo69GSMkb4xii47D08PcW7k7t2m5N9kQ6aShjvl5j9
         1uq6lBNvrU0F2gdJ7fSpv/+5WMMB+8pNmdwugq7oXUtHV/a5rZg2zIgoiH3YbE0zSih+
         oMlA==
X-Forwarded-Encrypted: i=1; AL+hErEp9Zs74erPLD/Xr9la8F32DL7/4gJzPCJtzn/XdGV3vGXwqxK2o3XvEkR7Hu7kcpxeN2nntNcp9vl1SurGgCaJ@lists.infradead.org
X-Gm-Message-State: APuU4Z96GjrVLqtgABnceiSoRvQBxcAmLWwLvkbqPEPK3W8FaEOwh18s
	5lpb6MrblsfPeJcyH7Cabxaico2zKdjwTRoyTh9MMoqaL+QagIAyXzYi
X-Gm-Gg: AYBFou3hDkwbhOwYlC03sx4DfTuDmdfD/WyLoHEblR/hMLUN7Qsl9iWT9RtbrTocUsy
	J6rIinYpbpnAyw+2BaHgkyc7IZnxyMBjA90GbuxS8PagTsOgAvpW/Ua5WR+nacKPigSdcuDkNvG
	Nt+hcIHqA04C06A3bW57k2RFWcsWkpKElyGXNxGP0n58qnHjxcWazXhaEm0xAhGHhfy3N3IbXjW
	evfMd3GJHBflvzdFOT+6vprFSK8IZxJhjoPqrNBylAZCzkxbi8sRsWEDrz0xe2SxBxI40Z4o6RK
	xpr2b9vODJwd2gvmtpvgIye0EFnP8a4JPG/rtK6xyuVq6E69DO4UBmzW/foLEXo8bkIfUE7oRXz
	VVsEsYCPPZbyJUMUUnWyg2VuEI7zrpgkUGQPGDPq7f3MZavlUxitIGADGxwhoF2P/4n+5hTI+Px
	MX1yRqC4gwzQgzF4IDVPZ2kCdn1XM51oP+Cxvi2hQXY0i7AU5aWGbwZVg1hubIc8SWbVcOYJG7L
	NFHr4pxBAblcAU658YtyW9diOqpbL/TEbvBzJ3Cz1AhTFHNL9p/kegzh5vqXW1mx/GMN6R4TieP
	kcAS1zKeaZA4XG84Z246GroJI5UjG/jPf8cGtXRKX6Z+xbbkGfONUlk=
X-Received: by 2002:a05:6a20:7f89:b0:3e2:8c23:4d6d with SMTP id adf61e73a8af0-3f172725e92mr417125637.15.1794257321733;
        Mon, 09 Nov 2026 12:48:41 -0800 (PST)
Received: from [198.18.0.1] ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7b37casm129038a12.22.2026.11.09.12.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:48:40 -0800 (PST)
Message-ID: <9a73588a-f5ac-4c9f-bb83-97224173aee7@gmail.com>
Date: Tue, 10 Nov 2026 04:48:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20261109191515.252449-1-cyan2254650260@gmail.com>
 <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
Content-Language: en-US
From: Pufan Jin <cyan2254650260@gmail.com>
In-Reply-To: <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_124846_434596_A182583B 
X-CRM114-Status: GOOD (  14.43  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026/11/10 03:55, Andrew Lunn wrote:

> On Tue, Nov 10, 2026 at 03:15:15AM +0800, Pufan Jin wrote:
>> The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
>> that alone is not sufficient for reliable RGMII operation.  With
>> phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
>> drops ~90% of the packets; the PHY's internal TX/RX delay is required.
> Sorry, but this does not make sense. 4ns of delay is 2ns too many.
>
> You need a proper explanation of what is going on here.
>
>      Andrew

Hi Andrew,

The old comment was wrong. Here is what is actually happening on the
board, with measurements.

Conf A: phy-mode = "rgmii", no tx_delay/rx_delay in the DT.
dwmac-rk programs its defaults tx_delay = 0x30, rx_delay = 0x10; the
PHY's internal delays are disabled. On the board's direct 1Gbps link:

   host -> board ping:  200 sent, 20 received, 90% loss
   board -> host ping:  200 sent, 19 received, 90.5% loss
   mmc_rx_crc_error:    118

Conf B: phy-mode = "rgmii-id".
dwmac-rk programs (0, 0) into the MAC; the PHY inserts its internal
2ns TX/RX delays. On the same direct link:

   host -> board ping:  200/200, 0% loss
   board -> host ping:  200/200, 0% loss
   iperf3 TX:           921 Mbps
   iperf3 RX:           941 Mbps
   mmc_rx_crc_error:    0

The vendor BSP DTS for this board is:

     phy-mode = "rgmii-rxid";
     tx_delay = <0x1b>;
     /* rx_delay = <0x00>; */
     rtl8211f,tx-delay = <0x1b>;

The vendor configures an explicit MAC TX delay and PHY TX/RX delays.
The mainline RTL8211F driver only supports the standard 2ns TX/RX
enable selected by phy-mode; it cannot program the vendor's
fine-grained rtl8211f,tx-delay. With "rgmii-id" the PHY provides the
2ns TX/RX clock delay and the MAC delays are zero, which is the tested
mainline configuration.

The "PCB adds ~2ns" text was never measured and is removed. I will
follow up with a v2 containing the corrected comment and these
measurements.

Pufan


