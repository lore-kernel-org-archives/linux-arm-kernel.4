Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qw2K/7mj;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=DAPTntny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=; b=qw2K/7mjNbhgR3
	5tT3OxN/ZzD+IAB2AKL/398XQjNccA40bwprbpTuhteQI28JjWRsL/fylRjtRxImoLyiHhqtOJUbR
	ccluWHLFlvLI1jqPSiSe9fhlJmEvOzrP0VKQwkwitssP4JgNj+BVgWxX+p1sfkxNNKdlIP9js2WTp
	eWfwuXUQPjGlqfB8Ll2g3dNPWqsFGYI/BZzYySGCkoxos+dpYCrlYt/6UVbFk7OAMWIF93mbwT6DG
	79WLjzi/qHfcRbZzm0Y/yrV6i5tkqn2mAwTXVABgC8b6IlDpNkDYSbcw2hwJ06D3BZHlB03Og2K4P
	7u/d/FDG+PL8ABpuW1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbKm-0000000051r-1DBF;
	Sun, 15 Nov 2026 14:35:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbKj-0000000050j-3i7R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:35:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-49134c8509fso2652594f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794753351; x=1795358151; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=DAPTntnycByYv/mlOIm9b3H0NikFeK6LUSRBgBd9dYD3geNkgMkJmj2dtYaI4R8XeJ
         zKX+bhCiVp+4KSOne7tuzV++BPHFkC5+T6XJlFiK6PTBPpiOzSAR8iKeqCUjFcEz/TuX
         fatOh78VwRkink52Uflxaw+NyADSZQBzreTuhcqJgFbgchK6mVfdbgSzn1akoZpjsu65
         5EafbUyL2ERdRkrCkETwKCcSWHVIQ7Rmi0rzKPJtUE0KzuknjD/PSuF3AvveNuodUMKP
         1+x59EuN6TGNVXUO/ywEq0qUht69sgSPzXbCYzGvysWN+WgiayUHguV0ZoHwcLIaas1G
         Z4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753351; x=1795358151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=rkL9SK7OeFUp/LzOZT8T7WCmK5mt+SsaL4JpBBvhvUxrokAA8OjNDRABBCKWD7l+3S
         D/Cq40dc8FFPvcVzZLppw3kklC4HF84rzIN9VuX7sadtwcx8wrUEzz5Te/WOZ5tLiwWH
         8c50LRt62LhhoZKn2C0mp6HX8DLAPi8AKDRmYbdtSUP4SBX8Wp8tbOp3vwsst4RT0UmT
         tyaO2IplmD+S09AKkH59iJnh7r5Vl6uPDnzTuPqqHjh1Dvr95OFdkjg9PCND2+kmHAl6
         MEgAYjJW1XZDNbr0RWmLcSMYZ9NWtPKE9ZPLo/M1QfxFKe6MDTNF1CZZOmiJnjKNu1WO
         UkzQ==
X-Forwarded-Encrypted: i=1; AL+hErG/wrPRfQlg+l2/VdJoQEW0LC+0tj+lA0FklLaK2j5fDpjwKTCOmbKsGFStYlGTimFDc8GB3vfpom21uUpcR6hi@lists.infradead.org
X-Gm-Message-State: APuU4Z+9od+UoiFhWPm5IaHmWFcDOs6POhXfpWmHYwm0+GJegByFBlCe
	G+AjCoPKcY3YQlpUVET5XCF4mCHIpRJqWczBUhMT4rAjauDBiabTCyPdggkDtej+FSIzUMnqmY2
	LoOfI
X-Gm-Gg: AYBFou1ELEyQzz5YVR+xjqHhLEjOL92YXfnpKdE8TY+X3BLFRehqzf/p75yiOu6vLns
	iPbMQok5lMCV25t0IViNlrel5vy6Vc611+ntLvD4ds7d79DQacynxKd/00UjYtnOyNIdwozkxJj
	gUlAw8d/+HErFEfoPlIXaQOnhibInCCqfEk99yCfzs+5usQ0Q0R66sFzNJRLb8GYloUVR2y6kEd
	vlZxz1cEGFiQnkGOMYiYOu/ZAN3pm5qzG90RGP9v9ryVMRk/Jsojcg7ryoGyydDa8dKws0Gnuqv
	dTA7TuS8w8ctJAFLzYFsRxOcIeX8QKEn6RciGUAEjD10YjknDWu0yD8nQh7oELNZYV3s3wZsBBD
	NNWF3wnnW1mBVQayVFhQg9v8Et+9UgfWm3tfOXKRsilB3UkFMhSLTNZde0bgLsMAwQZ8lR9/tTu
	f8jt9R/SSah4gQg1gxal6nnQBa7PEr+F1jYy4jminaEbpk3GnFiZ2H3qkwUe/uUhEMnXxMQ/+4M
	kLa4/Z34H9YM2W87DYA9rOJFsFFdTneTXxadm6hTi9jY32OKMEouarhojFkA3WljVXD3OD6o3ga
	LdhT6Nn+Mor1evG54x0NaNk1MMsnmM/qZay5WA==
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr12207691f8f.46.1794753350909;
        Sun, 15 Nov 2026 06:35:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18730077f8f.1.2026.11.15.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:35:49 -0800 (PST)
Message-ID: <0ab96156-9c28-48bf-9c91-d1c9ecf90d5d@tuxon.dev>
Date: Sun, 15 Nov 2026 16:35:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/16] ARM: dts: microchip: sam9x60: Add OTPC node
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-15-ada@thorsis.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261105110715.2486432-15-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_063554_030852_570D4FFA 
X-CRM114-Status: GOOD (  16.88  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Alexander,

On 11/5/26 13:06, Alexander Dahl wrote:
> The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
> interface between the system and the OTP memory.  It also features the
> Unique Product ID (UID) registers containing a unique serial number.
> 
> See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
> Controller (OTPC)" for reference.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - Dropped new microchip,sam9x60-otpc compatible,
>        use microchip,sama7g5-otpc instead
>      
>      v3:
>      - Removed needless header include
>      - Removed clock-names, not part of bindings anymore, and not used by driver
>      
>      v2:
>      - squashed with patch adding the clock properties
> 
>   arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 4b777c61c1e09..996b13300ca06 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -155,6 +155,14 @@ sdmmc1: sdio-host@90000000 {
>   			status = "disabled";
>   		};
>   
> +		otpc: efuse@eff00000 {
> +			compatible = "microchip,sama7g5-otpc", "syscon";
> +			reg = <0xeff00000 0xec>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;

#address-cells, #size-cells are not needed as of now.

Thank you,
Claudiu

