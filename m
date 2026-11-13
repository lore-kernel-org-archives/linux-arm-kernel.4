Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21658606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cxiEUcAF;
	dkim=pass (2048-bit key) header.d=monstr-eu.20260707.gappssmtp.com header.i=@monstr-eu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MbuncMMD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=; b=cxiEUcAFRQM0oF
	k2npu8/o2BwJW08DhKwOu80oWsvdrbVvHH8uIndcKL0GrE6X47I9M4ZEsdEKZaZwA2dLs99cxqrkQ
	V0W3EFSlM59tCz93YqujG368l02JbzrIhoV7w83VueootwybpqYzs8FK1Bqw3ZGswWhYWXT0M0JaQ
	txqMJXvYuwT0cB8hCsDIQAJFEG5jvpxIVmDIT6SlIYEzlU3F3swHNTB9ExtDB761gAVzwRhhIF80z
	DqCZsIUWE8M3LggobsJh8W4p2O6qKi4MYQmFEHonz9lUDIlrpYPrqdHMdBf0v0h0WQYTHfw65NbLz
	+WGmKE3yrOOlYJVh4Fwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqxH-0000000CpGi-3XhK;
	Fri, 13 Nov 2026 13:04:35 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqxD-0000000CpEn-3kSS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:04:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4697404c2bso159093066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20260707.gappssmtp.com; s=20260707; t=1794575069; x=1795179869; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
        b=MbuncMMDHP+4ozvsjxA3yBa2E8xJAUQj/JXskhTNoFSojGP0ud387YZXTcuaqyRJ1l
         cbwoBDXL0qHNdsbKphSiPC3y+s1gNdSu2A90VEQSTgEee/1rD7UOPkDf2NKDfg7t2+8O
         ecsx5zgY1ow7T6TGm3UT4dIMFQfuIgtbCRUpllTKWpfwJSXvBf5N6yAk57INXqqDHlZj
         RzZFIkUXfIaSJAyglLp2F7Jhn0OGh3R0YvgxZ+jzuRtq8rsyUvYOAN5E3TzTSCT1De2g
         x9+sMRhCcJ8aZgteGSHWsQA+XM1xPRwDuECyZLQP2nxropnylx1AHdmRod7Tp5BBf3gS
         6sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575069; x=1795179869;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bko+HUcyhAHNudlJorQZD/sxxlgE8GJ6dUtZz3KykI8=;
        b=PeE8AyTvjKvzpRfz4RHa8CmZ/nMT63KP0wq5d3A3/dhhydoVueq1jwfoSvzSuC4XaV
         ZFNMEhL03Dg5GNSqeDVlWl6IBBZUp0DRGcokfx3nlzesQkneB6q08ek36kYWFXFPIzIG
         jHRZ9EsRm5lnewcJCvSMsHbM2PAHGgbWRqCmFthrZv/TzQcXsmcPnLucrfZUZ9WAP+CX
         MPIk3RHp5CEveV5EvVoSGVA17IRKNSX9dcTSom2m70ebTHIrgjhWrpEU6Er0D/nSOKpc
         sD5019UoyOdfTeNFUYxW91p9mNYJ82/4LOXKJuIx4pCmCB5rdvSqC1mrFnbSVPz/Mvyn
         xu9w==
X-Forwarded-Encrypted: i=1; AL+hErF+AgAxjIrJuhWCl97HiE85FJvn+It4utnj7qTxIve+T5MHF4DBl63W2WydHcwgs20AdeTeo9CBjMB4HYXWb+L0@lists.infradead.org
X-Gm-Message-State: APuU4Z9TT+sR2g14AlvUj4HX1XWV+9iEnjItT8WMtVsoZI0fYIWLzGeb
	dbKO2XnQLOhL0tawxIQ39h89nJcRhwJH9Mz1xDPzgf3IF/ub//Ws1fSnSE7RvqbWjQ==
X-Gm-Gg: AYBFou3rejJ5leVieMoPVlE7TtFa3nzDDu8zROiGQgcR7Qo5eR9nns/XbT7YNctzhx2
	q+gFhRS36l2CH1J4jeEZQAyOoh9reqmYz5oThlH7XdFRX6FRyaTAhRe+A/ZRoUtNl8cfiHbkckD
	s/Brsw64zbAe2otj8gK9I7WrivCYUVMCiifHUVuAsIbvThk8Y8MsYqfaSQt6yHIm2j5UDomXxl9
	meryASHr7v9Bk6HSK2qjFpTy3jlOoqkIwHut6uHPqvufOdAPj60cojI2rRhh0JTtbMHkSzeF/dm
	w2nK0PfWpWMnNuN+K+eQzvjGkcg511VaPF3ieNAWokNDcMb4VNDrxdgK57P8YOKHvrK+MkrFIt+
	7dxUQkF8Wo6nbf521LKAZwpYMeayX9JeWx+9TdGEV4i7mh9wEbImUI6OoLBP2/DU3VhYP35fn+x
	2drLthkyvwGso84ulcos+ZxJ8vLE2mEi0lRe/Z0+1DjvAHVwfZ2yi72cQxu8dLjxMViZewE5kvh
	z+lMbq0HZ2hl3+g8B0+rWN8cKl9w4NAXbQaNmHKFKgKvMUXC//yU98z1+m9w7AN4cb+zXtaYpUZ
	+rgNZ9X2jLveOqwuMuPwF+jnIDRSC3easVIazPULvodGZaK+CqhpHmpETSVvXzmsbN0XWDlFXBZ
	43AurZfiY737l1AG9gKGY2+rwf1iEJl9toxZYKA==
X-Received: by 2002:a17:906:f5a8:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c5096853f0cmr210109966b.49.1794575069275;
        Fri, 13 Nov 2026 05:04:29 -0800 (PST)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm91031666b.75.2026.11.13.05.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:04:28 -0800 (PST)
Message-ID: <b40c2160-f5d4-43ab-88a1-14cb11bf92de@monstr.eu>
Date: Fri, 13 Nov 2026 14:04:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: xilinx: drop unused #phy-cells from the
 DP83867 nodes
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050432_063658_1683A2E1 
X-CRM114-Status: GOOD (  11.74  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/26 10:03, Steffen Trumtrar wrote:
> The DP83867 ethernet PHY nodes have a #phy-cells property, but no node
> refers to them with a phys property; the MACs use phy-handle, which
> takes no arguments. #phy-cells belongs to generic PHY providers.
> 
> Drop it, so the nodes validate against the ti,dp83867 binding once it
> is applied to them.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 2 --
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 1 -
>   10 files changed, 12 deletions(-)
Applied.
M
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


