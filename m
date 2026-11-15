Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rh1pc9K4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWNepf+F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tNzd3USh5F/V2q6XE6vwKSqMU60KollHCRdPjoA6L9w=; b=rh1pc9K42eR73h
	obLdOQR2fqFHJQh61MA4ULHEC8e0WvcoPp/9eMHDj5uXIg1XJc+mxqjNsa2qpMtz2FbGDLIG9ZRR4
	VrS6EFz8Ewy7mv9y/PN2gAyG6o8Irk3Kw+3l6RfwXsAD0wSA5epYlaMkkB7xBbXjIr1bvf9ugTBHK
	bl5BXuxMKveTGhIqgFmt4HBdklhHfgTBTpjJ0//1JzW0wZWZnnaUgcrJ9MyGU1/Uib88wVO7jT6VD
	PWs+X2clYzSPda/a2IpsdY43OnEgNHAxtJd7+z2UTq4yO0ZFBSw3ZcRV1iQf2eawhdUVfZO2ET9+q
	qQnEoiq9QQ9Wnf8wQLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbJV-000000004kr-3Nb7;
	Sun, 15 Nov 2026 14:34:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbJU-000000004kM-1K0S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:34:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90AAD60D67;
	Sun, 15 Nov 2026 14:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A41F000C4;
	Sun, 15 Nov 2026 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753275;
	bh=tNzd3USh5F/V2q6XE6vwKSqMU60KollHCRdPjoA6L9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SWNepf+FKsXuW9Qaef8jRNXzfwf3z4eamYnpgqM5tOpa5RIK7LwRgpvjEN5Ody1Lm
	 9g8Zey9C2Rt2nRVHWz0px4JBnv2AATKNiABDAtdNmEvy6yq1/pc7N8Wvvo/R3q4tWG
	 Mdc95ArXylLKf/DZCJ58eS3xME4yTvldULsodz43tDFWoTnYDcjU5MH4WUgEm9/a+k
	 kYfhOwSYy0VeH1R/H9BpDUU5ibmxvjMKCTdeDArInnsuPMvfha8F/gKVHV45uwMAl+
	 7auBwQV2NK9yPH8gh9iqCuBwrUCWIKbuU4g6ex8xzhrigQtEyylaN8igFcUGTgeZXs
	 2qjRUwuFTt1ng==
Message-ID: <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
Date: Sun, 15 Nov 2026 16:34:30 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-4-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> The main rc oscillator will be needed for the OTPC to work properly.
> 
> The new index introduced here was not used on the four affected SoC
> clock drivers before.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
>      
>      v3:
>      - adapt to different base changes, added lines are the same
>      
>      v2:
>      - new patch, not present in v1
> 
>   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> index 050e5e774b274..830e247ba2532 100644
> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X60_PMC_MCK		1
>   #define SAM9X60_PMC_UPLLCK	2
>   #define SAM9X60_PMC_MAIN	3
> +#define SAM9X60_PMC_MAIN_RC	6
>   #define SAM9X60_PMC_PLLACK	7
>   
>   #endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> index 292c5873e101e..58d2a08116795 100644
> --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X7_PMC_MCK		1
>   #define SAM9X7_PMC_UPLLCK	2
>   #define SAM9X7_PMC_MAIN		3
> +#define SAM9X7_PMC_MAIN_RC	6
>   #define SAM9X7_PMC_PLLACK	7
>   #define SAM9X7_PMC_AUDIOPMCPLL	9
>   #define SAM9X7_PMC_AUDIOIOPLL	10
> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> index 08581418b9115..17105a6bedb54 100644
> --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> @@ -19,6 +19,7 @@
>   #define SAMA7D65_PMC_AUDIOIOPLL		10
>   #define SAMA7D65_PMC_ETHPLL		11
>   #define SAMA7D65_PMC_MCK1		13
> +#define SAMA7D65_PMC_MAIN_RC		14
>   #define SAMA7D65_PMC_LVDSPLL		15
>   #define SAMA7D65_PMC_MCK3		16
>   #define SAMA7D65_PMC_MCK5		17
> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> index 27668634b0a2b..4a1c4af8ecc9a 100644
> --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -19,5 +19,6 @@
>   #define SAMA7G5_PMC_AUDIOIOPLL	10
>   #define SAMA7G5_PMC_ETHPLL	11
>   #define SAMA7G5_PMC_MCK1	13
> +#define SAMA7G5_PMC_MAIN_RC	14

I think we can use 12 instead. Correct me if I'm wrong. Otherwise, you should 
change also driver code to allocate space for this clock. See 
pmc_data_allocate() in drivers/clk/at91/sama7g5.c

Thank you,
Claudiu

